import 'package:computerengineering/Screens/Sectionactivityscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivitiesHome extends StatefulWidget {
  @override
  _ActivitiesHomeState createState() => _ActivitiesHomeState();
}

class _ActivitiesHomeState extends State<ActivitiesHome> {
  int select=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Computer Engineering"),
        backgroundColor:Color(0xff018476), //Color(0xFF00838f),//105370//14418a
        centerTitle: true,
        elevation: 6,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            // onPressed: () {
            //   showSearch(
            //       context: context, delegate: DataSearch(list: listsearch));
            //}
          )
        ],
      ),
      body: Center(
        child: Container(
          height: select==0?MediaQuery.of(context).size.height*0.48:MediaQuery.of(context).size.height*0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.spaceAround ,
            children: [
              Box("النادي الهندسي",1),
              Box("مجلس الطلبة",2),
              Box("IEEE",3),
              Box("المنتدى",3),
            ],
          ),
        ),
      ),
    );
  }

  Widget Box(String sectionName,int s) {
    return  InkWell(
      onTap: (){
        setState(() {
          Navigator.push(context, new MaterialPageRoute(builder: (context)=>  Sectionactivityscreen(sectionName)));
        });
      },
      child:Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.08,
            width: MediaQuery.of(context).size.width*0.8,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.00),
              boxShadow: [BoxShadow(
                  color: Color.fromRGBO(34, 134, 234, .3),
                  blurRadius: 5,
                  offset: Offset(0, 4)
              )],
              gradient: LinearGradient(
                  colors: [Color(0xff04B0A0),  Color(0xff018476)],
                  tileMode: TileMode.clamp,
                  begin: Alignment.centerRight,
                  stops: [0.0, 1.0],
                  end: Alignment.bottomCenter),
            //  color: Color(0xFF80deea),borderRadius: BorderRadius.circular(10.00),
            ),
            child:Center(
              child: Row(
                children: [
                  Center(
                    child: Text(
                      sectionName,
                      style: TextStyle(
                        fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color:Colors.white,
                      ),),
                  ),

                  Spacer(),
                  InkWell(
                      onTap: (){
                        setState(() {
                          select=s;
                        });
                      },
                      child: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 24,)),

                ],
              ),
            ),
          ),
          select==s?Container(
            height: MediaQuery.of(context).size.height*0.2,
            width: MediaQuery.of(context).size.width*0.8,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                  color: Color.fromRGBO(34, 134, 234, .3),
                  blurRadius: 1,
                  offset: Offset(0, 1)
              )],
              color: Colors.grey[200],borderRadius: BorderRadius.circular(4.00),
            ),
            child: Column(
              children: [
                Text(
                  sectionName,
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color:Colors.black45,
                  ),),
              ],
            ),
          ):Container(

          ),
        ],
      ),
    );}
}
