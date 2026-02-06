import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:yoshlar/presentation/nazorat/main/diagramma.dart';
import 'package:yoshlar/presentation/nazorat/masullar/widgets/masul_yoshlar.dart';

class NazoratMainScreen extends StatefulWidget {
  const NazoratMainScreen({super.key});

  @override
  State<NazoratMainScreen> createState() => _NazoratMainScreenState();
}

class _NazoratMainScreenState extends State<NazoratMainScreen> {
  List<String> categories = [
    "Probatsiya nazoratidagilar",
    "Ilgari sudlanganlar",
    "Yod g'oyalar ta'siriga tushganlar",
    "Jinoyat sodir etgan voyaga yetmaganlar",
    "Giyohvandlar va spirtli ichimliklar ruju quyganlar",
    "Mehribonlik uyidan chiqqanlar",
    "Agressiv xulq-atvorli yoshlar",
    "Ma'muriy huquqbuzarlik sodir etganlar",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: AnimationLimiter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSectionTitle("Asosiy ko'rsatkichlar"),
              SizedBox(child: _buildMainStats()),
              const SizedBox(height: 24),
              _buildSectionTitle("Toifalar bo'yicha"),
              _buildCategoryGrid(),
              const SizedBox(height: 20),
              RegionsBarChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Bosh sahifa",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          "Nazoratdagi yoshlar statistikasi",
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMainStats() {
    return SizedBox(
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 2,
        children: [
          GestureDetector(
            onTap: () {
              context.pushNamed(MasulYoshlarScreen.routeName);
            },
            child: _statCard("180", "Jami yoshlar", Icons.people, Colors.blue),
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(MasulYoshlarScreen.routeName);
            },
            child: _statCard("100", "O'g'il bolalar", Icons.male, Colors.blue),
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(MasulYoshlarScreen.routeName);
            },
            child: _statCard("90", "Qiz bolalar", Icons.female, Colors.purple),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String value, String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8, // Misol uchun 6 ta toifa
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 5,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.pushNamed(MasulYoshlarScreen.routeName);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "${Random().nextInt(3) + 1}",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categories[index],
                        overflow: TextOverflow.clip,

                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
