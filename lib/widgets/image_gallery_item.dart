import 'package:flutter/material.dart';

import '../models/image.dart';

class ImageGalleryItem extends StatelessWidget {
  final ImageModel image;
  const ImageGalleryItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(image.webformatURL, fit: BoxFit.cover),
    );
  }
}
