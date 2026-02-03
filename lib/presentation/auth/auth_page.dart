import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yoshlar/presentation/nazorat/nazorat_screen.dart';
import 'package:yoshlar/presentation/yoshlar/main/main_screen.dart';

import 'widgets/custom_input_widget.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo qismi
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.people_outline,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(height: 24),

              // Sarlavhalar
              const Text(
                "Nazoratdagi Yoshlar",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Tizimga kirish uchun ma'lumotlaringizni kiriting",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),

              // Inputlar
              const CustomTextField(
                label: "Login",
                hintText: "Login",
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                label: "Parol",
                hintText: "******",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                suffixIcon: Icon(Icons.visibility_outlined),
              ),
              const SizedBox(height: 32),

              // Kirish tugmasi
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed(MainScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Ma'sullar tizimiga kirish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Kirish tugmasi
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed(DashboardPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Rahbariyat tizimiga kirish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Parolni tiklash
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Parolni unutdingizmi? "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Tiklash",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
