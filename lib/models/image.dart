class ImageModel {
  final int id;
  final String largeImageURL;
  final String webformatURL;

  const ImageModel({
    required this.id,
    required this.largeImageURL,
    required this.webformatURL,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      largeImageURL: json['largeImageURL'],
      webformatURL: json['webformatURL'],
    );
  }
}
