import 'package:flutter/material.dart';
import 'package:getxprofirst/api/api_repository.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatelessWidget {
  ImagePickerScreen({super.key});
  Map<String,dynamic>? imageDatas;

  Future<void> getImageFromPc() async{
    final ImagePicker picker = ImagePicker();
    XFile? pickImage = await picker.pickImage(source: ImageSource.gallery);
    if(pickImage != null){
      imageDatas = {
        "path" : pickImage.path.isEmpty ? "no path" : pickImage.path,
        "name" : pickImage.name,
        "mimeType" : pickImage.mimeType,
        "byte" : pickImage.readAsBytes(),
        "length" : pickImage.length()
      };
      
      // print("image $imageDatas");

      final ts = await ApiRepository.myPostApi(imageDatas);

      final success = ts["success"];
      final Map<String,dynamic> datas = ts["data"];


      print("ts $datas");
      // datas.runtimeType is Map<String, dynamic>
      return;
    }

    print("no datas");


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImagePickerScreen"),
      ),
      body: Column(
        children: [
          Container(
            child: Text("hellos"),
          ),
          ElevatedButton(onPressed: getImageFromPc, child: Text('click')),
          ElevatedButton(onPressed: (){}, child: Text('click'))
        ],
      ),
    );
  }
}