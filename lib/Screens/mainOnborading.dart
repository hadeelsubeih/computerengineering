
import 'package:computerengineering/Screens/login.dart';
import 'package:flutter/material.dart';


import 'data.dart';
import 'Page_indicator.dart';


class My_App extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<My_App> with TickerProviderStateMixin {
  PageController _controller;
  int currentPage = 0;
  bool lastPage = false;
  AnimationController animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
    );
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFFFFFF)],
            tileMode: TileMode.clamp,
            begin: Alignment.topCenter,
            stops: [0.0, 1.0],
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
       // backgroundColor: Color(0xFF262C49),
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  if (currentPage == pageList.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                    animationController.reset();
                  }
                  print(lastPage);
                });
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    var page = pageList[index];
                    var delta;
                    var y = 1.0;

                    if (_controller.position.haveDimensions) {
                      delta = _controller.page - index;
                      y = 1 - delta.abs().clamp(0.0, 1.0);
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Center(child:Image.asset(page.imageUrl,scale: 1.5,),),
                        Container(
                          margin: EdgeInsets.only(left: 12.0),
                          height: 100.0,
                          child: Stack(
                            children: <Widget>[

                              Padding(
                                padding: EdgeInsets.only(top: 30.0, left: 22.0),
                                child:new Center(child:Text(
                                  page.title,
                                  textAlign: TextAlign.center,

                                  style: TextStyle(color: Colors.black,fontWeight:FontWeight.w600,

                                    fontSize: 25.0,

                                  ),
                                ),),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            width:300,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 34.0, top: 12.0),
                              child: Transform(
                                transform:
                                Matrix4.translationValues(0, 50.0 * (1 - y), 0),
                                child: Text(
                                  page.body,textAlign: TextAlign.center,
                                  style: TextStyle(

                                      fontSize: 20.0,

                                      color: Color(0xFF9B9B9B)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                      Center (child:Container(
                            width: 60.0,
                            child: PageIndicator(currentPage, pageList.length)),
                    )
                    ],
                    );
                  },
                );
              },
            ),



            Positioned(
              right: 15.0,
              left: 15.0,
              bottom: 30.0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: lastPage
                    ?Center(child:  FlatButton(

                 child:Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12.0),
                       gradient:  LinearGradient(
                           colors: [Color(0xff04B0A0),  Color(0xff018476)],
                           tileMode: TileMode.clamp,
                           begin: Alignment.topRight,
                           stops: [0.0, 1.0],
                           end: Alignment.bottomCenter)
                   ),

                height: 48,
                width: 375,
                margin: EdgeInsets.symmetric(horizontal: 15),

                child:  Center(
                  child: Text("أبدأ الأن", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context)=>  LogIn()));
                   // Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Home()));
                  },
                ),)

                    : Container( height: 48,
                  width: 375,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
