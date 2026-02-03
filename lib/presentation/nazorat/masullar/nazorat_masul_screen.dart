import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yoshlar/presentation/nazorat/masullar/widgets/add_masul.dart';
import 'package:yoshlar/presentation/nazorat/masullar/widgets/masul_yoshlar.dart';

class NazoratMasulScreen extends StatefulWidget {
  const NazoratMasulScreen({super.key});

  @override
  State<NazoratMasulScreen> createState() => _NazoratMasulScreenState();
}

class _NazoratMasulScreenState extends State<NazoratMasulScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sarlavha va "Qo'shish" tugmasi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mas'ul xodimlar",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Jami: 3 nafar",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  context.pushNamed(AddOfficerScreen.routeName);
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

          // Qidiruv paneli
          TextField(
            decoration: InputDecoration(
              hintText: "Xodim nomi bo'yicha qidirish...",
              prefixIcon: const Icon(Icons.search, size: 20),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Xodimlar ro'yxati
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _buildOfficerCard();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOfficerCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  "assets/images/person.jpeg",
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              // Ma'lumotlar
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            "Ergashev Dilshod Anvarovich",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Bosh mutaxassis",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    _buildInfoRow(Icons.location_on_outlined, "Jizzax shahri"),
                    _buildInfoRow(Icons.phone_outlined, "+998901234567"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Tugmalar
          Row(
            children: [
              _buildCardButton(Icons.phone, "Qo'ng'iroq", Colors.black),
              const SizedBox(width: 8),
              _buildCardButton(Icons.people_outline, "Yoshlari", Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.grey.shade500),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildCardButton(IconData icon, String label, Color color) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () {
          if (label == "Yoshlari") {
            context.pushNamed(MasulYoshlarScreen.routeName);
          }
        },
        icon: Icon(icon, size: 16),
        label: Text(label, style: const TextStyle(fontSize: 13)),
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }
}
