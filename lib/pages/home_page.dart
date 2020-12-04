import 'package:flutter/material.dart';
import 'package:filmesApp/pages/result_page.dart';
import 'package:filmesApp/widgets/home/logo.dart';
import 'package:filmesApp/widgets/home/searchbox.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _txtCtrl = TextEditingController();

  @override
  void dispose() {
    _txtCtrl.dispose();
    super.dispose();
  }

  void _submitSearch(String value) {
    if (value.isNotEmpty)
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ResultPage(value)));
    setState(() => _txtCtrl.text = "");
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        children: [
          Center(child: LogoWithText(),),
          SearchBox(controller: _txtCtrl, search: _submitSearch)
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody()
    );
  }
}
