import 'package:flutter/material.dart';
import 'package:newsapps/components/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Terbaru Saat Ini!'),
      ),
      body: SingleChildScrollView(
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
  }
}
