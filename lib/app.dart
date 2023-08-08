import 'package:flutter/material.dart';
import 'package:reposit_it/global_home_index.dart';
import 'package:reposit_it/themes/dark_themw.dart';
import 'package:get/get.dart';
import 'package:reposit_it/ui/mobile/notes/note_section.dart';
import 'package:reposit_it/ui/mobile/notes/selected_note.dart';
import 'package:reposit_it/ui/mobile/timetable/timetable_home.dart';
import 'package:reposit_it/ui/splash_screen/splash.dart';
import 'constants/device_constants.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DeviceDimensions dimensions = DeviceDimensions();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(elevation: 0, backgroundColor: Colors.white)),
      darkTheme: darkTheme,
      home: SplashScreen(),
    );
  }
}

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimeTableController>(() => TimeTableController());
    Get.lazyPut<SelectedNoteController>(() => SelectedNoteController());
    Get.lazyPut<NotebookSelectionController>(
        () => NotebookSelectionController());
  }
}
