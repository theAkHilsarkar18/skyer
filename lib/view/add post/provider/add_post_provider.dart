import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddPostProvider extends ChangeNotifier
{
  File? fileImage;
  Future<void> setImageFromGallery()
  async {
    ImagePicker imagePicker = ImagePicker();
    XFile? img = await imagePicker.pickImage(source: ImageSource.gallery);
    fileImage = File(img!.path);
    notifyListeners();
  }
}