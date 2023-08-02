import 'package:flutter/material.dart';
import 'package:reposit_it/ui/mobile/components/home_card.dart';
import 'package:reposit_it/ui/mobile/search/colorful_search.dart';


class IndexMain extends StatefulWidget {
  const IndexMain({Key? key}) : super(key: key);

  @override
  State<IndexMain> createState() => _IndexMainState();
}

class _IndexMainState extends State<IndexMain> {

   double fontSize = 20;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            ColorfulSearch(),
            const SizedBox(height: 40,),

            Text('Explore Various Subjects', style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold
            ),),

            const SizedBox(height: 20,),
            const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HomeNotebook(),
                  HomeNotebook(),
                  HomeNotebook(),
                  HomeNotebook(),
                ],
              ),
            )
          ],
        ),
      ),



    );
  }
}
