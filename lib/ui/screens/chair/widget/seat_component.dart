import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/controller/ticktController.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/data/models/seat_model.dart';

class SeatComponent extends StatelessWidget {
  const SeatComponent({super.key, required this.seat});

  final SeatModel seat;

  @override
  Widget build(BuildContext context) {
    bool seatCompareLeft =
        seat.seatNumber.toLowerCase().contains('-03'.toLowerCase());
    bool seatCompareRight =
        seat.seatNumber.toLowerCase().contains('-10'.toLowerCase());

    return GetBuilder<Ticktcontroller>(builder: (controller) {
      bool isSelected = controller.seatsSelected.contains(seat);
      return GestureDetector(
        onTap: () => seat.isReserved ? null : controller.addSeat(seat),
        child: Container(
          padding: EdgeInsets.only(
            right: seatCompareLeft ? 10 : 1,
            left: seatCompareRight ? 10 : 1,
          ),
          child: Icon(
            Icons.event_seat_rounded,
            size: 29,
            color: seat.isReserved
                ? AppTheme.secondary
                : isSelected
                    ? AppTheme.primary
                    : Colors.white,
            shadows: const [
              Shadow(
                color: Colors.black,
                blurRadius: 5,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
      );
    });
  }
}
