import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reposit_it/models/database_helper.dart';
import 'package:reposit_it/ui/mobile/notes/selected_note.dart';
import 'package:toast/toast.dart';

class NoteAdd extends StatefulWidget {

  final int? id;
  const NoteAdd({Key? key, required this.id}) : super(key: key);

  @override
  State<NoteAdd> createState() => _NoteAddState();
}

class _NoteAddState extends State<NoteAdd> {



  DatabaseHelper db = DatabaseHelper();

  final TextEditingController title = TextEditingController();
  final TextEditingController body = TextEditingController();

  @override
  Widget build(BuildContext context) {



    print(widget.id);
    return Scaffold(

      appBar: AppBar(),


      body: SingleChildScrollView(
        child: WillPopScope(
          onWillPop: () async{

            if(title.text.isEmpty && body.text.isEmpty){

            }
            else{
              _saveNote();



            }

            print('object');

            return true;
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [



                TextField(

                  controller: title,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                  decoration: const InputDecoration(

                    hintText: 'Title',
                    hintStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none

                  ),
                ),


                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                TextField(

                  controller: body,
                  maxLines: null,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: const InputDecoration(


                      hintText: 'Content',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none

                  ),
                ),
              ],
            ),
          ),
        ),
      ),




    );
  }




  _saveNote(){

    Notes note = Notes(notebookId: widget.id!, title: title.text.toString(),
        body: body.text.toString(),
        color: Colors. blueAccent.value, noteId: null);
    db.insertNote(note);


    SelectedNoteController ct = Get.find();
    ct.refreshData(widget.id!);


  }
}
