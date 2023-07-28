import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NoteStructure extends StatefulWidget {

  final int id;
  final String title;
  final String body;
  final int color;
  const NoteStructure({Key? key,
    required this.id,
    required this.title,
    required this.body,
    required this.color}
      ) : super(key: key);

  @override
  State<NoteStructure> createState() => _NoteStructureState();
}

class _NoteStructureState extends State<NoteStructure> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(widget.color)

                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.body,
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,),
                  ),
                ],
              )

          ),
        ),
      ),
    ],);

  }
}
