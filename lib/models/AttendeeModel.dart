class Attendee {
  final String userId;
  final String eventId;
  final String status;
  final String attendeeId;

  Attendee({this.userId, this.eventId, this.status, this.attendeeId});


  factory Attendee.fromJson(Map<String, dynamic> json){
    return Attendee(
        userId: json['userId'],
        eventId: json['eventId'],
        status: json['status'],
        attendeeId: json['attendeeId']
    );
  }
}