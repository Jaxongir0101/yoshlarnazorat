import 'package:flutter/material.dart';

class AddYouthScreen extends StatefulWidget {
  static const String routeName = 'add_youth';
  const AddYouthScreen({super.key});

  @override
  State<AddYouthScreen> createState() => _AddYouthScreenState();
}

class _AddYouthScreenState extends State<AddYouthScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form maydonlari uchun kontrollerlar va o'zgaruvchilar
  final TextEditingController _nameController = TextEditingController();

  // Toifalar uchun checkbox holatlari
  final Map<String, bool> _categories = {
    "Probatsiya nazoratidagilar": false,
    "Yod g'oyalar ta'siriga tushganlar": false,
    "Ilgari sudlanganlar": false,
    "Ma'muriy huquqbuzarlik sodir etganlar": false,
    "Jinoyat sodir etgan voyaga yetmaganlar": false,
    "Giyohvandlar va spirtli ichimliklarga ruju qo'yganlar": false,
    "Mehribonlik uyidan chiqqanlar": false,
    "Agressiv xulq-atvorli yoshlar": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F9),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yangi yosh qo'shish",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Barcha majburiy maydonlarni to'ldiring",
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
              _buildPersonalInfoSection(),
              const SizedBox(height: 16),
              _buildAddressSection(),
              const SizedBox(height: 16),
              _buildEducationSection(),
              const SizedBox(height: 16),
              _buildCategoriesSection(),
              const SizedBox(height: 24),
              _buildActionButtons(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // 1. Shaxsiy ma'lumotlar bloki
  Widget _buildPersonalInfoSection() {
    return _buildCardWrapper(
      icon: Icons.person_outline,
      title: "Shaxsiy ma'lumotlar",
      child: Column(
        children: [
          _buildTextField(
            label: "F.I.Sh. *",
            hint: "To'liq ism familiya",
            controller: _nameController,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  label: "Jinsi *",
                  items: ["Erkak", "Ayol"],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTextField(
                  label: "Tug'ilgan sana *",
                  hint: "dd/mm/yyyy",
                  suffixIcon: Icons.calendar_today_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 2. Yashash manzili bloki
  Widget _buildAddressSection() {
    return _buildCardWrapper(
      title: "Yashash manzili",
      child: Column(
        children: [
          _buildDropdown(
            label: "Viloyat *",
            items: ["Toshkent", "Samarqand", "Farg'ona"],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildTextField(label: "Tuman *", hint: "Tuman nomi"),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTextField(
                  label: "Mahalla *",
                  hint: "Mahalla nomi",
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: "To'liq manzil *",
            hint: "Ko'cha, uy, xonadon",
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  // 3. Ta'lim va bandlik bloki
  Widget _buildEducationSection() {
    return _buildCardWrapper(
      title: "Ta'lim va bandlik",
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  label: "Ta'lim holati *",
                  items: ["O'qimoqda", "Bitirgan"],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDropdown(
                  label: "Bandlik holati *",
                  items: ["Ishsiz", "Ishlamoqda"],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDropdown(
            label: "Xavf toifasi *",
            items: ["Past xavf", "O'rta xavf", "Yuqori xavf"],
          ),
        ],
      ),
    );
  }

  // 4. Yoshlar toifalari (Checkbox-lar)
  Widget _buildCategoriesSection() {
    return _buildCardWrapper(
      title: "Yoshlar toifalari *",
      child: Column(
        children: _categories.keys.map((String key) {
          return CheckboxListTile(
            title: Text(key, style: const TextStyle(fontSize: 14)),
            value: _categories[key],
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            onChanged: (bool? value) {
              setState(() {
                _categories[key] = value!;
              });
            },
          );
        }).toList(),
      ),
    );
  }

  // 5. Saqlash va Bekor qilish tugmalari
  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Bekor qilish",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: _saveData,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3384C3),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Saqlash", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  // Yordamchi metodlar (UI Components)
  Widget _buildCardWrapper({
    required String title,
    required Widget child,
    IconData? icon,
  }) {
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
          Row(
            children: [
              if (icon != null) Icon(icon, size: 20, color: Colors.black87),
              if (icon != null) const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    IconData? suffixIcon,
    int maxLines = 1,
    TextEditingController? controller,
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
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 20) : null,
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
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

  Widget _buildDropdown({required String label, required List<String> items}) {
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
                "Tanlang",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              ),
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {},
            ),
          ),
        ),
      ],
    );
  }

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      // Saqlash logikasi shu yerda
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Ma'lumotlar saqlandi!")));
    }
  }
}
