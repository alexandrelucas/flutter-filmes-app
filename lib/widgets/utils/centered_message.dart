import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {

  final String message;
  final Color color;
  final double iconSize;
  final IconData icon;
  final double space;
  final EdgeInsets padding;

  const CenteredMessage({
    Key key, 
    this.message, 
    this.color, 
    this.iconSize, 
    this.icon, 
    this.space, 
    this.padding
  }) : super(key: key);


  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildIcon(),
          SizedBox(height: space),
          _buildText(),
        ],
      )
    );
  }

  _buildIcon() {
    return Icon(
      icon,
      color: color,
      size: iconSize
    );
  }
  _buildText() {
    return Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(color: color)
    );
  }
}