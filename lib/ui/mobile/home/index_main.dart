import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reposit_it/ui/mobile/components/home_card.dart';
import 'package:reposit_it/ui/mobile/search/colorful_search.dart';
import 'package:reposit_it/ui/mobile/search/search_home.dart';
import 'package:reposit_it/ui/mobile/subjects/all_subjects.dart';
import 'package:reposit_it/ui/mobile/subjects/selected_subject.dart';

class IndexMain extends StatefulWidget {
  const IndexMain({Key? key}) : super(key: key);

  @override
  State<IndexMain> createState() => _IndexMainState();
}

class _IndexMainState extends State<IndexMain> {
  double fontSize = 18;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: ColorfulSearch(),
                onTap: () {
                  print("tapped");
                  Get.to(() => SearchHome());
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore Various Subjects',
                      style: TextStyle(
                          fontSize: fontSize, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      child: const Text('View all',
                          style: TextStyle(
                              color: Colors.lightBlueAccent, fontSize: 18)),
                      onTap: () {
                        Get.to(() => const Subject());
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: HomeNotebook(),
                        onTap: () {
                          //TODO Selected subject from firebase by id
                          Get.to(() => const SelectedSubject());
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
