import 'package:reposit_it/ui/desktop/home/desktop_home.dart';
import 'package:reposit_it/ui/mobile/home/home.dart';


import 'package:flutter/material.dart';

class GlobalHomeIndex extends StatefulWidget {
  const GlobalHomeIndex({Key? key}) : super(key: key);

  @override
  State<GlobalHomeIndex> createState() => _GlobalHomeIndexState();
}

class _GlobalHomeIndexState extends State<GlobalHomeIndex> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(



      child: width < 600 ? MobileHome() : DesktopHome(),
    );
  }
}
