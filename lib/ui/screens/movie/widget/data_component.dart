import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/controller/ticktController.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/data/models/data_movie_model.dart';

class DataComponent extends StatelessWidget {
  const DataComponent({
    super.key,
    required this.date,
  });

  final DataMovieModel date;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<Ticktcontroller>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: GestureDetector(
            onTap: () => controller.selectData(date.time, date.date),
            child: Container(
              width: size.width * 0.2,
              decoration: date.date == controller.dataSelected
                  ? AppTheme.dataComponentSelect
                  : AppTheme.dataComponent,
              child: Center(
                child: Text(date.date.substring(0, 5),
                    style: AppTheme.dataTimeDisplay),
              ),
            ),
          ),
        );
      },
    );
  }
}
