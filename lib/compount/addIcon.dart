
import 'package:flutter/material.dart';

class AddIcon extends StatefulWidget {
  var data;
  var  type;
  @override
  _AddIconState createState() => _AddIconState(data,type);

  AddIcon(this.data,this.type);
}

class _AddIconState extends State<AddIcon> {
  var data;
  var  type;
  _AddIconState(this.data,this.type);

  bool Like=false;
  bool Comment=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.width*0.23,
      child: Align(
        //   heightFactor: 0.7,
          alignment: Alignment.topCenter,
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: MediaQuery.of(context).size.width*0.23,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  // boxShadow: [BoxShadow(
                  //     color: Color.fromRGBO(34, 134, 234, .3),
                  //     blurRadius: 1,
                  //     offset: Offset(2, 1)
                  // )],
                  borderRadius: BorderRadius.circular(10.0),),
                // margin:EdgeInsets.all(8.0) ,
                child:Container(
                  height: MediaQuery.of(context).size.height*0.16,
                  child: Row(
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
                                    child: Image.asset(type=="مجلس الطلبة"?"assets/مجلس طلاب.jpg":type=="IEEE"?"assets/IEEE.jpg":"assets/club.jpg",fit: BoxFit.fitWidth,height: 42,width:42,),
                                  ),),
                              ),
                            ),
                          ),
                        //  SizedBox(width: 10,),

            Container(width:10),

                      Container(
                        padding: EdgeInsets.only(top: 5),
                        height: MediaQuery.of(context).size.height*0.16,
                        width: MediaQuery.of(context).size.width*0.69,
                        child: TextFormField(//onChanged: (val)=>setState((){searchWord=val;}),
                          cursorColor: Color(0xff018476),

                          keyboardType:TextInputType.text,
                          autofocus: false,
                          textAlign: TextAlign.right,//(val)=>setState(()=>Name=val)
                          // onChanged:onChanged ,
                          // controller:controller ,
                          obscureText: false,


                          decoration: InputDecoration(
                              focusColor: Color(0xff018476),
                              //   suffixIcon: Icon(Icons.arrow_drop_down,color:text=="الدولة"|| text=="النوع"||text=="تاريخ الميلاد"?Colors.grey[300]: Color(0x0ffff),),
                              contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(width: 1,color: Colors.grey[300]),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(width: 1,color:Color(0xff018476))
                              ),
                              filled: true,
                              fillColor: Color(0xFFF8F8F8).withOpacity(0.7),
                              // prefixIcon:tajerAccount?Image.asset("Assets/icon-store.png",color:Color(0xfff99b1d),):Image.asset("Assets/icon-account.png") ,

                              hintText:"إنشاء منشور",

                              // icon:tajerAccount?Image.asset("Assets/icon-store.png",color:Color(0xfff99b1d),):Image.asset("Assets/icon-account.png") ,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color:Color(0xff5e5e5e).withOpacity(0.48),
                              ),
                              labelStyle: null
                          ),

                        ),
                      )
                    ],
                  ),
                ),

            ),
          ) ),
    );
  }
}