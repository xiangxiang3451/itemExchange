import 'package:flutter/material.dart';
import 'package:item_exchange/screens/loginScreen.dart';
import 'package:item_exchange/viewmodels/postViewmodel.dart';
import 'package:provider/provider.dart';

import 'screens/homeScreen.dart'; // PostViewModel

void main() {
  runApp(
    MultiProvider(
      providers: [
        // 提供 PostViewModel
        ChangeNotifierProvider(create: (_) => PostViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swapee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/onboarding', // 初始路由为引导页
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/homeScreen': (context) => HomeScreen(),
        // '/postScreen': (context) => PostScreen(), // 添加发布页路由
      },
    );
  }
}