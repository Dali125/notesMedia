import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../models/database_helper.dart';
import '../components/note_stucture.dart';
import '../custom_fab/custom_fab.dart';
import 'notebook_notes/note_add.dart';
import 'notebook_notes/note_edit.dart';



class SelectedNoteController extends GetxController {

  final RxList<Notes> notesList = <Notes>[].obs;
  final DatabaseHelper db = DatabaseHelper();
  int? notebookId; // Add a variable to hold the notebookId

  void refreshData(int id) async {
    notebookId = id; // Set the notebookId when refreshing data
    List<Notes> notes = await db.getNotesbyId(id);
    notesList.value = notes;
  }
  @override
  void onInit() {
    super.onInit();
  }
}

class SelectedNote extends GetView<SelectedNoteController> {
  final int? id;
  final int color;
  final String name;

  SelectedNote({
    Key? key,
    required this.id,
    required this.color,
    required this.name,
  }) : super(key: key){
    controller.refreshData(id!);
  }

  @override
  Widget build(BuildContext context) {

    print(id.toString() + "hmm");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color),
        title: Text(
          name,
          style: TextStyle(
            color: Get.isDarkMode == true ? Colors.white : Colors.black,
            fontSize: 25,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomFab(
              size: 40,
              icon: Icons.search,
              iconSize: 30,
            ),
          )
        ],
        elevation: 0,
        toolbarHeight: 70,
      ),
      body: Obx(() {
        if (controller.notesList.isNotEmpty ) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: controller.notesList.length,
              itemBuilder: (context, index) {
                print(controller.notesList[index].notebookId);
                return GestureDetector(
                  child: NoteStructure(

                    id: controller.notesList[index].notebookId,
                    title: controller.notesList[index].title,
                    body: controller.notesList[index].body,
                    color: controller.notesList[index].color!,
                  ),
                  onLongPress: (){

                    showModalBottomSheet<void>(context: context,
                        builder: (BuildContext context){

                          double size = 20;

                          return Container(

                            height: 400,
                            color: Color(controller.notesList[index].color!),

                            child: Column(
                              children:  [



                                const SizedBox(height: 15,),
                                ListTile(
                                  title: Text('Delete Note',
                                      style: TextStyle(fontSize: size),
                                  ),
                                  leading: const Icon(Icons.delete),
                                  enableFeedback: true,
                                  onTap: () async{
                                    DatabaseHelper database = DatabaseHelper();
                                    final db = await database;
                                    db.deleteNote(controller.notesList[index].noteId!);
                                    Get.back();
                                    SelectedNoteController ct = Get.find();
                                    ct.refreshData(controller.notesList[index].notebookId);

                                    Fluttertoast.showToast(msg: "Succesfully Deleted",);
                                  },
                                ),
                                const SizedBox(height: 15,),
                                ListTile(
                                  title: Text('Share Note',
                                      style: TextStyle(fontSize: size)
                                  ),
                                  leading: const Icon(Icons.share),
                                  enableFeedback: true,
                                ),


                              ],
                            ),

                          );


                        });
                  },onTap: (){

                    print(controller.notesList[index].noteId);
                    print(controller.notesList[index].notebookId);

                    Get.to(() => NoteEdit(

                      id: controller.notesList[index].noteId,
                      notebookId: controller.notesList[index].notebookId,
                      title:controller.notesList[index].title,
                      body: controller.notesList[index].body,

                    ));
                }
                );
              },
            ),
          );
        } else if (controller.notesList.isEmpty) {
          return const Center(

            child : Text('Click the  \' +  \'  button to create a note ')
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
      floatingActionButton: InkWell(
        child: const CustomFab(
          icon: Icons.add_outlined,
          size: 80,
          iconSize: 50,
        ),
        onTap: () {
          Get.to(() => NoteAdd(id: id), transition: Transition.fadeIn);
        },
      ),
    );
  }
}