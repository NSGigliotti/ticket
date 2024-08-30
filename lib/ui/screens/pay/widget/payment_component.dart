import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/controller/ticktController.dart';
import 'package:ticket/data/models/payment_model.dart';

class PaymentComponent extends StatelessWidget {
  const PaymentComponent({super.key, required this.payment});

  final PaymentModel payment;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Ticktcontroller>(builder: (contoller) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: GestureDetector(
          onTap: () => contoller.getPayment(payment.type),
          child: Material(
            elevation: 2,
            color: contoller.payment == payment.type
                ? Colors.purple
                : Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(payment.img),
              ),
              title: Text(
                payment.type,
                style: TextStyle(
                    color: contoller.payment == payment.type
                        ? Colors.white
                        : Colors.black),
              ),
              subtitle: Text(
                payment.details,
                style: TextStyle(
                    color: contoller.payment == payment.type
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          ),
        ),
      );
    });
  }
}
