import 'package:api_test_alam/service/auth_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginInfo extends StatelessWidget {
  const LoginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AuthUtility.userInfo.payload!.user!.id.toString()),
            Text(AuthUtility.userInfo.payload!.user!.name.toString()),
            Text(AuthUtility.userInfo.payload!.token.toString()),
            Text(AuthUtility.userInfo.payload!.user!.email.toString()),
            
            
            Text(AuthUtility.userInfo.payload!.user!.createdAt.toString()),
          ],
        ),
      ),
    );
  }
}