class Attendee {
  final String fullName;
  final String email;
  final String phoneNo;
  final String eventId;
  final String attendeeId;

  Attendee({this.fullName, this.eventId, this.email, this.phoneNo, this.attendeeId});


  factory Attendee.fromJson(Map<String, dynamic> json){
    return Attendee(
        fullName: json['fullName'],
        eventId: json['eventId'],
        email: json['email'],
        phoneNo: json['phoneNo'],
        attendeeId: json['attendeeId']
    );
  }
}