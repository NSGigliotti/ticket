import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/controller/ticktController.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/services/utilities.dart';
import 'package:ticket/ui/screens/chair/widget/seat_component.dart';
import 'package:ticket/ui/screens/pay/pay_screen.dart';

class ChairScreen extends StatelessWidget {
  const ChairScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: AppTheme.backgoundDecoration,
      child: GetBuilder<Ticktcontroller>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Selecionar Assento',
                style: AppTheme.titleCollection,
              ),
              leading: Ink(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Color.fromARGB(58, 248, 245, 245),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: () {
                    controller.resetSeatPage();
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.6,
                    child: ListView.builder(
                      itemCount: controller.seat.length,
                      itemBuilder: (_, index) {
                        return SizedBox(
                          width: size.width * 0.1,
                          height: size.height * 0.1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.seat[index].length,
                            itemBuilder: (_, indexSeat) {
                              return SeatComponent(
                                  seat: controller.seat[index][indexSeat]);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8), //* legenda 
                  child: IntrinsicWidth(
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Disponível',
                            style: AppTheme.subtitleSeat,
                          ),
                        ),
                        Expanded(child: Container()),
                        CircleAvatar(
                          backgroundColor: AppTheme.secondary,
                          radius: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Reservado',
                            style: AppTheme.subtitleSeat,
                          ),
                        ),
                        Expanded(child: Container()),
                        CircleAvatar(
                          backgroundColor: AppTheme.primary,
                          radius: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Selecionado',
                            style: AppTheme.subtitleSeat,
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
                controller.seatsSelected.isEmpty
                    ? Container(
                        height: size.height * 0.2,
                      )
                    : Container(
                        height: size.height * 0.2,
                        color: const Color.fromARGB(45, 247, 238, 238),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.7,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.08,
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Icon(
                                            Icons.calendar_month,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          ' ${controller.dataSelected.substring(0, 2)} / ${Utilities.convertMonthForExtensive(
                                            controller.dataSelected
                                                .substring(3, 5),
                                          )}  - ${controller.timeSelected}  ',
                                          style: AppTheme.seatInfoStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: SizedBox(
                                      height: size.height * 0.05,
                                      child: ListView.builder(
                                        itemCount:
                                            controller.seatsSelected.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              controller.seatsSelected[index]
                                                  .seatNumber,
                                              style: AppTheme.seatInfoStyle,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.05,
                                    width: size.width,
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Icon(
                                            Icons.shopping_cart,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'R\$ ${15 * controller.seatsSelected.length},00',
                                          style: AppTheme.seatInfoStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(23),
                                    backgroundColor: const Color.fromARGB(
                                        160, 126, 126, 124),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const PayScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Comprar',
                                    style: AppTheme.seatInfoStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
