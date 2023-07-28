import 'package:flutter/material.dart';

import '../../../constants/device_constants.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({Key? key}) : super(key: key);

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {


  @override
  Widget build(BuildContext context) {

    DeviceDimensions dimensions = DeviceDimensions();
    double width = MediaQuery.of(context).size.width;

    return Scaffold(

      appBar: AppBar(
        title: Text('Desktop'),
      ),
      
      body: Column(
        children: [
          Text(width.toString())
        ],
        
      ),

    )


    ;
  }
}
