import 'dart:io';

import 'package:computerengineering/services/helperFunctions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';import 'dart:convert' as convert;
class NetworkRequest {
  static final NetworkRequest _instance = NetworkRequest._internal();
  String token;

  factory NetworkRequest() => _instance;

  NetworkRequest._internal();
  Future<dynamic> login(idIug,password) async {
   // print("tokenUser :"+tokenUser);
    Map _result;
    bool status = false;
    // print("login params" + phone + " " + password);
    // if(phone=="966594103577"){
    //   print("kkkk");
    //   phone="+966594103577";
    // }
    try {
      final response = await http.post(
       'http://iug0project.herokuapp.com/api/user/login',
//c3r49PAjQXO2yPdu_Vzft-:APA91bGoA5opX6tjndKWE-XQ7EIJdLVvHoFhlMVPIw-1kv4rBs-OFNkMJxxUttUPkm7ToVjY-cxNLklQUIEjIe-8pOTFZrrzg6JIgS-U_QfbrlmvUI51WYMqzJ__r0FLq40MsRHgyYLi
        body: {
          "idIug": idIug,//"220160842",
          "password":password,// "123456"
        },
      );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        HelperFunctions.saveUserLoggedInSharedPreference(true);
        return "ok";
        // try {
        //   _result = jsonDecode(response.body);
        //   status = _result['status'];
        //   print(status);
        //   if (status ==true) {
        //     // HelperFunctions.saveUserEmailSharedPreference(_result['items']['api_token']);
        //     // HelperFunctions.saveUserMobileSharedPreference(_result['items']['mobile']);
        //     // HelperFunctions.saveUserAddressSharedPreference(_result['items']['address']);
        //     // HelperFunctions.saveUserPassWordSharedPreference(password);
        //     // HelperFunctions.saveUserAdminSharedPreference(false);
        //     // User user = User();
        //     // user.id = _result['items']['id'];
        //     // user.name = _result['items']['full_name'];
        //     // user.email = _result['items']['email'];
        //     // user.password = _result['items']['password'];
        //     // user.phone = _result['items']['mobile'];
        //     // HelperFunctions.saveUserNameSharedPreference(_result['items']['full_name']);
        //     return "ok";
        //   }else {
        //     // print("NO NO");
        //     if(_result['message']=="الحساب الخاص بك غير مفعل .. يرجى الانتظار لحين تفعيل حسابك"){
        //       return _result['message'];
        //     }else{
        //     //  return Resturantlogin(phone,password,tokenUser);
        //     }
        //
        //
        //   }
        // } catch (error) {
        //   print("login error api" + error.toString());
        //   return "خطأ في التسجيل";
        //   throw Exception("login error api");
        // }
      }else{
        return "NotOk";
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> MohaseRegister() async {//String phone, String password,String tokenUser
    Map _result;
    bool status = false;
  //  print("login params" + email + " " + password+name+city);
    try {
      final response = await http.post(
       'http://iug0project.herokuapp.com/api/user/signup',
        body: {
          "name": "reham rehamreham",
          "email": "rehamreham2222@gmail.com",
          "idIug": "220161841",
          "department": "Engineering",
          "specialization": "Computer engineering",
          "password": "123456789"
        } );
      print('login result response: ' + response.body+ 'response.statusCode  '+ "${response.statusCode}" );

      if (response.statusCode == 200) {
        try {
          _result = jsonDecode(response.body);
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          return "ok";

        } catch (error) {
          print("login error api" + error.toString());
          return "خطأ في التسجيل";
          throw Exception("login error api");
        }
      }
    } catch (error) {
      print('ERROR: ' + error.toString());
      return "خطأ في التسجيل";
      // throw CustomException(error.toString());
      rethrow;
    }

  }
  Future<dynamic> getAdvertising() async {
    // await HelperFunctions.getUserEmailSharedPreference().then((value){
    //   token  = value ;
    // });
    dynamic _result;

    print('get token response: ');
      var res = await http
          .get(Uri.encodeFull('http://iug0project.herokuapp.com/api/admin/Advertising'), headers: {"Accept": "application/json","Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYiLCJpYXQiOjE2MjIyNzY1NTN9.xL9460nYG2knGFsestwvTY_XS05B--_pPFOF5LgjygU"});
      var resBody = json.decode(res.body);
      // final response = await http.get(
      //    'http://iug0project.herokuapp.com/api/admin/Advertising',
      //     headers: {
      //       'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYiLCJpYXQiOjE2MjIyNzY1NTN9.xL9460nYG2knGFsestwvTY_XS05B--_pPFOF5LgjygU',
      //     }
      // );
       print('get profile response: ${res.statusCode}' + res.body);
      print(2);
      if (res.statusCode == 200) {
        print(1);
       // _result = jsonDecode(res.body);
        return resBody["advertising"];}


  }
  Future<dynamic> addAdvertising() async {
    // await HelperFunctions.getUserEmailSharedPreference().then((value){
    //   token  = value ;
    // });
    dynamic _result;

    print('get token response: ');
    var res = await http
        .post(Uri.encodeFull('http://iug0project.herokuapp.com/api/admin/addAdvertising'), headers: {"Accept": "application/json","Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYiLCJpYXQiOjE2MjIyNzY1NTN9.xL9460nYG2knGFsestwvTY_XS05B--_pPFOF5LgjygU"});
    var resBody = json.decode(res.body);
    // final response = await http.get(
    //    'http://iug0project.herokuapp.com/api/admin/Advertising',
    //     headers: {
    //       'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYiLCJpYXQiOjE2MjIyNzY1NTN9.xL9460nYG2knGFsestwvTY_XS05B--_pPFOF5LgjygU',
    //     }
    // );
    print('get profile response: ${res.statusCode}' + res.body);
    print(2);
    if (res.statusCode == 200) {
      print(1);
      // _result = jsonDecode(res.body);
      return resBody["advertising"];}


  }



  Future<dynamic> getPost() async {
    // await HelperFunctions.getUserEmailSharedPreference().then((value){
    //   token  = value ;
    // });
    dynamic _result;

    print('get token response: ');




    var res = await http
        .get(Uri.encodeFull('http://iug0project.herokuapp.com/api/post/posts'));
    var resBody = json.decode(res.body);
    // final response = await http.get(
    //    'http://iug0project.herokuapp.com/api/admin/Advertising',
    //     headers: {
    //       'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYiLCJpYXQiOjE2MjIyNzY1NTN9.xL9460nYG2knGFsestwvTY_XS05B--_pPFOF5LgjygU',
    //     }
    // );
    print('get profile response: ${res.statusCode}' + res.body);
    print(2);
    if (res.statusCode == 200) {
      print(1);
      // _result = jsonDecode(res.body);
      return resBody["posts"];}


  }


}