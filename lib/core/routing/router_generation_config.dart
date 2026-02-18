import 'package:fruits_hub_dashboard/core/routing/app_routes.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentations/views/dashboard_view.dart';
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
    ],
  );
}
