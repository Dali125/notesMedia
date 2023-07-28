import 'package:flutter/material.dart';


class IndexMain extends StatefulWidget {
  const IndexMain({Key? key}) : super(key: key);

  @override
  State<IndexMain> createState() => _IndexMainState();
}

class _IndexMainState extends State<IndexMain> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        title: Text('Home'),
        elevation: 0,
        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.transparent : Colors.white,
      ),


    );
  }
}
