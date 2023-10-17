import 'package:flutter/material.dart';
import 'package:my_app/models/heroes_model.dart';
import 'package:my_app/repositories/marvel/heroes_repository.dart';
import 'package:my_app/shared/widgtes/page_title.dart';

class HeroesPage extends StatefulWidget {
  const HeroesPage({super.key});

  @override
  State<HeroesPage> createState() => _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  HeroesRepo heroesRepo = HeroesRepo();
  var heroes = HeroesModel();
  var loading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<HeroesModel> loadData() async {
    setState(() {
      loading = true;
    });
    heroes = await heroesRepo.getHeroes();
    setState(() {
      loading = false;
    });
    return heroes;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const PageTitle(
          title: 'Heroes',
        ),
        centerTitle: true,
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListView.builder(
                  itemCount:
                      (heroes.data == null || heroes.data!.results == null)
                          ? 0
                          : heroes.data!.results!.length,
                  itemBuilder: (_, index) {
                    var hero = heroes.data!.results![index];
                    return Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                '${hero.thumbnail!.path!}.${hero.thumbnail!.extension!}',
                                width: 100,
                              ),
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        hero.name!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(hero.description!)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));
                  }),
            ),
    ));
  }
}
