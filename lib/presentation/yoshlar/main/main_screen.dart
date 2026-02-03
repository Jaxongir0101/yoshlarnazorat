import 'package:easy_search_bar_2/easy_search_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yoshlar/data/model/user.dart';
import 'package:yoshlar/presentation/yoshlar/main/main_item_screen.dart/history_screen.dart';
import 'package:yoshlar/presentation/yoshlar/main/widgets/main_widget.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 20, color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 12),
          const Text(
            "Bosh sahifa",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Ma'sul shaxs haqida ma'lumot",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          _buildOfficerInfoCard(),
          const SizedBox(height: 8),
          const Text(
            "Yoshlar ro'yxati",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          // Misol uchun bitta karta
          GestureDetector(
            onTap: () {
              context.pushNamed(HistoryPage.routeName);
            },
            child: UserCardWidget(
              user: UserModel(
                name: "Aliyev Jasur Karimovich",
                image: "assets/images/person.jpeg",
                birthDate: "2005-03-15",
                gender: "O'g'il bola",
                location: "Toshkent shahri, Chilonzor tumani...",
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
              context.pushNamed(HistoryPage.routeName);
            },
            child: UserCardWidget(
              user: UserModel(
                name: "Aliyev Jasur Karimovich",
                image: "assets/images/person.jpeg",
                birthDate: "2005-03-15",
                gender: "O'g'il bola",
                location: "Toshkent shahri, Chilonzor tumani...",
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
              context.pushNamed(HistoryPage.routeName);
            },
            child: UserCardWidget(
              user: UserModel(
                name: "Aliyev Jasur Karimovich",
                image: "assets/images/person.jpeg",
                birthDate: "2005-03-15",
                gender: "O'g'il bola",
                location: "Toshkent shahri, Chilonzor tumani...",
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

  Widget _buildOfficerInfoCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8EEF3)),
      ),
      child: Row(
        children: [
          // Avatar qismi
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue.shade50,
            child: const Icon(Icons.person, color: Color(0xFF3384C3)),
          ),
          const SizedBox(width: 12),
          // Ma'lumotlar
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ergashev Dilshod Anvarovich",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Bosh mutaxassis",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.phone_outlined,
                      size: 14,
                      color: Color(0xFF3384C3),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "+998 90 123 45 67",
                      style: TextStyle(fontSize: 13, color: Color(0xFF3384C3)),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Jizzax shahri",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
