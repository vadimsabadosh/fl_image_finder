// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String value) onSubmit;
  const SearchBar({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSubmit() {
    var value = _controller.text;
    if (value.isNotEmpty) {
      widget.onSubmit(value);
      _controller.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff3f51b5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      height: 60,
      child: Row(
        children: [
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
              ),
              child: const Icon(
                Icons.search,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (value) => onSubmit(),
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                hintText: 'Search images and photos',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
