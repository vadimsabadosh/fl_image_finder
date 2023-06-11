import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() loadMore;
  const Button({
    Key? key,
    required this.loadMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: loadMore,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff3f51b5),
            minimumSize: const Size.fromHeight(50)),
        child: const Text('Load More'),
      ),
    );
  }
}
