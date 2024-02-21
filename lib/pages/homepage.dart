import 'package:flutter/material.dart';
import 'package:newsapps/components/news.dart';
import 'package:newsapps/providers/news_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
        builder: (BuildContext context, news, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Berita Terbaru Saat Ini!'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(news.isLoading.toString()),
                const News(
                  title: "Breaking News",
                  image: "https://www.dits.center/images/picture13_1.jpg",
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
