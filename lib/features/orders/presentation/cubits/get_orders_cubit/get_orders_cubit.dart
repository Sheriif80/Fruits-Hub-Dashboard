import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit(this.ordersRepo) : super(GetOrdersInitial());
  final OrdersRepo ordersRepo;

  Future<void> getOrders() async {
    emit(GetOrdersLoading());
    final result = await ordersRepo.getOrders();
    result.fold(
      (err) => emit(GetOrdersError(err.message)),
      (orders) => emit(GetOrdersSuccess(orders)),
    );
  }
}
