import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yoshlar/presentation/nazorat/yoshlar/nazorat_yoshlar_item/history_into_page.dart';

class ProcessBody extends StatefulWidget {
  const ProcessBody({super.key});

  @override
  State<ProcessBody> createState() => _ProcessBodyState();
}

class _ProcessBodyState extends State<ProcessBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sarlavha qismi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ishlash jarayonlari",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Suhbatlar, uchrashuvlar va amaliy ishlar",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Jarayonlar ro'yxati
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildProcessCard(
                name: "Aliyev Jasur Karimovich",
                type: "Suhbat",
                status: "Bajarilgan",
                description: "Individual suhbat o'tkazildi",
                result: "Ijobiy, yoshda o'zgarish kuzatilmoqda",
                officer: "To'rayev Alijon Baxromovich",
                date: "2024-03-15",
                icon: Icons.chat_bubble_outline,
                isCompleted: true,
              ),
              const SizedBox(height: 12),
              _buildProcessCard(
                name: "Karimova Gulnoza Shavkatovna",
                type: "Uchrashuv",
                status: "Bajarilgan",
                description: "Oila bilan uchrashuv",
                result: "Ota-ona bilan kelishuvga erishildi",
                officer: "Qodirova Nilufar Shavkatovna",
                date: "2024-03-18",
                icon: Icons.people_outline,
                isCompleted: true,
              ),
              const SizedBox(height: 12),
              _buildProcessCard(
                name: "Aliyev Jasur Karimovich",
                type: "Amaliy ish",
                status: "Bajarilgan",
                description: "Sport to'garagiga yozdirish",
                result: "Rejalashtirilgan",
                officer: "To'rayev Alijon Baxromovich",
                date: "2024-03-25",
                icon: Icons.fitness_center,
                isCompleted: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProcessCard({
    required String name,
    required String type,
    required String status,
    required String description,
    required String result,
    required String officer,
    required String date,
    required IconData icon,
    required bool isCompleted,
  }) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(NazoratHistoryIntoPage.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chap tomondagi Ikonka foni
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.blue.shade700, size: 22),
            ),
            const SizedBox(width: 12),

            // Ma'lumotlar qismi
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              type,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Status Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isCompleted
                              ? Colors.grey.shade100
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isCompleted
                                ? Colors.transparent
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: isCompleted
                                ? Colors.black87
                                : Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),

                  // Tavsif foni (Box)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tavsif:",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          result,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Pastki ma'lumotlar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        officer,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 12,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
