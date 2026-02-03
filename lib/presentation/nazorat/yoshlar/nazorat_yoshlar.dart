import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yoshlar/data/model/user.dart';
import 'package:yoshlar/presentation/nazorat/yoshlar/nazorat_yoshlar_item/add_yoshlar.dart';
import 'package:yoshlar/presentation/nazorat/yoshlar/nazorat_yoshlar_item/nazorat_yoshlar_history.dart';
import 'package:yoshlar/presentation/yoshlar/main/widgets/main_widget.dart';

class NazoratYoshlarScreen extends StatefulWidget {
  const NazoratYoshlarScreen({super.key});

  @override
  State<NazoratYoshlarScreen> createState() => _NazoratYoshlarScreenState();
}

class _NazoratYoshlarScreenState extends State<NazoratYoshlarScreen> {
  List<String> genderItems = ["Barcha jinslar", "Erkak", "Ayol"];

  String selectedGender = "Barcha jinslar";

  List<String> hudud = [
    "Barcha hududlar",
    "Jizzax shahri",
    "Baxmal tumani",
    "Zafarobod tumani",
    "Forish tumani",
  ];
  String hududSelected = "Barcha hududlar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 20),

          // Sarlavha va "Qo'shish" tugmasi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Jami yoshlar",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Jami: 180 nafar",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  context.pushNamed(AddYouthScreen.routeName);
                },
                icon: const Icon(Icons.add, size: 18),
                label: const Text("Qo'shish"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              _buildGenderDropdown(hudud, hududSelected),
              _buildGenderDropdown(genderItems, selectedGender),
            ],
          ),
          const SizedBox(height: 8),
          // Misol uchun bitta karta
          GestureDetector(
            onTap: () {
              context.pushNamed(NazoratYoshlarHistory.routeName);
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
