import 'image.dart';

class Response {
  final int totalHits;
  final List<ImageModel> hits;

  const Response({
    required this.totalHits,
    required this.hits,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      totalHits: json['totalHits'],
      hits: List<ImageModel>.from(
          json["hits"].map((x) => ImageModel.fromJson(x))),
    );
  }
}
