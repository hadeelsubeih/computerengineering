import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:computerengineering/Models/category.dart';
import 'package:computerengineering/Widget/catgeory_widget.dart';
import 'package:computerengineering/Widget/loading.dart';
import 'package:computerengineering/api/NetworkRequest.dart';
import 'package:computerengineering/compount/Post.dart';
import 'package:computerengineering/compount/mydrawer.dart';
import 'package:computerengineering/compount/tabs.dart';
import 'package:computerengineering/services/app_state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data;
  var data2;
  Future<String> getSWData() async {
    print("pppppppppp");

    var res = await http
        .get(Uri.encodeFull('http://iug0project.herokuapp.com/api/user/users'), headers: {"Accept": "application/json","Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYiLCJpYXQiOjE2MjIyNzY1NTN9.xL9460nYG2knGFsestwvTY_XS05B--_pPFOF5LgjygU"});
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
    });

    print(data);

    return "Sucess";
  }
  Future<String> getSWData2() async {
    print("llllllllll");
    var res = await http
        .get(Uri.encodeFull('http://iug0project.herokuapp.com/api/admin/Advertising'), headers: {"Accept": "application/json","Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYiLCJpYXQiOjE2MjIyNzY1NTN9.xL9460nYG2knGFsestwvTY_XS05B--_pPFOF5LgjygU"});
    var resBody = json.decode(res.body);

    setState(() {
      data2 = resBody;
    });

    print(data2);

    return "Sucess";
  }
  @override
  void initState() {
   // conditionsOfJoining=false;
    super.initState();
    this.getSWData();
    getSWData2();
  }
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  Widget build(BuildContext context) {
   // networkRequest.getAdvertising();
    return Scaffold(
      appBar: AppBar(
        title: Text("Computer Engineering"),
        backgroundColor: Color(0xFF018476),//105370//14418a
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
      drawer: MyDrawer(),
      body: FutureBuilder<dynamic>(
    future: networkRequest.getAdvertising() ,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    return Column(

  children: [
      Expanded(
      child: Stack(
      alignment: Alignment.center,
        children: [
         Positioned(
           top:0,
           right: 0,
           left: 0,
           child: Container(
      height: 300,
      width: double.infinity,
      child: Carousel(
        images: [
    ...snapshot.data.map((name) {
    return   NetworkImage(name['picture']);},)
        //  NetworkImage(url)
            // AssetImage('assets/slider/1.png'),
            // AssetImage('assets/slider/2.png'),
            // AssetImage('assets/slider/1.png'),
        ],
        dotSize: 8,
        dotIncreaseSize: 2,
        dotSpacing: 20,
        dotColor: Colors.white,
        dotBgColor: Colors.black.withOpacity(0.5),
        boxFit: BoxFit.cover,
        dotIncreasedColor: Color(0xff018476),
      ),
    ),
         ),
      ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: Consumer<AppState>(
      builder: (context, appState, _) =>     DraggableScrollableSheet(
              maxChildSize: 0.999,
              minChildSize: 0.52,
              initialChildSize:0.55 ,
              builder: (BuildContext context, ScrollController scrolController){
                return Stack(
                  children: [
                    // Positioned(
                    //   child:   MyTabs(),
                    // ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,

                        boxShadow: [BoxShadow(
                            color: Colors.black45,
                            blurRadius: 1,
                            offset: Offset(2, 1)
                        )],
                        borderRadius: BorderRadius.circular(2.0),),
                      child:ListView(
                        controller: scrolController,
                        // controller: controller,
                        children: [
                          SizedBox(height: 52,),

                          appState.selectedCategory==1?   ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                double scale = 1.0;
                               return Container(
                                 padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
                                 child: Column(
                                   children: [
                                     Text("جدول اختبار النهائية فصل الدراسى الثانى"),
                                     Text("سنة خامسة"),

                                     Image.asset("assets/exam5.PNG"), SizedBox(height: 8,),
                                     Text("جدول اختبار النهائية فصل الدراسى الثانى"),
                                     Text("سنة رابعة"),
                                     Image.asset("assets/exam5.PNG"), SizedBox(height: 8,),
                                     Text("جدول اختبار النهائية فصل الدراسى الثانى"),
                                     Text("سنة تالتة"),
                                     Image.asset("assets/exam5.PNG"), SizedBox(height: 8,),
                                     Text("جدول اختبار النهائية فصل الدراسى الثانى"),
                                     Text("سنة تانية"),
                                     Image.asset("assets/exam5.PNG"),
                                   ],
                                 ),
                               );
                              }):appState.selectedCategory==3? Container(
                            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 7),
                            child: Text('''مجالات عمل الخريجين:
                            
خريجو قسم الحاسوب يعملون في مجالات كثيرة تتنوع بين إنشاء أنظمة حاسوبية لتنظيم أمور الشركات وأتمتة العمليات فيها وربطها بالعالم الخارجي، وصيانة الأنظمة المختلفة، وبين العمل في  مجال تطوير الأنظمة مثل تطوير نظم التشغيل ولغات البرمجة. أيضا يمكن لمهندس الحاسوب  العمل في المجالات البحثية والعلمية المختلفة ,واضل في

  قطاع الاتصالات السلكية و اللاسلكية .
انظمة الحاسوب و الدوائر الرقمية 
شبكات الحاسوب
امن و حماية شبكات الحاسوب والبيانات 
تصميم و برمجة و تطوير الروبوت 
البرامج الحاسوبية بما فيها المواقع الالكترونية و قواعد البيابات 
تطبيقات الموبايل
مصصم العاب كمبيوتر 
              الدعم الطبي
''',style:TextStyle(fontSize:16 , )),
                          ):appState.selectedCategory==0? Container(
                            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 7),
                            child: Text('''نبذة عن هندسة الحاسوب:
                            
 النشأة:
 
بدأ قسم هندسة الحاسوب وجوده في الجامعة الإسلامية كجزء من قسم الكهرباء والحاسوب الذي تأسس عام 1995، واستمر تطور القسم أكاديمياً وإدارياً إلى أن تم فصله تماماً عن قسم الكهرباء عام 2008. ومن ذلك الوقت والقسم يساهم في تطوير المجتمع المحلي وبناء مستقبل أفضل باعتباره من أهم مصادر العلم الهندسي في المجتمع الفلسطيني.

رؤيتنا:

أن يحتل القسم مركز الريادة في مجالات الحاسوب والتكنولوجيا ويحافظ على مستوى متميز من المهنية والإبداع.


''',style:TextStyle(fontSize:16 , )),
                          ): Container()
                        ],
                      ),
                    ),
                    Container(
                        color:Colors.white,
                        child: SingleChildScrollView(
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
                        ),)
                  ],
                );}
          ),   ),
          ),
          ),





        ]))
  ],
) ;}

      // By default, show a loading spinner.
      return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [



      Loading(),
      // Center(
      //   child: PixLoader(
      //       loaderType: LoaderType.Spinner, faceColor: Color(0xfff99b1d)),
      // )
      //CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xfff99b1d) ),)
      ],
      );}),
    );
  }
}
