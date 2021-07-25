
import 'package:computerengineering/Widget/loading.dart';
import 'package:computerengineering/api/NetworkRequest.dart';
import 'package:computerengineering/compount/Post.dart';
import 'package:computerengineering/compount/addIcon.dart';
import 'package:flutter/material.dart';

class Sectionactivityscreen extends StatefulWidget {
  String SectionName;

  Sectionactivityscreen(this.SectionName);

  @override
  _SectionactivityscreenState createState() => _SectionactivityscreenState(SectionName);
}

class _SectionactivityscreenState extends State<Sectionactivityscreen> {
  String SectionName;
  _SectionactivityscreenState(this.SectionName);
  NetworkRequest networkRequest=new NetworkRequest();
  String typePost;



  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(SectionName=="النادي الهندسي"){
      typePost="EngineeringClub";
    }else if(SectionName=="مجلس الطلبة"){
      typePost="Student Council";
    }else if(SectionName=="IEEE"){
      typePost="IEEE";
    }else{
      typePost="Student";
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(SectionName),
          backgroundColor:  Color(0xff018476),//105370//14418a
          centerTitle: true,
          elevation: 6,
          actions: <Widget>[
            // IconButton(
            // //  icon: Icon(Icons.search,color: Colors.white,),
            // ),

          ],
        ),
      body: FutureBuilder<dynamic>(
    future: networkRequest.getPost() ,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    return  Container(
      child: ListView(
        children: [
          AddIcon("",SectionName),
          ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                double scale = 1.0;
                return snapshot.data[index]['posttype']=="$typePost"? Post(snapshot.data[index],SectionName):Container();
              })
        ],
      ),
    )

      ;}

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
      );}),);
  }


}
