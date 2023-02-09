import 'package:flutter/material.dart';
import 'package:untitled1/Place/ui/widgets/review_list.dart';

import '../widgets/description_place.dart';
import 'header_appbar.dart';

class HomeTrips extends StatelessWidget {

  String descriptionDummy = '''Try running your application with "flutter run". You'll see the
  // application has a blue toolbar. Then, without quitting the app, try
  // changing the primarySwatch below to Colors.green and then invoke
  // "hot reload" (press "r" in the console where you ran "flutter run",''';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace('Bahamas', 2.5, descriptionDummy),
           /* ReviewList(),*/
          ],
        ),
        HeaderAppbar()
      ],
    );
  }

}