import 'dart:async';

import 'package:computerengineering/Screens/Home.dart';
import 'package:computerengineering/Screens/mainOnborading.dart';
import 'package:computerengineering/services/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:shimmer/shimmer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(

    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar'],
    assetsDirectory: 'assets/langs/',
    apiKeyGoogle: '<Key>', // NOT YET TESTED
  );
  runApp(LocalizedApp(child:MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Computer Engineering',
      theme: ThemeData(
        fontFamily: 'JF Flat',
        primaryColor: Color(0xff018476),
        primarySwatch: Colors.blue,
      ),
    //  primaryColor: Color(0xff018476),
      localizationsDelegates: translator.delegates,
      locale: translator.locale,
      supportedLocales: translator.locals(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool userIsLoggedIn;



  // getLoggedInState() async {
  //   await HelperFunctions.getUserLoggedInSharedPreference().then((value){
  //     setState(() {
  //       userIsLoggedIn  = value;
  //     });
  //   });
  // }

  void initState(){
    userIsLoggedIn=false;
    getLoggedInState();

    super.initState();
    start();
  }
  //bool userIsLoggedIn;
  //bool userIsAminIn;
  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }
  start()async{

    return Timer(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_){
            return userIsLoggedIn != null ?  userIsLoggedIn ? Home() : My_App(): My_App();//
          })
      );
    }) ;
  }
  bool _enabled = true;
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return  Scaffold(
      body:   Shimmer.fromColors(
        baseColor: Color(0xff018476),
        highlightColor: Colors.grey[100],
        enabled: _enabled,
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/splash.png"), fit: BoxFit.fill)
            ),
            child:Center(
              child:Container(
                decoration: BoxDecoration(
                    // boxShadow: [BoxShadow(
                    //     color: Color.fromRGBO(34, 134, 234, .3),
                    //     blurRadius: 10,
                    //     offset: Offset(0, 10)
                    // )]
                ),
                  child: Center(child: Image.asset("assets/emblemmatic-computer-engineering-logo-92.png",width: 250,))),// Text(translator.translate('appTitle')),//
            )),
      ),
    );


  }
}
