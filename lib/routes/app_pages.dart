import 'package:activity_1/routes/app_routes.dart';
import 'package:activity_1/screens/home/home_screen.dart';
import 'package:activity_1/screens/imc/imc_screen.dart';
import 'package:activity_1/screens/salary/salary_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.imc,
      builder: (context, state) => const ImcCalculatorScreen(),
    ),
    GoRoute(
      path: AppRoutes.salary,
      builder: (context, state) => const SalaryCalculatorScreen(),
    ),
  ],
);
