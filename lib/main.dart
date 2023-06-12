import 'package:fl_image_finder/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'service/api.dart';
import 'widgets/button.dart';
import 'widgets/image_gallery.dart';
import 'widgets/searchbar.dart';
import './models/response.dart';
import './models/image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller = ScrollController();
  List<ImageModel> images = [];
  String query = '';
  bool showBtn = false;
  int page = 1;
  bool isLoading = false;

  void handleSubmit(String value) {
    setState(() {
      query = value;
      page = 1;
    });
    fetchData();
  }

  void loadMore() {
    setState(() {
      page = page + 1;
    });
    fetchData();
  }

  @override
  void initState() {
    super.initState();
  }

  void fetchData() {
    if (query.isEmpty) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    Future<Response> futureImages = ApiImages.fetchImages(query, page);
    futureImages.then((value) {
      setState(() {
        images = [...images, ...value.hits];
        showBtn = (value.totalHits / 12).ceil() != page;
      });
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
      _scrollDown();
    });
  }

  void _scrollDown() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            SearchBar(onSubmit: handleSubmit),
            if (images.isNotEmpty) ...[
              ImageGallery(
                  listController: _controller,
                  images: images,
                  openModal: _dialogBuilder),
              if (showBtn && !isLoading) Button(loadMore: loadMore),
              if (isLoading) const Loader(),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(String image) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Image.network(image, fit: BoxFit.cover),
        );
      },
    );
  }
}
