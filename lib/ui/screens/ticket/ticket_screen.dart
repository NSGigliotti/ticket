import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
import 'package:ticket/controller/userController.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/ui/screens/ticket/widget/tickt_component.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<Usercontroller>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Ingressos', style: AppTheme.dataTimeDisplay),
          ),
          body: controller.user.tickets.isEmpty
              ? Center(
                  child: Text('Sem ingressos', style: AppTheme.dataTimeDisplay))
              : SizedBox(
                  height: size.height,
                  width: size.width,
                  child: ListWheelScrollViewX(
                    scrollDirection: Axis.horizontal,
                    itemExtent: 310,
                    diameterRatio: 3.9,
                    children: controller.user.tickets.map((index) {
                      return TicktComponent(tickt: index);
                    }).toList(),
                  ),
                ),
        );
      },
    );
  }
}
