import 'package:albarakah/config/service_locater.dart';
import 'package:albarakah/pages/auth/auth_page.dart';
import 'package:albarakah/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:getIt<SharedPreferences>().getString("token")!=null ?HomePage():AuthPage(),

    );
  }
}
