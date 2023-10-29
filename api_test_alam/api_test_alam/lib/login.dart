import 'dart:convert';

import 'package:api_test_alam/get_index.dart';
import 'package:api_test_alam/login_info.dart';
import 'package:api_test_alam/model/login_model.dart';
import 'package:api_test_alam/registration.dart';
import 'package:api_test_alam/service/auth_utility.dart';
import 'package:api_test_alam/service/network_caller.dart';
import 'package:api_test_alam/service/network_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loginInProgress = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    _loginInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response = await NetworkCaller().postRequest(
        "https://rm.guideasy.com/api/login", <String, dynamic>{
      "email": _emailController.text.trim(),
      "password": _passwordController.text
    });
    _loginInProgress = false;
    if (mounted) {
      setState(() {});
    }
    print(response.body);
    print("Token is");
    print(AuthUtility.userInfo.payload!.token);
    print("Status is");
    print(AuthUtility.userInfo.status);
    print("Name is");
    print(AuthUtility.userInfo.payload?.user?.name);
    print("Email is");
    print(AuthUtility.userInfo.payload?.user?.email);
    if(response.statusCode==200){
      LoginModel model = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(model);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
    }
    else{ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'email'),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'password'),
              ),
              SizedBox(height: 20),
              Visibility(
                visible: _loginInProgress == false,
                replacement: Center(
                  child: CircularProgressIndicator(),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      login();
                      //LoginInfo();
                    },
                    child: Text("Login")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have Account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registration()));
                      },
                      child: Text("Registration")),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginInfo()));
                  },
                  child: Text("Get Index"))
            ],
          ),
        ),
      ),
    );
  }
}
