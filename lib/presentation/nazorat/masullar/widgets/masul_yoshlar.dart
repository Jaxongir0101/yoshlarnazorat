import 'package:flutter/material.dart';
import 'package:yoshlar/data/model/user.dart';
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
              // context.pushNamed(HistoryPage.routeName);
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
              // context.pushNamed(HistoryPage.routeName);
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

  Widget _buildGenderDropdown(List<String> items, item) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 4, left: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white, // bg-card
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300), // border-input
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: item,
            isExpanded: true, // w-full justify-between effektini beradi
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade600,
              size: 20,
            ),
            dropdownColor: Colors.white,
            style: const TextStyle(color: Colors.black87, fontSize: 13),
            onChanged: (String? newValue) {
              // setState(() { selectedGender = newValue!; });
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
