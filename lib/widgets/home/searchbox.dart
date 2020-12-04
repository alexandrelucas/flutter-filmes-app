import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {

  final void Function(String value) search;
  final TextEditingController controller;

  const SearchBox({this.controller, this.search});

  String validarInput(String value) {
    if(value.isEmpty)
      return 'Insira algo.';
      return null;
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      onSubmitted: search,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        hintText: 'Pesquise seu filme...',
      ),
    );
  }
}