// ignore_for_file: public_member_api_docs, sort_constructors_first
class SeatModel {
  String seatNumber;
  bool isReserved;

  SeatModel({
    required this.seatNumber,
    required this.isReserved,
  });

  factory SeatModel.from(SeatModel seat) {
    return SeatModel(
      seatNumber: seat.seatNumber,
      isReserved: seat.isReserved,
    );
  }
}
