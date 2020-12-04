import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {

  final Function() callback;
  final isSearching;

  const SearchButton(this.callback, this.isSearching);
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: !isSearching ? Icon(Icons.search) : Icon(Icons.clear) ,onPressed: callback);
  }
}