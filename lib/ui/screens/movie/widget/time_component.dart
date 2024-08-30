import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/controller/ticktController.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/data/models/time_model.dart';

class TimeComponent extends StatelessWidget {
  const TimeComponent({super.key, required this.time});

  final TimeModel time;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<Ticktcontroller>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: GestureDetector(
          onTap: () => controller.selectTime(time),
          child: Container(
            width: size.width * 0.2,
            decoration: controller.timeSelected == time.time
                ? AppTheme.dataComponentSelect
                : AppTheme.dataComponent,
            child: Center(
              child: Text(
                time.time,
                style: AppTheme.dataTimeDisplay,
              ),
            ),
          ),
        ),
      );
    });
  }
}
