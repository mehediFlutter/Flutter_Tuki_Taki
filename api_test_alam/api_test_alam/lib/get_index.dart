import 'package:api_test_alam/service/auth_utility.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GetIndex extends StatefulWidget {
  const GetIndex({super.key});

  @override
  State<GetIndex> createState() => _GetIndexState();
}

class _GetIndexState extends State<GetIndex> {
  Future<void> getIndex() async {
    Response response =
        await get(Uri.parse("https://rm.guideasy.com/api/tasks"), headers: {
      'Content-Type': 'application/vnd.api+json',
      'Accept': 'application/vnd.api+json',
      'token':AuthUtility.userInfo.toString()
     
      
    });
    print("Status Code is ");
    print(response.statusCode);

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                getIndex();
              },
              child: Text("Get Index Details"))
        ],
      ),
    );
  }
}
