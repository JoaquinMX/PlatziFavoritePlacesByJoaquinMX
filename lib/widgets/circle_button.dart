import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {

  final VoidCallback onPressed;
  var backgroundColor;
  var color;
  bool mini;
  var icon;
  var iconSize;
  String tooltip;

  CircleButton(this.backgroundColor, this.color, this.icon, this.iconSize, this.mini, this.onPressed, this.tooltip);

  @override
  State<StatefulWidget> createState() {

    return _CircleButton();
  }

}

class _CircleButton extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: widget.backgroundColor,
      mini: widget.mini,
      tooltip: widget.tooltip,
      onPressed: widget.onPressed,
      child: Icon(
        widget.icon,
        color: widget.color,
      ),
      heroTag: null,

    );
  }

}