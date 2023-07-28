import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double textSize = 15;
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Scaffold(




      body: Column(
        children: [
          Stack(
            children: [

              Container(
                height: 200,
                width: width,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  color: Colors.lightBlueAccent,
                  border: Border.all(),
                ),
                child: Row(
                  children: [
                    Expanded(child: Container(
                      width: 600,
                      height: 50,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.person, size: 90,),
                    )
                  ],
                )
              ),

              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: AnimatedContainer(
                  height: 150,
                  width: width/1.8,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)
                    ),
                    color: Colors.blue,
                    border: Border.all(
                      color: Get.isDarkMode == true ? Colors.white : Colors.black,
                    )
                  ), duration: Duration(milliseconds: 3000),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 85, right: 30),
                child: Container(
                  height: 150,
                  width: width/1.8,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),


                    ),
                    border: Border.all(
                      color: Get.isDarkMode == true ? Colors.white : Colors.black,
                    ),
                    color: Get.isDarkMode == true ? Colors.black : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text("Dalitso",
                        style: TextStyle(
                          fontSize: textSize
                        ),
                        ),
                        SizedBox(height: 20,),
                        Text("Student",
                          style: TextStyle(
                              fontSize: textSize
                          ),),
                        SizedBox(height: 10,),
                        Text("Senior Secondary",
                          style: TextStyle(
                              fontSize: textSize
                          ),)
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
          Text("Logout")
        ],
      ),



    );
  }
}
