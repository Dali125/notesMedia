import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import 'package:reposit_it/models/database_helper.dart';
import 'package:reposit_it/models/notes.dart';
import 'package:intl/src/intl/date_format.dart';
import '../components/n_tech_card.dart';
import '../custom_button/custom_button.dart';
import 'add_times.dart';


class TimeTableController extends GetxController{


  RxList<TimeTable> reminders = <TimeTable>[].obs;
  Rx<DateTime> dateTime = DateTime.now().obs;
  RxInt day = DateTime.now().day.obs;
  final DatabaseHelper db = DatabaseHelper();

  Future getTimeTable() async{

    List<TimeTable> data = await db.getTimetable();
    reminders.value = data;
  }

  @override
  void onInit() {

    super.onInit();
    getTimeTable();
  }

}
// class TimetableIndex extends StatefulWidget {
//   const TimetableIndex({Key? key}) : super(key: key);
//
//   @override
//   State<TimetableIndex> createState() => _TimetableIndexState();
// }
class TimetableIndex extends GetView<TimeTableController>{

  TimetableIndex();
  int dayno = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;




  @override
  Widget build(BuildContext context) {

    RxInt day = DateTime.now().day.obs;
    DateTime dateTime = DateTime.now();
    return Scaffold(



      appBar: AppBar(
      ),


      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Day and button start
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Monday',
                          style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('${day} december 2023',
                          style: TextStyle(
                              fontSize: 20
                          ),)
                      ],
                    ),
                    ColorfulButton(height: 55, width: 80, text: 'Add Task', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (builder) => TimeTableAdd())))

                  ]
              ),
            ),
            //Day and button end

            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: DatePicker(DateTime.now(),
                width: 70,
                height: 90,
                selectionColor: Colors.deepPurpleAccent,
                monthTextStyle: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                dateTextStyle: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                dayTextStyle: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),

                controller: DatePickerController(),

                onDateChange: (date){


                    controller.dateTime.value = date;
                    String formattedDate = DateFormat.yMd().format(controller.dateTime.value);
                    controller.day.value = date.day;
                    print(formattedDate);

                    // Split the date string using '/' as the separator
                    List<String> dateParts = formattedDate.split('/');

                    // Extract day, month, and year components
                    dayno = int.parse(dateParts[1]);
                    month = int.parse(dateParts[0]);
                    year = int.parse(dateParts[2]);

                    print('Day: $dayno');
                    print('Month: $month');
                    print('Year: $year');

                },
              ),

            ),

            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Activities Today'),
            ),

            Obx((){

              if(controller.reminders.isNotEmpty){
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: controller.reminders.length,
                  itemBuilder: (context, index){

                    TimeTable timetable = controller.reminders[index];

                    if(dayno == 1) {
                      return ColorfulCard(date: timetable.date,
                          startTime: timetable.startTime,
                          endTime: timetable.endTime,
                          repeating: timetable.repeating,
                          color: timetable.color,
                          subject: timetable.subject);
                    }else{
                      return Center();
                    }
                  }
                  ,
                );
              }else if(controller.reminders.isEmpty){
                return Text('data');
              }else{
                return CircularProgressIndicator();
              }
            }







            )
          ],
        ),
      ),
    );
  }


}

