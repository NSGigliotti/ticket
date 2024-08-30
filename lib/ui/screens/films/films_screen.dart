import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/controller/movieController.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/ui/screens/films/widget/posterComponent.dart';

class FilmsScreen extends StatelessWidget {
  const FilmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Escolha o filme',
          style: AppTheme.titleCollection,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<Moviecontroller>(
        builder: (controller) {
          return Container(
            child: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: SizedBox(
                            height: 55,
                            child: TextField(
                              controller: controller.searchController,
                              decoration: InputDecoration(
                                suffix: controller
                                        .searchController.text.isNotEmpty
                                    ? IconButton(
                                        icon: const Icon(Icons.clear, size: 24),
                                        onPressed: () {
                                          controller.searchController.clear();
                                          controller.search = '';
                                          FocusScope.of(context).unfocus();
                                        },
                                      )
                                    : null,
                                labelText: 'Digite para buscar',
                                border: const OutlineInputBorder(),
                              ),
                              onChanged: controller.onSearchChanged,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: SizedBox(
                              child: controller.search != ''
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          // width: size.width,
                                          height: size.height * 0.68,
                                          child: GridView.builder(
                                            padding: const EdgeInsets.fromLTRB(
                                                16, 0, 16, 16),
                                            physics:
                                                const BouncingScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: 9 / 11.5,
                                            ),
                                            itemCount:
                                                controller.searchList.length,
                                            itemBuilder: (_, index) {
                                              return PosterComponent(
                                                movie: controller
                                                    .searchList[index],
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Em cartaz hoje',
                                              style: AppTheme.titleCollection),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.30,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                controller.moviesNews.length,
                                            itemBuilder: (_, index) {
                                              return PosterComponent(
                                                movie: controller
                                                    .moviesNews[index],
                                              );
                                            },
                                          ),
                                        ),
                                        Text(
                                          'Embreve',
                                          style: AppTheme.titleCollection,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.30,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                controller.moviesNews.length,
                                            itemBuilder: (_, index) {
                                              return PosterComponent(
                                                movie:
                                                    controller.shortly[index],
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
