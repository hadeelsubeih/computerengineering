import 'package:flutter/material.dart';
import 'package:computerengineering/Models/category.dart';
import 'package:computerengineering/Widget/catgeory_widget.dart';
import 'package:computerengineering/services/app_state.dart';
import 'package:provider/provider.dart';


class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Consumer<AppState>(
            builder: (context, appState, _) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 42.0,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (final category in categories)
                      CategoryWidget(
                        category: category,
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
