class Event {
  final String userId;
  final String eventId;
  final String name;
  final String description;
  final String date;

  Event({this.name, this.description, this.date, this.userId, this.eventId});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        name: json['name'],
        description: json['description'],
        date: json['date'].toString(),
        userId: json['userId'],
        eventId: json['eventId']);
  }
}
