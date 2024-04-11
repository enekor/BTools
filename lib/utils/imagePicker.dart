import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class imagePicker{

  static Future<String> pickImage() async{
    if(kIsWeb) return "";
    
    final ImagePicker _picker = ImagePicker();
      final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
      if(_image != null){
        final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
        final File file = File(appDocumentsDir.path+"/images/"+_image.name);
        file.writeAsBytes(await _image.readAsBytes());

        return file.path;
      }
      else{
        return "";
      }
  }
}