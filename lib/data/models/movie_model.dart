import 'package:ticket/data/models/data_movie_model.dart';

class MovieModel {
  int id;
  String name;
  String poster;
  String premise;
  String classification;
  String audio;
  int duration;
  int room;
  List<DataMovieModel> date;

  MovieModel({
    required this.id,
    required this.name,
    required this.poster,
    required this.premise,
    required this.classification,
    required this.duration,
    required this.audio,
    required this.room,
    required this.date,
  });
}
