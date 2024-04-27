import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier
{
  bool isCheckForRemember = false;
  String email = "";
  String password = "";

  void checkRememberBox(bool status)
  {
    isCheckForRemember = status;
    notifyListeners();
  }

  Future<void> setDataInSharedPreference({required String email, required String password})
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email);
    preferences.setString('password', password);
  }
  Future<void> getDataInSharedPreference()
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email') ?? "";
    password = preferences.getString('password') ?? "";
  }



}
