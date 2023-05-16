import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic_farm/features/authentication/bloc/bloc.dart';
import 'package:organic_farm/services/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) => AuthenticationBloc(AuthenticationState.empty()),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: routes,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          title: 'Flutter Demo',
        ));
  }
}
