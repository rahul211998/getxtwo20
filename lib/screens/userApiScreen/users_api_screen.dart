import 'package:flutter/material.dart';
import 'package:getxprofirst/api/api_repository.dart';
import 'package:getxprofirst/modelClass/user_model.dart';

class UsersApiScreen extends StatefulWidget {
  const UsersApiScreen({super.key});

  @override
  State<UsersApiScreen> createState() => _UsersApiScreenState();
}

class _UsersApiScreenState extends State<UsersApiScreen> {
  List<UserModel> userUi = [];

  Future<List<UserModel>> userApiGetUsers() async{
    final users = await ApiRepository().myGetApi('/users');
    if(users['success'] == true){
      print("users ${users['data'].runtimeType}");
      setState(() {
        userUi = 
        (users['data'] as List).map<UserModel>((e) {
          print('ts ${e.runtimeType}');
          return UserModel.fromJson(e as Map<String,dynamic>);
        } ).toList();
        
      });
      
    }
    // print("users $userUi");
    return userUi;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userApiGetUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("userApiScreen"),),
      body: Container(
        child: ListView.builder(
          itemCount: userUi.length,
          itemBuilder: (context, index) {
          final allUsers = userUi[index];
          return ListTile(title: Text(allUsers.email),);
        },),
      ),
    );
  }
}