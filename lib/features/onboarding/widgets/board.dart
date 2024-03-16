import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  const Board({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final Image image;
  final Widget title;
  final Widget description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 110,
            bottom: 76,
          ),
          child: image,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Column(
            children: <Widget>[
              title,
              const SizedBox(
                height: 16,
              ),
              description,
            ],
          ),
        ),
      ],
    );
  }
}
