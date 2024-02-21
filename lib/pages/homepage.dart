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
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
        builder: (BuildContext context, news, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Berita Terbaru Saat Ini!'),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                News(
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
