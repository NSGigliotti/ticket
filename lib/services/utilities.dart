import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utilities {
  //* Classifica a cor de acordo com a idade
  static Color classificationColor(String age) {
    late Color classificationColor;
    switch (age) {
      case 'Livre':
        classificationColor = const Color.fromARGB(255, 12, 236, 20);
        break;
      case '10 anos':
        classificationColor = const Color.fromARGB(255, 7, 138, 245);
        break;
      case '12 anos':
        classificationColor = const Color.fromARGB(255, 248, 233, 92);
        break;
      case '14 anos':
        classificationColor = const Color.fromARGB(255, 231, 144, 13);
        break;
      case '16 anos':
        classificationColor = const Color.fromARGB(255, 241, 20, 4);
        break;
      case '18 anos':
        classificationColor = const Color.fromARGB(255, 10, 10, 10);
        break;

      default:
        classificationColor = Colors.transparent;
    }
    return classificationColor;
  }

  //* converte o mes de numerico para romano
  static String convertMonthForExtensive(String month) {
    String mothExtensive = '';
    switch (month) {
      case '01':
        mothExtensive = 'Janeiro';
        break;
      case '02':
        mothExtensive = 'Fevereiro';
        break;
      case '03':
        mothExtensive = 'Março';
        break;
      case '04':
        mothExtensive = 'Abril';
        break;
      case '05':
        mothExtensive = 'Maio';
        break;
      case '06':
        mothExtensive = 'Junho';
        break;
      case '07':
        mothExtensive = 'Julho';
        break;
      case '08':
        mothExtensive = 'Agosto';
        break;
      case '09':
        mothExtensive = 'Setembro';
        break;
      case '10':
        mothExtensive = 'Outubro';
        break;
      case '11':
        mothExtensive = 'Novembro';
        break;
      case '12':
        mothExtensive = 'Dezembro';
        break;
      default:
        mothExtensive = 'Mes invalido';
    }
    return mothExtensive;
  }

  //* toast de mensagem
  static void showToast({required message, bool error = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
