import 'package:flutter/material.dart';

class DividerTamplate extends Divider implements PreferredSizeWidget {
  final double height;
  final double indent;
  final Color color;

  DividerTamplate({
    Key key,
    this.height = 0.0,
    this.indent = 0.0,
    this.color,
  })  : assert(height >= 0.0),
        super(
          key: key,
          height: height,
          indent: indent,
          color: color,
        );

  @override
  Size get preferredSize => Size(double.infinity, height);
}
