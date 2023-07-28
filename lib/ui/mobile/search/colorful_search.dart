import 'package:flutter/material.dart';

class ColorfulSearch extends StatefulWidget {
  const ColorfulSearch({Key? key}) : super(key: key);

  @override
  State<ColorfulSearch> createState() => _ColorfulSearchState();
}

class _ColorfulSearchState extends State<ColorfulSearch> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return


    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [


        Container(
        width: width,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
           border: Border.all(

        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black
      ),
          color: Colors.blueAccent,
        ),

      ),


        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Container(
          width: width,
          height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
             border: Border.all(

               color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black
             ),
              color: Theme.of(context).brightness == Brightness.dark ? Theme.of(context).backgroundColor : Colors.white
            ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Transform(
                transform: Matrix4.skewX(-0.08),
                child: TextField(

                  decoration: InputDecoration(
                      border: InputBorder.none,
                    icon: Icon(Icons.search),
                    hintText: 'Search'
                  ),
                ),
              ),
            ),
          ),
      ),
        )
        ],
      ),
    );

  }
}
