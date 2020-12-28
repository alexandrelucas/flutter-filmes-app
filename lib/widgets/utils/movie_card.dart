import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  final String title;
  final Function onTap;

  const MovieCard({Key key, this.posterPath, this.onTap, this.title})
      : super(key: key);

  void _onLongPress(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('${this.title}', style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color),),
        duration: Duration(milliseconds: 1400),
        elevation: 5,
        backgroundColor: Theme.of(context).primaryColorDark,
        behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context) {
    bool validate =
        !(posterPath.isEmpty || posterPath == null || posterPath == '');

    return GestureDetector(
      onTap: onTap,
      onLongPress: () => _onLongPress(context),
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
