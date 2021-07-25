import 'package:computerengineering/Models/category.dart';
import 'package:flutter/material.dart';
import 'package:computerengineering/Models/category.dart';
import 'package:provider/provider.dart';
import 'package:computerengineering/services/app_state.dart';



class CategoryWidget extends StatelessWidget {
   Category category;
   CategoryWidget({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategory == category.categoryId;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategory(category.categoryId);
        }
      },
      child: Container(

        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient:isSelected ?  LinearGradient(
              colors: [Color(0xff04B0A0),  Color(0xff018476)],
              tileMode: TileMode.clamp,
              begin: Alignment.topRight,
              stops: [0.0, 1.0],
              end: Alignment.bottomCenter):LinearGradient(
              colors: [Colors.transparent,  Colors.transparent],
              tileMode: TileMode.clamp,
              begin: Alignment.centerRight,
              stops: [0.0, 1.0],
              end: Alignment.bottomCenter),
         // color: isSelected ? Color(0xFF035578) : Colors.transparent,
          borderRadius: BorderRadius.circular(22.0),
        ),
        child: Center(
          child: Text(
            category.name,

            style: isSelected
                ? TextStyle(color: Colors.white,fontSize: 12,fontFamily: "Tajawal",fontWeight: FontWeight.bold)
                : TextStyle(color: Colors.black45,fontSize: 12,fontFamily: "Tajawal",fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
