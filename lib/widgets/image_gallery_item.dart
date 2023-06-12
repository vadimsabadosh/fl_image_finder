import 'package:flutter/material.dart';

import '../models/image.dart';

class ImageGalleryItem extends StatelessWidget {
  final ImageModel image;
  final Function(String image) openModal;

  const ImageGalleryItem({
    Key? key,
    required this.image,
    required this.openModal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: GestureDetector(
        onTap: () {
          openModal(image.largeImageURL);
        },
        child: Image.network(image.webformatURL, fit: BoxFit.cover),
      ),
    );
  }
}
