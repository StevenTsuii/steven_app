import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      itemExtent: 250,
      diameterRatio: 2,
      useMagnifier: true,
      magnification: 1.5,
      childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return _buildBlock(index);
          },
          childCount: 100),
    );
  }

//https://unite.pokemon.com/images/pokemon/hoopa/stat/stat-hoopa-2x.png
  AspectRatio _buildBlock(int index) {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
            color: Colors.primaries[index % 10],
            child: CachedNetworkImage(
              imageUrl:
                  "https://unite.pokemon.com/images/pokemon/hoopa/stat/stat-hoopa-2x.png",
            )));
  }
}
