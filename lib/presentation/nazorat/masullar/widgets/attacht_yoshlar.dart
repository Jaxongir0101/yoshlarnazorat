import 'package:flutter/material.dart';

class AttachYouthScreen extends StatefulWidget {
  static const String routeName = 'attacht_yoshlar';
  const AttachYouthScreen({super.key});

  @override
  State<AttachYouthScreen> createState() => _AttachYouthScreenState();
}

class _AttachYouthScreenState extends State<AttachYouthScreen> {
  // Tanlangan yoshlar indekslari ro'yxati
  final Set<int> _selectedIndices = {};

  // Namuna ma'lumotlar
  final List<Map<String, String>> _youthList = [
    {"name": "Aliyev Jasur Karimovich", "region": "Baxmal tumani"},
    {"name": "Karimova Gulnoza Shavkatovna", "region": "Do'stlik tumani"},
    {"name": "Rahimov Sardor Botirovich", "region": "Zomin shahri"},
    {"name": "Abdullayeva Madina Rustamovna", "region": "Zomin shahri"},
    {"name": "Nazarov Ulug'bek Sherzodovich", "region": "Jizzax shahri"},
    {"name": "Mirzayeva Dilnoza Karimovna", "region": "Yangiobod tumani"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Normatov Jamshid Karimovich",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Hududiy mas'ul",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildActionHeader(),
          Expanded(child: _buildYouthList()),
        ],
      ),
    );
  }

  // Yuqori qism: Bekor qilish va Biriktirish tugmalari
  Widget _buildActionHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: const Color(0xFFF4F7F9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, size: 18),
                  label: const Text("Bekor qilish"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _selectedIndices.isEmpty
                      ? null
                      : () {
                          // Biriktirish logikasi
                        },
                  icon: const Icon(Icons.check, size: 18),
                  label: Text("Biriktirish (${_selectedIndices.length})"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3384C3),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Biriktirilmagan yoshlar (${_youthList.length})",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Yoshlar ro'yxati
  Widget _buildYouthList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: _youthList.length,
      itemBuilder: (context, index) {
        final item = _youthList[index];
        final isSelected = _selectedIndices.contains(index);

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: isSelected,
                  activeColor: const Color(0xFF3384C3),
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _selectedIndices.add(index);
                      } else {
                        _selectedIndices.remove(index);
                      }
                    });
                  },
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue.shade50,
                  radius: 18,
                  child: const Icon(
                    Icons.person,
                    size: 20,
                    color: Color(0xFF3384C3),
                  ),
                ),
              ],
            ),
            title: Text(
              item['name']!,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              item['region']!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),

            onTap: () {
              setState(() {
                if (isSelected) {
                  _selectedIndices.remove(index);
                } else {
                  _selectedIndices.add(index);
                }
              });
            },
          ),
        );
      },
    );
  }
}
