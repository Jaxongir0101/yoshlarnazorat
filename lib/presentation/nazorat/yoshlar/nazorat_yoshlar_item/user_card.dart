import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yoshlar/data/model/user.dart';
import 'package:yoshlar/presentation/nazorat/yoshlar/nazorat_yoshlar_item/nazorat_yoshlar_history.dart';

class NazoratUserCardWidget extends StatelessWidget {
  final UserModel user;

  const NazoratUserCardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(NazoratYoshlarHistory.routeName);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        "assets/images/person.jpeg",
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Tug'ilgan yil va Jins
                          Text(
                            " • Tug'ulgan sana: ${user.birthDate}\n • Jinsi: ${user.gender}",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _infoRow(Icons.location_on_outlined, user.location),
              _infoRow(Icons.school_outlined, user.status),
              _infoRow(Icons.work_outline, user.activity),

              const SizedBox(height: 4),
              // Taglar (Qora rangli)
              _buildCardButton(
                Icons.admin_panel_settings_outlined,
                user.tags[0],
                Colors.black,
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Icon(Icons.person_outline, size: 24, color: Colors.blue),
                    SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "To'rayev Alijon Baxromovich",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        Text(
                          "Bosh mutaxassis",
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.call, size: 18, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(
                      "+998 90 123 45 67",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
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

  // Yordamchi metodlar
  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey[700]),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildCardButton(IconData icon, String label, Color color) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Icon(icon, size: 16),
      ),
      label: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Text(label, style: const TextStyle(fontSize: 13)),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 8),
      ),
    );
  }
}
