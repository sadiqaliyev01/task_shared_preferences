import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_shared_preference/pages/home_page.dart';
import 'package:task_shared_preference/pages/login_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  bool? isLogin;

void getInstance() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  isLogin = pref.getBool("login");
  setState(() {});
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLogin == true ? const HomePage() : const LoginPage(),
    );
  }
}
