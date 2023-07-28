
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:reposit_it/models/database_helper.dart';
import 'package:reposit_it/ui/mobile/timetable/timetable_home.dart';
import '../../../models/notes.dart';
import '../../global_components/text_n_lable/label_n_text.dart';
import '../custom_button/custom_button.dart';

class TimeTableAdd extends StatefulWidget {
  const TimeTableAdd({Key? key}) : super(key: key);

  @override
  State<TimeTableAdd> createState() => _TimeTableAddState();
}

class _TimeTableAddState extends State<TimeTableAdd> {


  Future<List<Map<String, dynamic>>>? data;
  NotesDatabaseHelper mydb = NotesDatabaseHelper();


  final TextEditingController controller = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController RepeatController = TextEditingController();
  TimeOfDay startTime = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime   = TimeOfDay(hour: 0, minute: 0);
  DateTime pickDate = DateTime.now();


  int color = 0;
  int selectedIndex = 0;
  double boxHeight = 50;




  // List of items in our dropdown menu
  var items = [
    'Hourly',
    'Daily',
    'Weekly',
    'Monthly',
  ];

  @override
  void initState() {

    data = NotesDatabaseHelper.getItems();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.tealAccent,
      Colors.yellow,
      Get.isDarkMode == true ? Colors.white : Colors.black,
      Colors.deepOrange,
      Colors.pink,
      Colors.deepPurpleAccent,
      Colors.indigoAccent
    ];


    return Scaffold(


      appBar: AppBar(


        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,
          color: Get.isDarkMode == true ? Colors.white : Colors.black,
          ),
          onPressed: (){

            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


            const Text("Add Task",
                style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 30),
              ),

              SizedBox(
                height: 20,
              ),
              LabelNText(labelText: 'Task/Subject',
                controller: controller,
                containerHeight: boxHeight,
                containerWidth: width,
                hintText: 'Mathematics',
              ),

              SizedBox(height: 20,),
              LabelNText(labelText: 'Date',
                  controller: dateController,
                  containerHeight: boxHeight,
                  containerWidth: width,
                  hintText: 'Today',
                  widget: IconButton(
                    icon: const Icon(Icons.calendar_month_outlined,
                    ), onPressed: () {
                      _selectDate(context);
                  },
                  ),),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  LabelNText(labelText: 'Start Time',
                    controller: timeController,
                    containerHeight: boxHeight,
                    containerWidth: width/2.2,
                    hintText: 'Today',
                    widget: IconButton(
                      icon: const Icon(Icons.access_time,
                      ), onPressed: () {

                       _selectTime(context);

                    },
                    ),),


                  LabelNText(labelText: 'End Time',
                    controller: endTimeController,
                    containerHeight: boxHeight,
                    containerWidth: width/2.2,
                    hintText: 'Today',
                    widget: IconButton(
                      icon: const Icon(Icons.access_time,
                      ), onPressed: () {

                        _selectEndTime(context);
                    },
                    ),),
                ],
              ),
              SizedBox(height: 20,),
              LabelNText(labelText: 'Repeat',
                controller: RepeatController,
                containerHeight: boxHeight,
                containerWidth: width,
                hintText: 'Weekly',
                widget: DropdownButton(

                  // Initial Value
                  value: 'Hourly',

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      RepeatController.text = newValue!;

                    });
                  },
                ),

                //Dropdown here
              ),

              SizedBox(height: 20,),

              Text('Color', style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Wrap(
                    children: List<Widget>.generate(10, (index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(25),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          child: CircleAvatar(

                            backgroundColor: colors[index],
                            radius: 25,
                            child: selectedIndex == index ? Icon(Icons.check,
                            color: Get.isDarkMode == true ? Colors.black: Colors.white,): Container(height: 0,),
                          ),
                          onTap: (){

                            setState((){
                              selectedIndex = index;

                              color = colors[selectedIndex].value;
                            });
                          print(selectedIndex);
                          },
                        ),
                      ),
                    ))
                  )
                ],
              ),

              Center(
                child: ColorfulButton(height: 60, width: 80, text: 'Save', onTap: () async{


//TODO Check on function later
                  createTimeTable();
                  TimeTableController tc = Get.find();
                  tc.getTimeTable();

                  Get.back();

                }),
              )

            ],

          ),
        ),
      ),
    );

  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Format the picked time as a string
      String formattedTime = pickedTime.format(context);


      setState((){

        startTime = pickedTime;
      });
      // Update the controller's value
      timeController.text = formattedTime;
    }
  }


  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Format the picked time as a string
      String formattedTime = pickedTime.format(context);
      setState((){

        endTime = pickedTime;
        print(formattedTime);
      });

      // Update the controller's value
      endTimeController.text = formattedTime;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021), // Set the desired starting date
      lastDate: DateTime(2030), // Set the desired ending date
    );

    if (pickedDate != null) {
      // Format the picked date as a string
      String formattedDate = DateFormat.yMd().format(pickedDate);
      pickDate = pickedDate;

      print(formattedDate);

      // Update the desired variable or controller with the formatted date
      // For example, if you want to update a TextEditingController named 'dateController':
      dateController.text = formattedDate;
    }
  }

  createTimeTable() async{

    final DatabaseHelper db = DatabaseHelper();
    final database = await db;
    final TimeData = TimeTable(
        subject: controller.text,
        date: dateController.text,
        startTime: timeController.text,
        endTime: endTimeController.text,
        repeating: RepeatController.text,
        color: color);
    database.insertTimeTable(TimeData);
  }

  int timeOfDayToMinutes(TimeOfDay timeOfDay) {
    return timeOfDay.hour * 60 + timeOfDay.minute;
  }

  TimeOfDay minutesToTimeOfDay(int minutes) {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;
    return TimeOfDay(hour: hour, minute: minute);
  }


}
