import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SelectedSubject extends StatefulWidget {
  const SelectedSubject({super.key});

  @override
  State<SelectedSubject> createState() => _SelectedSubjectState();
}

class _SelectedSubjectState extends State<SelectedSubject>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom:
            TabBar(controller: TabController(length: 2, vsync: this), tabs: [
          SizedBox(
              child: Text(
            'Past Papers',
            style: TextStyle(
                fontSize: 20,
                color: Get.isDarkMode == true ? Colors.white : Colors.black),
          )),
          Text(
            'Notes',
            style: TextStyle(
                fontSize: 20,
                color: Get.isDarkMode == true ? Colors.white : Colors.black),
          )
        ]),
      ),
    );
  }
}
