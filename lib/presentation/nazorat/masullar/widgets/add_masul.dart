import 'package:flutter/material.dart';

class AddOfficerScreen extends StatefulWidget {
  static const String routeName = 'add_masul';
  const AddOfficerScreen({super.key});

  @override
  State<AddOfficerScreen> createState() => _AddOfficerScreenState();
}

class _AddOfficerScreenState extends State<AddOfficerScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F9), // Fon rangi
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yangi mas'ul qo'shish",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Mas'ul xodim ma'lumotlarini kiriting",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 1. Rasm yuklash qismi
              _buildImageUpload(),
              const SizedBox(height: 20),

              // 2. Shaxsiy ma'lumotlar bloki
              _buildCardWrapper(
                title: "Shaxsiy ma'lumotlar",
                child: Column(
                  children: [
                    _buildInputField(
                      label: "F.I.Sh *",
                      hint: "To'liq ism-sharif",
                    ),
                    const SizedBox(height: 16),
                    _buildDropdown(
                      label: "Lavozim *",
                      hint: "Lavozimni tanlang",
                    ),
                    const SizedBox(height: 16),
                    _buildDropdown(label: "Hudud *", hint: "Hududni tanlang"),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 3. Aloqa ma'lumotlari bloki
              _buildCardWrapper(
                title: "Aloqa ma'lumotlari",
                child: Column(
                  children: [
                    _buildInputField(
                      label: "Telefon raqam *",
                      hint: "+998 90 123 45 67",
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 4. Action Buttons (Bekor qilish va Saqlash)
              _buildActionButtons(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Rasm yuklash vidjeti
  Widget _buildImageUpload() {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blue.shade50,
          child: Icon(
            Icons.person_outline,
            size: 40,
            color: Colors.blue.shade300,
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.grey.shade200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: const Text(
            "Rasm yuklash",
            style: TextStyle(color: Colors.black87, fontSize: 13),
          ),
        ),
      ],
    );
  }

  // Card Wrapper dizayni
  Widget _buildCardWrapper({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8EEF3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  // Input Field (Matn kiritish maydoni)
  Widget _buildInputField({
    required String label,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
          ),
        ),
      ],
    );
  }

  // Dropdown dizayni
  Widget _buildDropdown({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(
                hint,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              ),
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              items: [], // Bu yerga elementlar qo'shiladi
              onChanged: (val) {},
            ),
          ),
        ),
      ],
    );
  }

  // Pastki tugmalar (Bekor qilish va Saqlash)
  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: Colors.grey.shade200),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Bekor qilish",
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Saqlash logikasi
              }
            },
            icon: const Icon(Icons.save_outlined, size: 18),
            label: const Text("Saqlash"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3384C3),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }
}
