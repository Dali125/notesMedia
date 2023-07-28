import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LabelNText extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final double containerHeight;
  final double containerWidth;
  final Widget? widget;

  const LabelNText({Key? key,
    required this.labelText,
    required this.controller,
    required this.containerHeight,
    required this.containerWidth, this.widget, required this.hintText}) : super(key: key);

  @override
  State<LabelNText> createState() => _LabelNTextState();
}

class _LabelNTextState extends State<LabelNText> {
  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(widget.labelText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        SizedBox(height: 10,),

        Container(
          height: widget.containerHeight,
          width: widget.containerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Get.isDarkMode == true ? Colors.white : Colors.black
            )
          ),

          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: TextField(
                      readOnly: widget.widget == null? false: true,
                      controller: widget.controller,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
              ),
              widget.widget == null ? Container() : Container(
                child: widget.widget,
              )
            ],
          ),
        )
      ],
    );
  }
}
