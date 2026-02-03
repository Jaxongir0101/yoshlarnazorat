import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yoshlar/presentation/auth/auth_page.dart';
import 'package:yoshlar/presentation/nazorat/jarayonlar/nazorat_jarayon_screen.dart';
import 'package:yoshlar/presentation/nazorat/main/main.dart';
import 'package:yoshlar/presentation/nazorat/masullar/nazorat_masul_screen.dart';
import 'package:yoshlar/presentation/nazorat/yoshlar/nazorat_yoshlar.dart'; // Animatsiyalar uchun

class DashboardPage extends StatefulWidget {
  static const routeName = '/nazorat_dashboard';
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Widget> _pages = [
    const NazoratMainScreen(),
    NazoratYoshlarScreen(),
    const NazoratMasulScreen(),
    const ProcessBody(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: _buildAppBar(),
      body: _pages[_currentIndex],

      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- UI Komponentlari ---
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pushNamed(LoginPage.routeName);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.people, color: Colors.white, size: 20),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "Nazoratdagi Yoshlar",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // Dizayn xususiyatlari
        type:
            BottomNavigationBarType.fixed, // 3 tadan ko'p element bo'lsa shart
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey.shade500,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 0, // Border o'zi ajratib turibdi
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Bosh sahifa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Yoshlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search_outlined),
            activeIcon: Icon(Icons.person_search),
            label: "Mas'ullar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            activeIcon: Icon(Icons.assignment),
            label: 'Jarayonlar',
          ),
        ],
      ),
    );
  }
}
