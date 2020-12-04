import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String) onTextChange;
  final void Function(String) onSubmited;
  final TextEditingController controller;

  const SearchBar({Key key, this.onTextChange, this.onSubmited, this.controller}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return TextField(
        textInputAction: TextInputAction.search,
        onChanged: onTextChange,
        onSubmitted: onSubmited,
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Pesquise seu filme favorito...',
        )
    );
  }
}