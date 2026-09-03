class Event {
  final String id;
  final String title;
  final String description;
  final String date;
  final String location;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final String category;
  final String time;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.category, required this.time,
  });
}
