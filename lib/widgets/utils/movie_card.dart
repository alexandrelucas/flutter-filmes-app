import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  final Function onTap;

  const MovieCard({
    Key key, 
    this.posterPath, 
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: posterPath.isNotEmpty ? Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w220_and_h330_face/$posterPath') ?? '',
            fit: BoxFit.cover
          ),
        ),
      ) : Container(
        width: 220,
        height: 330,
        child: Center(child: Icon(Icons.warning, size: 84,),),
      ),
    );
  }
}