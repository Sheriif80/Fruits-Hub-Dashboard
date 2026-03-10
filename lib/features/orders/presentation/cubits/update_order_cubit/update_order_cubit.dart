import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/fcm_service.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';
import '../../../../../core/services/get_it_service.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this._ordersRepo) : super(UpdateOrderInitial());

  final OrdersRepo _ordersRepo;

  Future<void> updateOrder({
    required OrderEntity order,
    required OrderStatusEnum status,
  }) async {
    emit(UpdateOrderLoading());
    final result = await _ordersRepo.updateOrderStatus(
      orderId: order.orderID,
      status: status,
    );
    result.fold((err) => emit(UpdateOrderError(message: err.message)), (
      success,
    ) async {
      try {
        final userData = await getIt<DatabaseService>().getData(
          path: 'users',
          docID: order.userID,
        );
        final String? token = userData['fcmToken'];
        if (token != null && token.isNotEmpty) {
          // دالة بتحول الـ Enum لكلمة عربي شكلها حلو
          final String statusText = _getStatusText(status);

          await FcmService.sendNotification(
            deviceToken: token,
            title: 'تحديث حالة الطلب 📦',
            body:
                'طلبك رقم #${order.orderID.substring(0, 5)} تم حديث حالته : $statusText',
          );
        }
      } catch (e) {
        log("failed to send automatic notification to user: $e");
      }
    });
  }

  String _getStatusText(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.pending:
        return 'قيد الانتظار ⏳';
      case OrderStatusEnum.accepted:
        return 'تم القبول ✅';
      case OrderStatusEnum.inTransit:
        return 'جاري التجهيز 🛒';
      case OrderStatusEnum.outForDelivery:
        return 'في الطريق إليك 🚚';
      case OrderStatusEnum.delivered:
        return 'تم التوصيل بنجاح ✅';
      case OrderStatusEnum.cancelled:
        return 'تم الإلغاء ❌';
      default:
        return 'تم التحديث';
    }
  }
}
