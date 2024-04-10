// ignore_for_file: file_names

import 'package:flutter/material.dart';

class keyboardutil {
  static void hidekeyboard(BuildContext context){
    FocusScopeNode currentfocus=FocusScope.of(context);

    if(!currentfocus.hasPrimaryFocus){
      currentfocus.unfocus();
    }
  }
}