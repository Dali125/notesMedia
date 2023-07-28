
import 'package:flutter/material.dart';

import '../constants/device_constants.dart';
import 'desktop/home/desktop_home.dart';
import 'mobile/home/home.dart';

class GlobalHomeIndex extends StatefulWidget {
  const GlobalHomeIndex({Key? key}) : super(key: key);

  @override
  State<GlobalHomeIndex> createState() => _GlobalHomeIndexState();
}

class _GlobalHomeIndexState extends State<GlobalHomeIndex> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    DeviceDimensions dimensions = DeviceDimensions();
    return Container(



      child: width < 600 ? MobileHome() : DesktopHome(),
    );
  }
}
