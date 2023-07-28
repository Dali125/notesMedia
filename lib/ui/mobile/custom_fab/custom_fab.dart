import 'package:flutter/material.dart';

class CustomFab extends StatefulWidget {

  final double size;
  final IconData icon;
  final double iconSize;
  const CustomFab({Key? key, required this.size, required this.icon, required this.iconSize}) : super(key: key);

  @override
  State<CustomFab> createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  @override
  Widget build(BuildContext context) {
    //The floating action button, 3ds
    return Stack(

      children: [

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(100),
          child: Container(

          height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
            ),
            color: Colors.blue,
          ),

    ),
        ),
      ),

    Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(

      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      border: Border.all(
        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      ),
        color: Theme.of(context).brightness == Brightness.dark ? Theme.of(context).backgroundColor : Colors.white,
      ),
        child: Transform(
          transform: Matrix4.skewX(-0.08),
          child: Icon(widget.icon,
          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
            size: widget.iconSize,

          ),
        ),

      ),
    )

      ],
    );


  }
}
