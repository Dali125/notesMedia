import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeNotebook extends StatefulWidget {
  const HomeNotebook({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeNotebook> createState() => _HomeNotebookState();
}

class _HomeNotebookState extends State<HomeNotebook> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 20,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 170,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30, left: 10),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 20,
            child: DottedBorder(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              dashPattern: [8, 4],
              borderType: BorderType.RRect,
              radius: Radius.circular(20),
              strokeWidth: 2,
              child: Container(
                  width: 150,
                  height: 195,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Mafus",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
