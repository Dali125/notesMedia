
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reposit_it/ui/mobile/notes/note_section.dart';
import 'package:reposit_it/ui/mobile/timetable/timetable_home.dart';

import '../constants/device_constants.dart';
import 'desktop/home/desktop_home.dart';
import 'mobile/home/home.dart';

class GlobalHomeIndex extends StatefulWidget {
  const GlobalHomeIndex({Key? key}) : super(key: key);

  @override
  State<GlobalHomeIndex> createState() => _GlobalHomeIndexState();
}

class _GlobalHomeIndexState extends State<GlobalHomeIndex> {


  TimeTableController tc = Get.find();
  NotebookSelectionController nsc = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    DeviceDimensions dimensions = DeviceDimensions();
    tc.getTimeTable();
    nsc.refreshNotebookData();
    return Container(




      child: width < 600 ? MobileHome() : DesktopHome(),
    );
  }
}
