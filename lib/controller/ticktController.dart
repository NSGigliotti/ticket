
// ignore_for_file: file_names
import 'dart:async';
import 'package:get/get.dart';
import 'package:ticket/controller/userController.dart';
import 'package:ticket/data/models/movie_model.dart';
import 'package:ticket/data/models/payment_model.dart';
import 'package:ticket/data/models/seat_model.dart';
import 'package:ticket/data/models/tickt_model.dart';
import 'package:ticket/data/models/time_model.dart';
import 'package:ticket/services/utilities.dart';

class Ticktcontroller extends GetxController {
  List time = [];

  String dataSelected = '';
  String timeSelected = '';

  List<SeatModel> seatsSelected = [];
  List<List<SeatModel>> seat = [];

  late MovieModel movie;

  String payment = '';

  bool isLoading = false;

  bool isLoadingPayment = false;

  @override
  void onInit() {
    super.onInit();
    isLoading = true;
    Timer(const Duration(seconds: 3), () {
      isLoading = false;
      update();
    });
  }

  void selectData(List timeData, String data) {
    time = timeData;
    dataSelected = data;
    timeSelected = '';
    update();
  }

  void selectTime(TimeModel time) {
    timeSelected = time.time;
    seat = time.seat.seat;
    update();
  }

  void getMovie(MovieModel movieGet) {
    movie = movieGet;
    update();
  }

  void resetPage() {
    time = [];
    dataSelected = '';
    timeSelected = '';
    update();
  }

  void resetSeatPage() {
    seatsSelected = [];
    update();
  }

  void addSeat(SeatModel seat) {  //* funçao que seleciona o assento
    bool containsSeat = seatsSelected.contains(seat);
    if (!containsSeat) {
      seatsSelected.add(seat);
    } else {
      seatsSelected.remove(seat);
    }
    update();
  }

  void getPayment(String paymentget) { //* selecio o metodo de pagamento
    payment = paymentget;
    update();
  }

  Future<void> creatTickt() async {
    final Usercontroller usercontroller = Get.find(); //* pega o controle de usuario

    isLoadingPayment = true;
    update();

    for (int i = 0; i <= seatsSelected.length - 1; i++) { //* cria o ticket
      TickModel tickt = TickModel(
        movieName: movie.name,
        seatNumber: seatsSelected[i].seatNumber,
        room: movie.room,
        duration: movie.duration,
        poster: movie.poster,
        data: dataSelected,
        time: timeSelected,
      );

      reserveSeat(seatsSelected[i].seatNumber); //* reserva os assentos

      await usercontroller.addTickt(tickt); //* adiciona o ticket ao usuario
    }

    //* limpa as variaveis
    seatsSelected = [];
    dataSelected = '';
    timeSelected = '';
    time = [];
    seat = [];
    payment = '';

    // ignore: await_only_futures
    await Timer(const Duration(seconds: 3), () {
      Utilities.showToast(message: 'Pagamento Concluido');
      isLoadingPayment = false;
      update();
    });
  }

  void reserveSeat(String seatNumber) { //* funçao para reservao o assento
    for (var row in seat) {
      for (var seat in row) {
        if (seat.seatNumber == seatNumber) {
          seat.isReserved = true;
          return;
        }
      }
    }
  }

  List<PaymentModel> paymentMethods = [ //* lista de para simulação de metodos de pagamento
    PaymentModel(
      type: 'Cartão de Crédito',
      img: 'https://cdn-icons-png.flaticon.com/512/5396/5396335.png',
      details:
          'Número: 1234 **** **** 3456\nData de Validade: 12/25\nCódigo de Segurança: 123',
    ),
    PaymentModel(
      type: 'Boleto Bancário',
      img: 'https://cdn-icons-png.flaticon.com/512/522/522524.png',
      details:
          'Código de Barras: 12345678901234567890123456789012345678901234\nVencimento: 15/08/2024',
    ),
    PaymentModel(
      type: 'Pix',
      img:
          'https://user-images.githubusercontent.com/741969/99538133-492fe280-298b-11eb-81a2-66779343e064.png',
      details: 'Chave: cinema@pix.com\nBanco: Banco Exemplo\nData: 31/07/2024',
    ),
    PaymentModel(
      type: 'PayPal',
      img: 'https://cdn-icons-png.flaticon.com/512/174/174861.png',
      details: 'E-mail: cinema@paypal.com\nData da Transação: 31/07/2024',
    ),
  ];
}
