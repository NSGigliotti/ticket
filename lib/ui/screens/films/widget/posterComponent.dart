// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/controller/ticktController.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/data/models/movie_model.dart';
import 'package:ticket/ui/screens/movie/movie_page.dart';

class PosterComponent extends StatelessWidget {
  const PosterComponent({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    Get.put(Ticktcontroller());

    final size = MediaQuery.of(context).size;

    return GetBuilder<Ticktcontroller>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.getMovie(movie);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MoviePage(movie: movie)));
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => MoviePage(
          //               movie: movie,
          //             )));
        },
        child: SizedBox(
          width: size.width * 0.45,
          height: 10,
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50, left: 50),
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(
                    width: size.width * 0.35,
                    height: size.height * 0.25,
                    child: Hero(
                      tag: movie.id,
                      child: Image.network(
                        movie.poster,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    movie.name,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.titlePoster,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
