
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  var data;
   var  type;
  @override
  _PostState createState() => _PostState(data,this.type);

  Post(this.data,this.type);
}

class _PostState extends State<Post> {
  var data;  var  type;

  _PostState(this.data,this.type);

  bool Like=false;
   bool Comment=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Align(
        //   heightFactor: 0.7,
          alignment: Alignment.topCenter,
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              
                decoration: BoxDecoration(
                  // boxShadow: [BoxShadow(
                  //     color: Color.fromRGBO(34, 134, 234, .3),
                  //     blurRadius: 1,
                  //     offset: Offset(2, 1)
                  // )],
                  borderRadius: BorderRadius.circular(10.0),),
                // margin:EdgeInsets.all(8.0) ,
                child:Stack(
                  children: [
                    Container(
                      width:MediaQuery.of(context).size.width*0.9,
                      height:data['content'].length>200?MediaQuery.of(context).size.width*0.67:data['content'].length>100? MediaQuery.of(context).size.width*0.53:MediaQuery.of(context).size.width*0.43,
                      // margin: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // image: DecorationImage(
                        //   image: AssetImage('assets/slider/1.png'),
                        //   fit: BoxFit.cover,
                        // ),
                      ),),
                    Positioned(
                        left: 10, bottom: 10,
                        child:Row(
                          children: [


                            Row(
                              children: [
                                Text("${data['likes'].length}"),
                                SizedBox(width:8,),
                                Container(
                                  height: 35.00,
                                  width: 35.00,
                                  // padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),borderRadius: BorderRadius.circular(15.00),
                                  ),
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(15.00),
                                    child: new Container(
                                      height: 35.00,
                                      width: 35.00,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Color(0xffffffff),borderRadius: BorderRadius.circular(15.00),
                                      ),
                                      child:     InkWell(
                                          onTap: (){
                                            setState(() {
                                              Like=!Like;
                                            });
                                          },
                                          child: Center(child:!Like? Image.asset("assets/like.png",scale: 0.55,color: Colors.grey,):Image.asset("assets/likefill.png",scale: 0.85,color: Colors.blue,))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10,),

                            Row(
                              children: [
                                Text("${data['comments'].length}"),
                                SizedBox(width: 8,),
                                Container(
                                  height: 35.00,
                                  width: 35.00,
                                  // padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),borderRadius: BorderRadius.circular(15.00),
                                  ),
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(15.00),
                                    child: new Container(
                                      height: 35.00,
                                      width: 35.00,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Color(0xffffffff),borderRadius: BorderRadius.circular(15.00),
                                      ),
                                      child:     InkWell(
                                          onTap: (){
                                            setState(() {
                                              Comment=!Comment;
                                            });
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) => SingleChildScrollView(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:Colors.white,
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(20.0),
                                                      topRight: Radius.circular(20.0),
                                                    ),
                                                  ),

                                                  padding: EdgeInsets.only(
                                                      bottom: MediaQuery.of(context).viewInsets.bottom),
                                                  child: BottomSheetExample(context,'o',data),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Center(child:!Comment? Image.asset("assets/comment.png",scale: 0.55,color: Colors.grey,):Image.asset("assets/Comment.png",scale: 0.85,color: Colors.grey,))),
                                    ),
                                  ),
                                ),



                              ],
                            ),
                            SizedBox(width: 10,),


                          ],

                        )),

                    Positioned(
                        right: 10, top: 10,
                        child:Row(
                          children: [
                            Container(

                              // padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),borderRadius: BorderRadius.circular(25.00),
                              ),
                              child: Material(
                                elevation: 3,
                                borderRadius: BorderRadius.circular(25.00),
                                child: new Container(

                                 // padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),borderRadius: BorderRadius.circular(25.00),
                                  ),
                                  child:     InkWell(
                                      onTap: (){
                                        setState(() {
                                          Like=!Like;
                                        });
                                      },// CircleAvatar(child:Image.asset("assets/club.jpg"),radius: 25,)
                                      child:   ClipOval(
                                    // radius: 45,
                                    child: Image.asset(type=="مجلس الطلبة"?"assets/مجلس طلاب.jpg":type=="IEEE"?"assets/IEEE.jpg":"assets/club.jpg",fit: BoxFit.fitWidth,height: 45,width:45,),//مجلس طلاب.jpg
                                ),),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),



                          ],

                        )),
                    Positioned(
                        right: 30, top: 70,
                        child:Row(
                          children: [
                            Container(
                              width:250,// يهديكم النادي الهندسي أطيب التهاني والأمنيات بمناسبة بدء العام الدراسي الجديد\n ونتمني لكم فصلاً مليئا بالتفوق والإبدا
                              child: Text('''${data['content']} ''', textAlign: TextAlign.right,style: TextStyle(
                                color: Colors.black,

                              ),),
                            ),
                            SizedBox(width: 10,),
                          ],

                        )),

                  ],
                )

            ),
          ) ),
    );
  }
  BottomSheetExample(context,String text,data){
    return
      Container(
        color: Colors.black45.withOpacity(0.56),

        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color:Colors.white,
            boxShadow: [BoxShadow(
                color: Color.fromRGBO(34, 134, 234, .3),
                blurRadius: 20,
                offset: Offset(0, 10)
            )],


            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0),
              topRight: Radius.circular(22.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 16,),
              Center(
                child:  Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color:Color(0xff3d3b39),
                  ),
                ),
              ),
              Container(
                height:  MediaQuery.of(context).size.height*0.75,
                width: MediaQuery.of(context).size.width,

                color: Colors.white,
                child:menu(),
              ),

            ],
          ),
        ),
      );
  }
  Widget menu(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(),
              Container(alignment: Alignment.bottomCenter,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                //  color: Colors.black12,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                         //   controller: messageEditingController,
                            style: simpleTextStyle(),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(width: 1,color: Colors.grey[300]),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(width: 1,color:Color(0xff38056e))
                                ),
                              fillColor: Colors.black12,
                                filled: true,
                                hintText: "أكتب تعليق .....",
                                hintStyle: TextStyle(
                                  color: Colors.black12,
                                  fontSize: 16,
                                ),
                               // border: InputBorder.none
                            ),
                          )),
                      SizedBox(width: 16,),
                      GestureDetector(
                        onTap: () {
                       //   addMessage();
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xff04B0A0),  Color(0xff018476)],
                                    begin: FractionalOffset.topLeft,
                                    end: FractionalOffset.bottomRight
                                ),
                                borderRadius: BorderRadius.circular(40)
                            ),
                            padding: EdgeInsets.all(12),
                            child: Image.asset("assets/send.png",
                              height: 25, width: 25,)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
  TextStyle simpleTextStyle() {
    return TextStyle(color: Colors.white, fontSize: 16);
  }
}
