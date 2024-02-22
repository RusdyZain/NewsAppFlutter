import 'package:flutter/material.dart';
import 'package:newsapps/components/news.dart';
import 'package:newsapps/providers/news_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController(text: '');
    return Consumer<NewsProvider>(
        builder: (BuildContext context, news, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cari Berita'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Cari berita ...',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      news.search(searchController.text);
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              news.isDataEmpty
                  ? const SizedBox()
                  : news.isLoadingSearch
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            ...news.resSearch!.articles!.map(
                              (e) => News(
                                title: e.title ?? '',
                                image: e.urlToImage ?? '',
                              ),
                            )
                          ],
                        ),
              //   const News(
              //       title: "Testing",
              //       image:
              //           "https://cdn.vox-cdn.com/thumbor/zLlcibJMU38rUqbkiBB4zgVrOws=/0x0:2040x1360/1200x628/filters:focal(1020x680:1021x681)/cdn.vox-cdn.com/uploads/chorus_asset/file/22278733/sokane_210121_4386_0008.jpg")
            ],
          ),
        )),
      );
    });
  }
}
