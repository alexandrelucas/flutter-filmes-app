import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  final String title;
  final Function onTap;

  const MovieCard({Key key, this.posterPath, this.onTap, this.title})
      : super(key: key);

  void _onLongPress() {
    Fluttertoast.showToast(
      msg: this.title,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool validate =
        !(posterPath.isEmpty || posterPath == null || posterPath == '');

    return GestureDetector(
      onTap: onTap,
      onLongPress: _onLongPress,
      child: validate
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                            'https://image.tmdb.org/t/p/w220_and_h330_face/$posterPath') ??
                        '',
                    fit: BoxFit.cover),
              ),
            )
          : Container(
              width: 220,
              height: 330,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning,
                    size: 48,
                  ),
                  Text(this.title)
                ],
              )),
            ),
    );
  }
}
