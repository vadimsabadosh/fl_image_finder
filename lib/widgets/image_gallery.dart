import 'package:flutter/material.dart';

import '../models/image.dart';
import 'image_gallery_item.dart';

class ImageGallery extends StatelessWidget {
  final ScrollController listController;
  final Function(String image) openModal;
  final List<ImageModel> images;
  const ImageGallery({
    Key? key,
    required this.listController,
    required this.images,
    required this.openModal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          controller: listController,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          padding: const EdgeInsets.all(10),
          itemCount: images.length,
          itemBuilder: (BuildContext ctx, index) {
            return ImageGalleryItem(image: images[index], openModal: openModal);
          }),
    );
  }
}
