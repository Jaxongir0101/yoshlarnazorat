import 'package:easy_search_bar_2/easy_search_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:yoshlar/data/model/user.dart';
import 'package:yoshlar/presentation/main/widgets/main_widget.dart';

class MainScreen extends StatefulWidget {
  static const routeName = 'main';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController textController = TextEditingController();
  String searchValue = '';
  bool isSearchActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: EasySearchBar2(
        title: const Text(
          'Nazoratdagi yoshlar',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),

        // Qidiruv maydoniga yozilgan har bir harfda ishlaydi
        onSearch: (value) {
          setState(() {
            searchValue = value;
            debugPrint("Qidirilmoqda: $value");
          });
        },

        // --- Ochilganini/Yopilganini bilish uchun callbacklar ---
        onSuggestionTap: (data) {
          debugPrint("Taklif bosildi: $data");
        },

        // Search bar dizayni
        searchBackgroundColor: Colors.white,
        searchCursorColor: Colors.blue,
        searchHintText: "Ism bo'yicha qidiruv...",

        // Actions qismi (Ikonkalar)
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: const CircleAvatar(
            radius: 16,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, size: 20, color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 20),
          const Text(
            "Jami yoshlar",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          // Misol uchun bitta karta
          UserCardWidget(
            user: UserModel(
              name: "Aliyev Jasur Karimovich",
              birthDate: "2005-03-15",
              gender: "O'g'il bola",
              location: "Toshkent shahri, Chilonzor tumani...",
              status: "Ta'lim Olmoqda",
              activity: "O'qimoqda",
              riskLevel: "O'rta xavf",
              tags: ["Probatsiya nazoratidagilar", "Ma'muriy huquqbuzarlik..."],
              categories: ["Ta'limdagi qiyinchiliklar", "Oilaviy muammolar"],
            ),
          ),
          UserCardWidget(
            user: UserModel(
              name: "Aliyev Jasur Karimovich",
              birthDate: "2005-03-15",
              gender: "O'g'il bola",
              location: "Toshkent shahri, Chilonzor tumani...",
              status: "Ta'lim Olmoqda",
              activity: "O'qimoqda",
              riskLevel: "O'rta xavf",
              tags: ["Probatsiya nazoratidagilar", "Ma'muriy huquqbuzarlik..."],
              categories: ["Ta'limdagi qiyinchiliklar", "Oilaviy muammolar"],
            ),
          ),
          UserCardWidget(
            user: UserModel(
              name: "Aliyev Jasur Karimovich",
              birthDate: "2005-03-15",
              gender: "O'g'il bola",
              location: "Toshkent shahri, Chilonzor tumani...",
              status: "Ta'lim Olmoqda",
              activity: "O'qimoqda",
              riskLevel: "O'rta xavf",
              tags: ["Probatsiya nazoratidagilar", "Ma'muriy huquqbuzarlik..."],
              categories: ["Ta'limdagi qiyinchiliklar", "Oilaviy muammolar"],
            ),
          ),
        ],
      ),
    );
  }
}
