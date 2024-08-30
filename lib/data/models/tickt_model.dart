import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TickModel {
  String movieName;
  String seatNumber;
  int room;
  int duration;
  String poster;
  String data;
  String time;

  TickModel({
    required this.movieName,
    required this.seatNumber,
    required this.room,
    required this.duration,
    required this.poster,
    required this.data,
    required this.time,
  });



  TickModel copyWith({
    String? movieName,
    String? seatNumber,
    int? room,
    int? duration,
    String? poster,
    String? data,
    String? time,
  }) {
    return TickModel(
      movieName: movieName ?? this.movieName,
      seatNumber: seatNumber ?? this.seatNumber,
      room: room ?? this.room,
      duration: duration ?? this.duration,
      poster: poster ?? this.poster,
      data: data ?? this.data,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'movieName': movieName,
      'seatNumber': seatNumber,
      'room': room,
      'duration': duration,
      'poster': poster,
      'data': data,
      'time': time,
    };
  }

  factory TickModel.fromMap(Map<String, dynamic> map) {
    return TickModel(
      movieName: map['movieName'] as String,
      seatNumber: map['seatNumber'] as String,
      room: map['room'] as int,
      duration: map['duration'] as int,
      poster: map['poster'] as String,
      data: map['data'] as String,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TickModel.fromJson(String source) => TickModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
