import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../models/database_helper.dart';
import '../components/notebook.dart';
import '../custom_fab/custom_fab.dart';
import 'notebook_add.dart';
import 'selected_note.dart';




class NotebookSelectionController extends GetxController {


  
  RxList<Notebook> notebooks = <Notebook>[].obs;

  final DatabaseHelper db = DatabaseHelper();

  refreshNotebookData() async{

    List<Notebook> data = await db.getAllNotebooks();
    notebooks.value = data;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    refreshNotebookData();
  }
}



class NoteBookSelection extends GetView<NotebookSelectionController>{

  NoteBookSelection();



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Notebooks',
          style: TextStyle(
            color: Get.isDarkMode == true ? Colors.white : Colors.black,
            fontSize: 30,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomFab(size: 40, icon: Icons.search, iconSize: 30),
          )
        ],
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.transparent
            : Colors.white,
      ),
      body: Obx((){

        if(controller.notebooks.isNotEmpty){
          return GridView.builder
            (gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 10
          ),
              itemCount: controller.notebooks.length,


              itemBuilder: (context, index){

            return InkWell(onTap: (){
                Get.put(SelectedNoteController());
                print( "${controller.notebooks[index].id} is what we want");
              Get.to(() => SelectedNote(id: controller.notebooks[index].id,
                  color: controller.notebooks[index].color!,
                  name: controller.notebooks[index].name)
              );
              },
              borderRadius: BorderRadius.circular(9),


              onLongPress: (){

              print(controller.notebooks[index].color.toString());
              showModalBottomSheet<void>(context: context,
                  builder: (BuildContext context){

                    double size = 20;

                return Container(

                  height: 400,
                  color: Color(controller.notebooks[index].color!),

                  child: Column(
                    children:  [


                      ListTile(
                        title: Text('Edit Notebook',
                          style: TextStyle(fontSize: size),
                        ),
                        leading: const Icon(Icons.edit),
                        enableFeedback: true,

                      ),
                      const SizedBox(height: 15,),
                      ListTile(
                        title: Text('Delete Notebook',
                         style: TextStyle(fontSize: size)
                        ),
                        leading: const Icon(Icons.delete),
                        enableFeedback: true,
                        onTap: () async{
                          DatabaseHelper db = DatabaseHelper();
                          final data = await db;
                          data.deleteNotebook(controller.notebooks[index].id!);
                          Get.back();
                          Fluttertoast.showToast(msg: "Notebook deleted");
                          NotebookSelectionController ct = Get.find();
                          ct.refreshNotebookData();
                        },
                      ),
                      const SizedBox(height: 15,),
                      ListTile(
                        title: Text('Share Notebook',
                            style: TextStyle(fontSize: size)
                        ),
                        leading: const Icon(Icons.share),
                        enableFeedback: true,
                      ),


                    ],
                  ),

                );


                  });

              },child:
            ColorfulNotebook(name: controller.notebooks[index].name,

                color: controller.notebooks[index].color),
            );

          }
          );
        }else if(controller.notebooks.isEmpty){

          return const Center(child: Text(
            'Click the button to create the notebook'
          ),);
        }

        else {
          return const CircularProgressIndicator();
        }

      }),
      floatingActionButton: InkWell(
        child: const CustomFab(icon: Icons.add_outlined, size: 80, iconSize: 50),
        onTap: () {
          Get.to(const NotebookAdd(), transition: Transition.fadeIn);
        },
      ),
    );
  }



}


