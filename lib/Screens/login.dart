//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:computerengineering/AuthService/AuthService.dart';
import 'package:computerengineering/AuthService/database.dart';

import 'package:computerengineering/Screens/Home.dart';
import 'package:computerengineering/api/NetworkRequest.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:computerengineering/compount/alert.dart';
import 'package:computerengineering/compount/validinput.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LogIn extends StatefulWidget {
  LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}



class _LogInState extends State<LogIn> {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  // Start Form Controller

 var mytoken ; 
// final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


  NetworkRequest networkRequest= new NetworkRequest();
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  GlobalKey<FormState> formstatesignin = new GlobalKey<FormState>();
  GlobalKey<FormState> formstatesignup = new GlobalKey<FormState>();

  savePref(String username, String email , String id ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("id", id);
    preferences.setString("username", username);
    preferences.setString("email", email);
    print(preferences.getString("username"));
    print(preferences.getString("email"));
    print(preferences.getString("id"));
  }
  bool _obscureText=true;


  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  signin() async {
    var formdata = formstatesignin.currentState;
    if (formdata.validate()) {
      formdata.save();
      //showLoading(context);
      await getLoggedSignInState();
      if(resultLogin=="ok"){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }else{
        Fluttertoast.showToast(
            msg: " خطا في اسم المستخدم أو كلمة المرور",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff018476).withOpacity(0.9),
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      // await authService
      //     .signInWithEmailAndPassword(
      //     email.text, password.text)
      //     .then((result) async {
      //   if (result != null)  {
      //     // QuerySnapshot userInfoSnapshot =
      //     // await DatabaseMethods().getUserInfo(email.text);
      //
      //     // HelperFunctions.saveUserLoggedInSharedPreference(true);
      //     // HelperFunctions.saveUserNameSharedPreference(
      //     //     userInfoSnapshot.documents[0].data["userName"]);
      //     // HelperFunctions.saveUserEmailSharedPreference(
      //     //     userInfoSnapshot.documents[0].data["userEmail"]);
      //
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => Home()));
      //   } else {
      //     setState(() {
      //     //  isLoading = false;
      //       //show snackbar
      //     });
      //   }
      // });

      // var data = {"email": email.text, "password": password.text  , "token" : mytoken };
      // var url = "http://10.0.2.2:8080/mobtech/login.php";
      // var response = await http.post(url, body: data);
      // var responsebody = jsonDecode(response.body);
      // print(responsebody) ;
      if ( "success"  == "success") {
        //savePref(responsebody['username'], responsebody['email'] , responsebody['id']);
       // Navigator.push(context, new MaterialPageRoute(builder: (context)=>  Home()));

       // Navigator.of(context).push();
      } else {
        print("login faild");
        Navigator.of(context).pop() ; 
        showDialogAll(context, "خطأ", "البريد الالكتروني او كلمة المرور خاطئة");
      }
    } else {
      print("not valid");
    }
  }
  // AuthService authService = new AuthService();
  // DatabaseMethods databaseMethods = new DatabaseMethods();
  signup() async {

    var formdata = formstatesignup.currentState;
    if (formdata.validate()) {
      formdata.save();
      await getLoggedInState();
      if (resultregister=="ok"){
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Home()
        ));
      }
      // await authService.signUpWithEmailAndPassword(email.text,
      //     password.text).then((result){
      //   if(result != null){
      //
      //     Map<String,String> userDataMap = {
      //       "userName" : email.text,
      //       "userEmail" : password.text
      //     };
      //
      //  //   databaseMethods.addUserInfo(userDataMap);
      //
      //     // HelperFunctions.saveUserLoggedInSharedPreference(true);
      //     // HelperFunctions.saveUserNameSharedPreference(usernameEditingController.text);
      //     // HelperFunctions.saveUserEmailSharedPreference(emailEditingController.text);
      //
      //
      //   }
      // });
      var result;
      // showLoading(context);
     // var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);

      if(result != null)
      {

        // var userInfo = Firestore.instance.collection('users').document().setData({
        //   'email':email.text
        // });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }else{
        print('please try later');
      }


    } else {
      print("not valid");
    }
  }

  TapGestureRecognizer _changesign;
  bool showsignin = true;
  @override
  void initState() {
    _changesign = new TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showsignin = !showsignin;
          print(showsignin);
        });
      };
      
    //    _firebaseMessaging.getToken().then((String token) {
    //   assert(token != null);
    //   setState(() {
    //     mytoken = token ;
    //   });
    //   print(mytoken);
    // });
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(height: double.infinity, width: double.infinity),
            buildPositionedtop(mdw),
           // buildPositionedBottom(mdw),
            Container(
                height: 1000,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 35),
                              child: Text(
                                showsignin ? "تسجيل الدخول " : "انشاء حساب",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: showsignin ? 22 : 25),
                              ))),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      buildContaineraAvatar(mdw),
                      showsignin
                          ? buildFormBoxSignIn(mdw)
                          : buildFormBoxSignUp(mdw),
                      Container(
                          margin: EdgeInsets.only(top: 14),
                          child: Column(
                            children: <Widget>[
                              showsignin
                                  ? InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "   هل نسيت كلمة المرور ؟",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                      ))
                                  : SizedBox(),
                              SizedBox(height: showsignin ? 35 : 5),
                              RaisedButton(


                                color:
                                    showsignin ? Color(0xFF018476): Colors.grey[500],
                                elevation: 10,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 40),
                                onPressed: showsignin ? signin : signup,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      showsignin
                                          ? "تسجيل الدخول"
                                          : "انشاء حساب",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 4),
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Cairo'),
                                        children: <TextSpan>[
                                          // TextSpan(
                                          //     text: showsignin
                                          //         ? "في حال ليس لديك حساب يمكنك "
                                          //         : "اذا كان لديك حساب يمكنك"),
                                          TextSpan(
                                              recognizer: _changesign,
                                              text: showsignin
                                                  ? " انشاء حساب من هنا  "
                                                  : " تسجيل الدخول من هنا  ",
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontWeight: FontWeight.w700))
                                        ]),
                                  )),
                              SizedBox(
                                height: 10,
                              ),

                              showsignin ?
                              Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                      ),
                                    ],
                                  ))
                          :
                          Text("")

                            ],
                          )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Center buildFormBoxSignIn(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeOutBack,
        margin: EdgeInsets.only(top: 40),
        height: 250,
        width: mdw / 1.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.00),
            color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1, 1))
        ]),
        child: Form(
            autovalidate: false,
            key: formstatesignin,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Start Text Username
                    Text(
                      "اسم المستخدم",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll(
                        "اسم المستخدم", false, email, "email",(val){setState(() {LoginIdUser=val;});}),
                    // End Text username
                    SizedBox(
                      height: 10,
                    ),
                    // Start Text password
                    Text("كلمة المرور",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll(
                        "كلمة المرور", true, password, "password",(val){setState(() {LoginPass=val;});}),
                    // End Text username
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Center buildFormBoxSignUp(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        margin: EdgeInsets.only(top: 20),
        height: 403,
        width: mdw / 1.2,
        decoration: BoxDecoration(  borderRadius: BorderRadius.circular(10.00),color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.7),
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1, 1))
        ]),
        child: Form(
            key: formstatesignup,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Start Text Username
                    Text(
                      "اسم المستخدم",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll(
                        "ادخل اسم المستخدم", false, username, "username",(val){setState(() {RegIdUser=val;});}),
                    SizedBox(
                      height: 10,
                    ),
                    Text("البريد الالكتروني",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll("example@yoursite.com", false,
                        email, "email",(val){setState(() {RegemailUser=val;});}),
                    // End Text username
                    SizedBox(
                      height: 10,
                    ),
                    // Start Text password
                    Text("كلمة المرور",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll(
                       "******************", true, password, "password",(val){setState(() {RegPass=val;});}),
                    // Start Text password CONFIRM
                    Text(" تاكيد كلمة المرور ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll("******************",true,
                        confirmpassword, "confirmpassword",(val){setState(() {
                          RegConPass=val;
                        });}),
                    SizedBox(
                      height: 10,
                    ),
                    Text("القسم",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll("ادخل اسم القسم", false,
                        email, "email",(val){setState(() {specialization=val;});}),
                    SizedBox(
                      height: 10,
                    ),
                    Text("التخصص",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll("ادخل اسم التخصص", false,
                        email, "email",(val){setState(() {
                          specialization=val;
                        });}),
                    // Start Text EMAIL

                    // End Text username
                  ],
                ),
              ),
            )),
      ),
    );
  }
  var LoginIdUser;
  var LoginPass;
  var RegemailUser;
  var RegIdUser;
  var RegPass;
  var RegConPass;
  var specialization;
  var department;

  TextFormField buildTextFormFieldAll(String myhinttext, bool pass,
      TextEditingController myController, type,onchanged) {

    return TextFormField(
      controller: myController,
      obscureText: pass,
      onChanged: onchanged,
      validator: (val) {
          if (type ==  "username") {
              return validInput(val, 10, 3, "يكون اسم المستخدم")   ;
          } if (type == "email") {
              return validInput(val, 30, 4, "يكون البريد  الالكتروني")   ; 
          }if (type == "password") {
              return validInput(val, 40, 3, "تكون كلمة  المرور")   ; 
          }
      },

      decoration: InputDecoration(
        suffixIcon:pass?InkWell(
            onTap: (){
              setState(() {
                _obscureText=!_obscureText;
              });
            },
            child:_obscureText? const Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child:const Icon(Icons.lock_outline,color: Colors.black45,) ,
            ):const Icon(Icons.lock_open,color: Colors.black45)):Container(height: 0,width: 0,),

          labelStyle: new TextStyle(
            color: Colors.grey[200],
          ),
          contentPadding: EdgeInsets.all(4),
          hintText: myhinttext,
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[300], style: BorderStyle.solid, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xFF018476), style: BorderStyle.solid, width: 1))),
    );
  }

  AnimatedContainer buildContaineraAvatar(double mdw) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          gradient:showsignin ?  LinearGradient(
              colors: [Color(0xff04B0A0),  Color(0xff018476)],
              tileMode: TileMode.clamp,
              begin: Alignment.topRight,
              stops: [0.0, 1.0],
              end: Alignment.bottomCenter):LinearGradient(
              colors: [Colors.grey[500],  Colors.grey[500]],
              tileMode: TileMode.clamp,
              begin: Alignment.centerRight,
              stops: [0.0, 1.0],
              end: Alignment.bottomCenter),
         // color: showsignin ? Color(0xFF018476) : Colors.grey[700],
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 3, spreadRadius: 0.1)
          ]),
      child: InkWell(
        onTap: () {
          setState(() {
            showsignin = !showsignin;
          });
        },
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 25,
                right: 25,
                child:
                    Icon(Icons.person_outline, size: 50, color: Colors.white)),
           // Positioned(
             //   top: 35,
             //   left: 60,
               // child: Icon(Icons.arrow_back, size: 30, color: Colors.white)
           // )
          ],
        ),
      ),
    );
  }

  Positioned buildPositionedtop(double mdw) {
    return Positioned(
        child: Transform.scale(
      scale: 1.3,
      child: Transform.translate(
        offset: Offset(0, -mdw / 1.7),
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
                gradient:showsignin ?  LinearGradient(
                    colors: [Colors.grey[500],  Colors.grey[500]],
                    tileMode: TileMode.clamp,
                    begin: Alignment.topRight,
                    stops: [0.0, 1.0],
                    end: Alignment.bottomCenter):LinearGradient(
                    colors: [Color(0xff04B0A0),  Color(0xff018476)],
                    tileMode: TileMode.clamp,
                    begin: Alignment.centerRight,
                    stops: [0.0, 1.0],
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(mdw),
              //  color: showsignin ? Colors.grey[800] : Color(0xFF14688C)
            )),
      ),
    ));
  }

  Positioned buildPositionedBottom(double mdw) {
    return Positioned(
        top: 300,
        right: mdw / 1.5,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mdw),
                color: showsignin
                    ? Colors.blue[800].withOpacity(0.2)
                    : Colors.grey[800].withOpacity(0.3))));
  }
var resultLogin;
  var resultregister;
  getLoggedInState() async {
    await networkRequest.MohaseRegister().then((value){
      setState(() {
        resultregister  = value;
      });
    });
  }
  getLoggedSignInState() async {
    await networkRequest.login(LoginIdUser,LoginPass).then((value){
      setState(() {
        resultLogin  = value;
      });
    });
  }


}