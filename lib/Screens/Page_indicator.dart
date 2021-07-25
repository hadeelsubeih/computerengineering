import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;
  PageIndicator(this.currentIndex, this.pageCount);

  _indicator(bool isActive) {
    return  Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height:isActive ? 12.0:8.0,
          width:isActive ? 12.0:8.0,
          decoration: BoxDecoration(
            borderRadius:isActive ? BorderRadius.circular(12):BorderRadius.circular(4),
              color: isActive ? Color(0xFF018476): Color(0xFF304B0A0),
//              boxShadow: [
//                BoxShadow(
//                    color: Colors.black12,
//                    offset: Offset(0.0, 2.0),
//                    blurRadius: 2.0)
//              ]
              ),
        ),
      );
  }

  _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorList
          .add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: _buildPageIndicators(),
    );
  }
}