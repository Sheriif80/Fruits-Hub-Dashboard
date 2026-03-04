import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this._ordersRepo) : super(UpdateOrderInitial());

  final OrdersRepo _ordersRepo;

  Future<void> updateOrder({
    required String orderId,
    required OrderStatusEnum status,
  }) async {
    emit(UpdateOrderLoading());
    final result = await _ordersRepo.updateOrderStatus(
      orderId: orderId,
      status: status,
    );
    result.fold(
      (err) => emit(UpdateOrderError(message: err.message)),
      (success) => emit(UpdateOrderSuccess()),
    );
  }
}
