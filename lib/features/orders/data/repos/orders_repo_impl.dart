import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/app_end_points.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl({required this.databaseService});
  @override
  Stream<Either<Failures, List<OrderEntity>>> getOrders() async* {
    try {
      final result = databaseService.getStreamData(
        path: AppEndPoints.ordersCollection,
      );
      await for (final snapshot in result) {
        final orders = (snapshot as List<Map<String, dynamic>>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> updateOrderStatus({
    required OrderStatusEnum status,
    required String orderId,
  }) async {
    try {
      await databaseService.updateData(
        path: AppEndPoints.updataOrdersCollection,
        data: {"status": status.name},
        docID: orderId,
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
