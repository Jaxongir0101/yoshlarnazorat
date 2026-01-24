class UserModel {
  final String name;
  final String birthDate;
  final String gender;
  final String location;
  final String status; // Ta'lim/Ish
  final String activity; // O'qimoqda/Ishsiz
  final String riskLevel; // O'rta, Yuqori, Past
  final List<String> tags;
  final List<String> categories;

  UserModel({
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.location,
    required this.status,
    required this.activity,
    required this.riskLevel,
    required this.tags,
    required this.categories,
  });
}
