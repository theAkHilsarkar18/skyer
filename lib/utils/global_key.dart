import 'package:flutter/cupertino.dart';
import 'package:skyer/utils/globals.dart';

class GlobalKeysClass
{
  List<GlobalKey> globalKeyListForPostViewImage = Globals.postImageUrlList.map((e) => GlobalKey()).toList();
}
