import 'package:flutter/material.dart';
import 'package:yoshlar/data/model/activity.dart';
import 'package:yoshlar/presentation/yoshlar/main/main_item_screen.dart/history_item_widget.dart';

class NazoratYoshlarHistory extends StatelessWidget {
  static const routeName = 'nazorat_history';
  const NazoratYoshlarHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Aliyev Jasur Karimovich",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Faoliyatlar tarixi sarlavhasi va tugma
              const Text(
                "Faoliyatlar tarixi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Ro'yxat
              Expanded(
                child: ListView(
                  children: [
                    ActivityCard(
                      activity: Activity(
                        title: "Suhbat",
                        description: "Individual suhbat o'tkazildi",
                        result: "Ijobiy, yoshda o'zgarish kuzatilmoqda",
                        date: "2024-03-15",
                        status: ActivityStatus.bajarilgan,
                      ),
                    ),
                    ActivityCard(
                      activity: Activity(
                        title: "Amaliy Ish",
                        description: "Sport to'garagiga yozdirish",
                        result: "Rejalashtirilgan",
                        date: "2024-03-25",
                        status: ActivityStatus.rejalashtirilgan,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
