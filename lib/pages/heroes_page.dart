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
  final ScrollController _scrollController = ScrollController();
  HeroesRepo heroesRepo = HeroesRepo();
  var heroes = <HeroesModel>[];
  var loading = false;
  var loading2 = false;
  int offset = 0;

  @override
  void initState() {
    _scrollController.addListener(() {
      var paginationPosition = _scrollController.position.maxScrollExtent * 0.7;
      if (_scrollController.position.pixels >= paginationPosition) {
        loadData();
      }
    });
    super.initState();
    loadData();
  }

  loadData() async {
    if (loading || loading2) return;
    if (heroes.isEmpty) {
      setState(() {
        loading = true;
      });
      heroes = await heroesRepo.getHeroes(offset);
      setState(() {
        loading = false;
      });
      return heroes;
    } else {
      setState(() {
        loading2 = true;
      });
      offset += 20;
      var tempHeroesList = await heroesRepo.getHeroes(offset);
      heroes.addAll(tempHeroesList);
      setState(() {
        loading2 = false;
      });
      return heroes;
    }
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
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: heroes.length,
                      itemBuilder: (_, index) {
                        var hero = heroes[index];
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
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                Container(
                  child: loading2
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () => loadData(),
                          child: const Text(
                            'Carregar mais itens',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          )),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
    ));
  }
}
