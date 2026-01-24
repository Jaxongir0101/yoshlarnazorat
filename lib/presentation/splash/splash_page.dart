import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yoshlar/presentation/auth/auth_page.dart';
import 'package:yoshlar/presentation/main/main_screen.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void goToHomePage() {
    context.pushReplacementNamed(MainScreen.routeName);
  }

  void goToAuthPage() {
    context.pushReplacementNamed(LoginPage.routeName);
  }

  @override
  void initState() {
    super.initState();
    int time = 2;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      time--;
      if (time == 0) {
        init();
        timer.cancel();
      }
    });
  }

  Future<void> init() async {
    context.pushReplacementNamed(MainScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
