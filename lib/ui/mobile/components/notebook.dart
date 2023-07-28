import 'package:flutter/material.dart';


class ColorfulNotebook extends StatefulWidget {

 final String name;
  final int? color;
  const ColorfulNotebook({Key? key, required this.name, required this.color}) : super(key: key);

  @override
  State<ColorfulNotebook> createState() => _ColorfulNotebookState();
}

class _ColorfulNotebookState extends State<ColorfulNotebook> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Stack(children: [



      Padding(
        padding: const EdgeInsets.only(left: 10, right: 20, ),
        child: Material(
          borderRadius: BorderRadius.circular(20),


          child: Container(
            width: 190,
            height: 250,
            decoration: BoxDecoration(
                border: Border.all(
                    color:  Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black

                ),
                color: Color(widget.color!),
                borderRadius: BorderRadius.circular(20)
            ),

          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only( right: 30, left: 10),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 20,
          child: Container(
            width: 170,
            height: 245,
            decoration: BoxDecoration(
                border: Border.all(
                    color:  Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black

                ),
                borderRadius: BorderRadius.circular(20)
            ),

            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.name,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(widget.color!),),
                ),
              ),
            )

          ),
        ),
      ),
    ],);
  }
}
