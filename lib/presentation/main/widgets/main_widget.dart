import 'package:flutter/material.dart';
import 'package:yoshlar/data/model/user.dart';

class UserCardWidget extends StatelessWidget {
  final UserModel user;

  const UserCardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            // Sarlavha va Xavf darajasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
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

            const SizedBox(height: 12),
            _infoRow(Icons.location_on_outlined, user.location),
            _infoRow(Icons.school_outlined, user.status),
            _infoRow(Icons.work_outline, user.activity),

            const SizedBox(height: 16),
            // Taglar (Qora rangli)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTag(user.tags[0], Colors.blueGrey.shade900, Colors.white),
              ],
            ),

            // const SizedBox(height: 8),
            // // Kategoriyalar (Oq/Kulrang rangli)
            // Wrap(
            //   spacing: 8,
            //   runSpacing: 8,
            //   children: user.categories
            //       .map(
            //         (cat) => _buildTag(
            //           cat,
            //           Colors.white,
            //           Colors.black,
            //           border: true,
            //         ),
            //       )
            //       .toList(),
            // ),
          ],
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

  Widget _buildTag(
    String text,
    Color bgColor,
    Color textColor, {
    bool border = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: border ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: Text(text, style: TextStyle(color: textColor, fontSize: 12)),
    );
  }
}
