import 'package:flutter/material.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/data/models/tickt_model.dart';
import 'package:ticket/services/utilities.dart';

class TicktComponent extends StatelessWidget {
  const TicktComponent({super.key, required this.tickt});

  final TickModel tickt;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: size.height * 0.7,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(tickt.poster), fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              height: size.height * 0.2,
              color: const Color.fromARGB(190, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                            'Data: ${tickt.data.substring(0, 3)}${Utilities.convertMonthForExtensive(
                              tickt.data.substring(3, 5),
                            )}',
                            style: AppTheme.tickt),
                        Expanded(child: Container()),
                        Text('Horario: ${tickt.time}', style: AppTheme.tickt)
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Sala: ${tickt.room}',
                          style: AppTheme.tickt,
                        ),
                        Expanded(child: Container()),
                        Text('Cadeira: ${tickt.seatNumber}',
                            style: AppTheme.tickt)
                      ],
                    ),
                    Expanded(
                      child: Image.network(
                        'https://e1.pngegg.com/pngimages/915/361/png-clipart-recursos-liossi-barcode-thumbnail.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
