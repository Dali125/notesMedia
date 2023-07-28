

import 'package:flutter/material.dart';


class ColorfulButton extends StatefulWidget {


  final double height;
  final  double width;
  final text;
  final onTap;
  const ColorfulButton({Key? key,required this.height,required this.width, required this.text, required this.onTap}) : super(key: key);

  @override
  State<ColorfulButton> createState() => _ColorfulButtonState();
}

class _ColorfulButtonState extends State<ColorfulButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [


      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
        child: Material(
          borderRadius: BorderRadius.circular(20),


          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                border: Border.all(
                    color:  Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black

                ),
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20)
            ),

          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 20, right: 30, left: 20),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 20,

          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: widget.onTap,
            child: Container(
              width: widget.width,
              height: widget.height - 5,
              decoration: BoxDecoration(
                  border: Border.all(
                      color:  Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black

                  ),
                  borderRadius: BorderRadius.circular(20)
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(widget.text, style: TextStyle(
                      color:Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),

            ),
          ),
        ),
      )
    ],);
  }
}
