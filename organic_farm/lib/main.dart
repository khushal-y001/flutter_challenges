import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:organic_farm/app/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseUrl = dotenv.env["SUPABASE_URL"];
final supabaseKey = dotenv.env["SUPABASE_KEY"];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await Supabase.initialize(
    url: supabaseUrl!,
    anonKey: supabaseKey!,
  );
  runApp(DevicePreview(
      enabled: true,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => const MyApp()));
}
