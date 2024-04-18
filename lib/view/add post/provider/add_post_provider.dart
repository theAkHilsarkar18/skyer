import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddPostProvider extends ChangeNotifier {
  File? fileImage;
  void storeImage(File image) {
    fileImage = image;
    notifyListeners();
  }

  Future<void> setImageFromGallery() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? img = await imagePicker.pickImage(source: ImageSource.gallery);
    fileImage = File(img!.path);
    notifyListeners();
  }
}
