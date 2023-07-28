import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reposit_it/global_home_index.dart';
import 'package:reposit_it/models/database_helper.dart';
import 'package:reposit_it/ui/global_components/text_n_lable/label_n_text.dart';
import 'package:reposit_it/ui/mobile/custom_button/custom_button.dart';
import 'package:reposit_it/ui/mobile/notes/note_section.dart';

class NotebookAdd extends StatefulWidget {
  const NotebookAdd({Key? key}) : super(key: key);

  @override
  State<NotebookAdd> createState() => _NotebookAddState();
}

class _NotebookAddState extends State<NotebookAdd> {


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

  DatabaseHelper db = DatabaseHelper();
  int selectedIndex = 0;
  int? color;
  late Color backColor;
  final TextEditingController nameText = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  List<Notes> notes = [];

  NotebookSelectionController ns = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    backColor = Get.isDarkMode == true ? Get.theme.backgroundColor : Colors.white;
  }
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: backColor,


      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ns.refreshNotebookData();
          _saveNotebook();
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios),
        color:  Get.isDarkMode == true ? Colors.white : Colors.black,),
        title: Text('Add a Notebook', style:
          TextStyle(
            color: Get.isDarkMode == true ? Colors.white : Colors.black,
          ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              controller: titleController,
              decoration: const InputDecoration(

                hintText: 'Title',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                )
              ),
            ),

            SizedBox(
              height: 40,
            ),

            SizedBox(
              height: 60,
            ),
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
                              print(nameText.text);

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
            
          SizedBox(
            height: 40,
          ),
            Center(
              child: ColorfulButton(height: 60, width: 150, text: 'Create Notebook', onTap: (){


                _saveNotebook();


              }),
            )

          ],
          ),
        ),
      ),
    );
  }


  refreshDB(){
    DatabaseHelper db = DatabaseHelper();


  }

  void _saveNotebook() async {
    String name = titleController.text.toString();
    int? colors = color ?? Colors.blueAccent.value;

    Notebook notebook = Notebook(
      id: null,
      name: name,
      color: colors,
    );

    int notebookId = await db.insertNotebook(notebook);
    NotebookSelectionController nc = Get.find();
    nc.refreshNotebookData();

    print('Notebook saved with ID: $notebookId');

    Get.back();
  }

}
