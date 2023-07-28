import 'package:custom_navigation_bar/custom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reposit_it/ui/mobile/profile/profile.dart';
import 'package:reposit_it/ui/mobile/tflite_ui/ocr_screen.dart';

import '../notes/note_section.dart';
import '../timetable/timetable_home.dart';
import 'index_main.dart';


class MobileHome extends StatefulWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {


  int currentIndex = 0;

  List<CustomNavigationBarItem> navItems = <CustomNavigationBarItem>[

    CustomNavigationBarItem(
      icon: const Icon(Icons.home_outlined),
      selectedIcon: const Icon(Icons.home_filled),
      title: const Text('Home'),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.book_outlined),
      title: const Text('Notes'),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.schedule_outlined),
      title: const Text('Timetable'),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.camera),
      title: const Text('Timetable'),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.account_circle),
      title: const Text('Profile'),
    ),
  ];

  List items = <Widget>[


    const IndexMain(),
    NoteBookSelection(),
    TimetableIndex(),
    OcrScreen(),
    const Profile()
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: items[currentIndex],


      bottomNavigationBar: CustomNavigationBar(

        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
        unSelectedColor: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
        blurEffect: true,
        items: navItems,
        currentIndex: currentIndex,

        onTap: (index){

          setState((){

            if(currentIndex == 1){

              NotebookSelectionController ns = Get.find();
              ns.refreshNotebookData();

            }
            currentIndex = index;
          });

        },
      )
    );
  }
}
