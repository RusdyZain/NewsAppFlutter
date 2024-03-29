import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title, image;
  const News({super.key, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: FancyShimmerImage(
                  boxFit: BoxFit.cover, imageUrl: image ?? ''),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            title ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}
