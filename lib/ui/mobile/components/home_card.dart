import 'package:flutter/material.dart';


class HomeNotebook extends StatefulWidget {


  const HomeNotebook({Key? key,}) : super(key: key);

  @override
  State<HomeNotebook> createState() => _HomeNotebookState();
}

class _HomeNotebookState extends State<HomeNotebook> {
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
                color: Colors.red,
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

              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Mafus",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red,),
                  ),
                ),
              )

          ),
        ),
      ),
    ],);
  }
}
