// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ticket/data/models/tickt_model.dart';

class User {
  String id;
  String name;
  String email;
  String password;
  String phone;
  List<TickModel> tickets;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.tickets,
  });

  void addTickt(TickModel ticket) {
   tickets.add(ticket);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'tickts': tickets.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {

    List<dynamic> ticketsList = json.decode(map['tickets']); //* transforma um JSON em uma lista
    List<TickModel>? tickets = ticketsList.map((item) {
      Map<String, dynamic> ticketMap = json.decode(item);
      return TickModel.fromMap(ticketMap);
    }).toList();

    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
      tickets: tickets,
    );
  }

  String toJson() => json.encode(toMap());
}
