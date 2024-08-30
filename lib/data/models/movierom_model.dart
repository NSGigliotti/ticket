// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ticket/data/models/seat_model.dart';

class MovieromModel {
  List<List<SeatModel>> seat;

  MovieromModel({
    required this.seat,
  });

MovieromModel clone() {

    List<List<SeatModel>> seatCopy = seat.map((row) =>
      row.map((seat) => SeatModel.from(seat)).toList()
    ).toList();
    return MovieromModel(seat: seatCopy);
  }
}
