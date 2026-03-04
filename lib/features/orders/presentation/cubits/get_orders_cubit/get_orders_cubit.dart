import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit(this.ordersRepo) : super(GetOrdersInitial());
  final OrdersRepo ordersRepo;

  StreamSubscription? _streamSubscription;

  void getOrders() {
    emit(GetOrdersLoading());
    // cancel the previous subscription if it exists
    _streamSubscription?.cancel();
    _streamSubscription = ordersRepo.getOrders().listen((result) {
      result.fold(
        (err) {
          emit(GetOrdersError(err.message));
        },
        (orders) {
          emit(GetOrdersSuccess(orders));
        },
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
