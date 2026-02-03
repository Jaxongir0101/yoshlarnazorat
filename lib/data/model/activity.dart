enum ActivityStatus { bajarilgan, rejalashtirilgan }

class Activity {
  final String title;
  final String description;
  final String result;
  final String date;
  final ActivityStatus status;

  Activity({
    required this.title,
    required this.description,
    required this.result,
    required this.date,
    required this.status,
  });
}
