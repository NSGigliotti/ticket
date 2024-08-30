import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/controller/ticktController.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/ui/screens/pay/widget/payment_component.dart';
import 'package:ticket/ui/widgets/button_edit.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: AppTheme.backgoundDecoration,
      child: GetBuilder<Ticktcontroller>(
        builder: (controller) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Pagamento',
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
                        controller.payment = '';
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    IntrinsicWidth(
                      child: Material(
                        elevation: 1,
                        color: Colors.transparent,
                        child: SizedBox(
                          width: size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 15),
                              child: Column(
                                children: [
                                  Text(
                                    controller.movie.name,
                                    style: AppTheme.dataTimeDisplay,
                                  ),
                                  Text(
                                    '${controller.dataSelected} - ${controller.timeSelected} / Sala: ${controller.movie.room}',
                                    style: AppTheme.dataTimeDisplay,
                                  ),
                                  Text(
                                    'Duração:  ${controller.movie.duration} min',
                                    style: AppTheme.dataTimeDisplay,
                                  ),
                                  Text(
                                    'Classificação:  ${controller.movie.classification} ',
                                    style: AppTheme.dataTimeDisplay,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Numero de acentos: ${controller.seatsSelected.length}',
                                        style: AppTheme.dataTimeDisplay,
                                      ),
                                      Expanded(child: Container()),
                                      Text(
                                        'R\$ ${controller.seatsSelected.length * 15},00',
                                        style: AppTheme.dataTimeDisplay,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height * 0.45,
                      child: ListView.builder(
                        itemCount: controller.paymentMethods.length,
                        itemBuilder: (_, index) {
                          return PaymentComponent(
                              payment: controller.paymentMethods[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 25,
                      ),
                      child: controller.payment != ''
                          ? ButtonEdit(
                              onPressed: () {
                                controller.creatTickt();
                                Timer(const Duration(seconds: 3), () {
                                  Navigator.of(context).popUntil((route) {
                                    return route.isFirst;
                                  });
                                });
                              },
                              text: 'Pagar',
                            )
                          : Container(),
                    )
                  ],
                ),
              ),
              controller.isLoadingPayment
                  ? Container(
                      height: size.height,
                      width: size.width,
                      color: const Color.fromARGB(48, 255, 255, 255),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
