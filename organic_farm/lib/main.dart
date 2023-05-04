import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:organic_farm/services/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/authentication/bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';

// final supabaseUrl = dotenv.get("SUPABASE_URL");
// final supabaseKey = dotenv.get("SUPABASE_KEY");
final supabaseUrl = dotenv.env["SUPABASE_URL"];
final supabaseKey =dotenv.env["SUPABASE_KEY"];

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await Supabase.initialize(
    url: supabaseUrl!,
    anonKey: supabaseKey!,
  );
  // DevicePreview(
  //   builder: (context) => const MyApp(), // Wrap your app
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(AuthenticationState.empty()),
        ),
      ],
      child:
      MaterialApp.router(
        routerConfig: routes,
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        title: 'Flutter Demo',
      )
    );
  }
}
