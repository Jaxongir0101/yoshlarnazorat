import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yoshlar/data/model/user.dart';
import 'package:yoshlar/presentation/nazorat/masullar/widgets/attacht_yoshlar.dart';
import 'package:yoshlar/presentation/yoshlar/main/widgets/main_widget.dart';

class MasulYoshlarScreen extends StatefulWidget {
  static const routeName = 'masul_yoshlar';
  const MasulYoshlarScreen({super.key});

  @override
  State<MasulYoshlarScreen> createState() => _MasulYoshlarScreenState();
}

class _MasulYoshlarScreenState extends State<MasulYoshlarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Nazoratdagi yoshlar",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add, color: Colors.black),
            onPressed: () {
              context.pushNamed(AttachYouthScreen.routeName);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 8),
          // Misol uchun bitta karta
          GestureDetector(
            onTap: () {
              // context.pushNamed(HistoryPage.routeName);
            },
            child: UserCardWidget(
              user: UserModel(
                name: "Aliyev Jasur Karimovich",
                image: "assets/images/person.jpeg",
                birthDate: "2005-03-15",
                gender: "O'g'il bola",
                location:
                    "Jizzax shahar, Sayiljoyi mahallasi, Narimonoc ko'chasi 8-uy",
                status: "Ta'lim Olmoqda",
                activity: "O'qimoqda",
                riskLevel: "O'rta xavf",
                tags: [
                  "Probatsiya nazoratidagilar",
                  "Ma'muriy huquqbuzarlik...",
                ],
                categories: ["Ta'limdagi qiyinchiliklar", "Oilaviy muammolar"],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // context.pushNamed(HistoryPage.routeName);
            },
            child: UserCardWidget(
              user: UserModel(
                name: "Aliyev Jasur Karimovich",
                image: "assets/images/person.jpeg",
                birthDate: "2005-03-15",
                gender: "O'g'il bola",
                location:
                    "Jizzax shahar, Sayiljoyi mahallasi, Narimonoc ko'chasi 8-uy",
                status: "Ta'lim Olmoqda",
                activity: "O'qimoqda",
                riskLevel: "O'rta xavf",
                tags: [
                  "Probatsiya nazoratidagilar",
                  "Ma'muriy huquqbuzarlik...",
                ],
                categories: ["Ta'limdagi qiyinchiliklar", "Oilaviy muammolar"],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // context.pushNamed(HistoryPage.routeName);
            },
            child: UserCardWidget(
              user: UserModel(
                name: "Aliyev Jasur Karimovich",
                image: "assets/images/person.jpeg",
                birthDate: "2005-03-15",
                gender: "O'g'il bola",
                location:
                    "Jizzax shahar, Sayiljoyi mahallasi, Narimonoc ko'chasi 8-uy",
                status: "Ta'lim Olmoqda",
                activity: "O'qimoqda",
                riskLevel: "O'rta xavf",
                tags: [
                  "Probatsiya nazoratidagilar",
                  "Ma'muriy huquqbuzarlik...",
                ],
                categories: ["Ta'limdagi qiyinchiliklar", "Oilaviy muammolar"],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
