import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> notficationAllSettings() async {
    bool auth = false;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    switch (settings.authorizationStatus) {
      case AuthorizationStatus.authorized:
          print("user autherize");
          auth = true;
        break;
            case AuthorizationStatus.denied:
      print("❌ User denied permission");
      break;
    case AuthorizationStatus.notDetermined:
      print("⏳ Permission not determined");
      break;
    case AuthorizationStatus.provisional:
      print("⚡ Provisional permission granted");
      break;
  }

      if(auth){
      String? token = await FirebaseMessaging.instance.getToken();
      print("🔥 FCM Token: $token");

    }
      
    }



    
    
  

  void myFilePicker() async {
    print("file picker");
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      File file = File(result.files.first.path!);
      // print("file is $file");

      final fileBytes = result.files.first.bytes;
      final fileName = result.files.first.name;

      print("fileBytes $fileBytes fileName $fileName");
    }
  }

  // void myFilePicker() async {
  //   print("file picker");

  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.any,
  //     withData: true, // IMPORTANT for web
  //   );

  //   if (result != null) {
  //     final fileBytes = result.files.first.bytes;
  //     final fileName = result.files.first.name;

  //     print("File name: $fileName");
  //     print("File bytes length: ${fileBytes?.length}");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("filepicker screen"),
      ),
      body: Column(
        children: [
          Container(
            child: Text("hellos"),
          ),
          ElevatedButton(onPressed: () => myFilePicker(), child: Text("click"))
        ],
      ),
    );
  }
}
