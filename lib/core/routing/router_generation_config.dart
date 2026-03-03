import 'package:fruits_hub_dashboard/core/routing/app_routes.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentations/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/orders_view.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.dashboardView,
    routes: [
      GoRoute(
        path: AppRoutes.dashboardView,
        name: AppRoutes.dashboardView,

        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: AppRoutes.addProductView,
        name: AppRoutes.addProductView,

        builder: (context, state) => const AddProductView(),
      ),
      GoRoute(
        path: AppRoutes.ordersView,
        name: AppRoutes.ordersView,

        builder: (context, state) => const OrdersView(),
      ),
    ],
  );
}
