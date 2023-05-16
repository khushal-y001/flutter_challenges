import 'package:go_router/go_router.dart';
import 'package:organic_farm/features/authentication/welcome_screen.dart';
import 'package:organic_farm/services/routes/routes_name.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: RoutesName.initialRoute,
    builder: (context, state) => const WelcomeScreen(),
  ),
]);
