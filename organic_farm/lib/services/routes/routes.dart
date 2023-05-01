import 'package:go_router/go_router.dart';
import 'package:organic_farm/services/routes/routes_name.dart';
import '../../features/authentication/welcome_screen.dart';


final routes = GoRouter(routes: [
  GoRoute(path: RoutesName.initialRoute, builder: (context, state) => const WelcomeScreen(),),
  // GoRoute(path: "/login", builder: (context, state) => const Lo(),),
]);