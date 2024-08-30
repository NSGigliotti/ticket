import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/controller/ticktController.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/data/models/movie_model.dart';
import 'package:ticket/services/utilities.dart';
import 'package:ticket/ui/screens/chair/chair_screen.dart';
import 'package:ticket/ui/screens/movie/widget/data_component.dart';
import 'package:ticket/ui/screens/movie/widget/time_component.dart';
import 'package:ticket/ui/widgets/button_edit.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<Ticktcontroller>(
      builder: (controller) {
        return controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    decoration: AppTheme.backgoundDecoration,
                  ),
                  Hero(
                    tag: movie.id,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 5, 5, 5),
                            Colors.transparent,
                          ],
                          stops: [0.01, 0.7],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.network(
                        movie.poster,
                        width: size.width,
                        height: size.height,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
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
                            controller.resetPage();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    body: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.13),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.25,
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    children: [ //*  tipo de audio do filme
                                      movie.audio == ''
                                          ? Container()
                                          : Container(
                                              color: Colors.lightGreen,
                                              height: size.height * 0.03,
                                              width: size.width * 0.18,
                                              child: Center(
                                                child: Text(
                                                  controller.movie.audio,
                                                  style: AppTheme.premiseMovie,
                                                ),
                                              ),
                                            ),
                                      Expanded(child: Container()),
                                      Container( //* classificaçao do filme
                                        height: size.height * 0.03,
                                        width: size.width * 0.15,
                                        color: Utilities.classificationColor(controller.movie.classification),
                                        child: Center(
                                          child: Text(
                                            controller.movie.classification,
                                            style: AppTheme.premiseMovie,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            movie.name,
                            style: AppTheme.titleMoviePage,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: IntrinsicWidth(
                              child: IntrinsicWidth(
                                child: SizedBox(
                                  height: size.height * 0.18,
                                  child: Text(
                                    movie.premise,
                                    style: AppTheme.premiseMovie,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5), //* datas do filme
                                child: SizedBox(
                                  height: size.height * 0.10,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: movie.date.length,
                                    itemBuilder: (context, index) {
                                      return DataComponent(
                                        date: movie.date[index],
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox( //* horarios do filme
                                height: size.height * 0.09,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.time.length,
                                  itemBuilder: (context, index) {
                                    return TimeComponent(
                                        time: controller.time[index]);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()), //* botao de seleçao
                          SizedBox(
                            height: size.height * 0.09,
                            width: size.width,
                            child: controller.timeSelected != ''
                                ? ButtonEdit(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ChairScreen(),
                                        ),
                                      );
                                    },
                                    text: 'Reservar Lugares',
                                  )
                                : Container(),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                  )
                ],
              );
      },
    );
  }
}
