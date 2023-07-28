import 'package:flutter/material.dart';


class ColorfulCard extends StatefulWidget {

  final int? id;
  final String date;
  final String subject;
  final String startTime; // Store time as minutes since midnight
  final String endTime; // Store time as minutes since midnight
  final String repeating;
  final int color;

  const ColorfulCard({Key? key, this.id, required this.date, required this.startTime, required this.endTime, required this.repeating, required this.color, required this.subject}) : super(key: key);

  @override
  State<ColorfulCard> createState() => _ColorfulCardState();
}

class _ColorfulCardState extends State<ColorfulCard> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Stack(children: [


      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
        child: Material(
          borderRadius: BorderRadius.circular(20),


          child: Container(
            width: width,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                  color:  Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black

              ),
              color: Color(widget.color),
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
          child: Container(
            width: width,
            height: 95,
            decoration: BoxDecoration(
                border: Border.all(
                  color:  Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black

                ),
                borderRadius: BorderRadius.circular(20)
            ),

            child: Transform(
              transform: Matrix4.skewX(-0.04),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(widget.subject, style: TextStyle(
                      color:Color(widget.color),
                      fontWeight: FontWeight.bold
                    ),),

                    const SizedBox(height: 30,),
                    Row(
                      children:  [
                        Text('from ${widget.startTime} to ${widget.endTime}', style: TextStyle(
                          fontSize: 20
                        ),),
                        Expanded(child: SizedBox(width: 40,)),

                        Text('10 mins')
                      ],
                    )



                  ],
                ),
              ),
            ),

          ),
        ),
      )
    ],);
  }
}
