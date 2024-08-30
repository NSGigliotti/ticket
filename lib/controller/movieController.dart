// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/data/models/movie_model.dart';
import 'package:ticket/data/repositories/DUMMY_MOVIES.dart';

class Moviecontroller extends GetxController {
  bool isLoading = false;

  final TextEditingController searchController = TextEditingController();

  // ignore: non_constant_identifier_names
  late List<MovieModel> moviesNews;
  late List<MovieModel> shortly;

  String search = '';
  List<MovieModel> searchList = [];

  final formKey = GlobalKey<FormState>();

  void onSearchChanged(String value) { //* funçao de busca 
    search = value;
    List<MovieModel> itemList = [];
    List<MovieModel> itemListShortly = [];

    itemList = moviesNews.where((item) {
      return item.name.toLowerCase().contains(search.toLowerCase());
    }).toList();

    itemListShortly = shortly.where((item) {
      return item.name.toLowerCase().contains(search.toLowerCase());
    }).toList();

    searchList = itemList + itemListShortly;

    update();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
    isLoading = true;

    Timer(const Duration(seconds: 2), () {
      moviesNews = MOVIESNEWS;
      shortly = SHORTLY;
      isLoading = false;
      update();
    });
  }
}
