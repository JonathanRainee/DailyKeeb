import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData lightTheme = ThemeData(primarySwatch: Colors.grey, brightness: Brightness.light);
  ThemeData darkTheme = ThemeData(primarySwatch: Colors.brown, brightness: Brightness.light);

  static late ThemeData _currTheme;

  ThemeProvider({required bool isDarkTheme}){
    _currTheme = isDarkTheme ? darkTheme : lightTheme;
  }

  void changeTheme(){
    _currTheme = _currTheme == darkTheme ? lightTheme : darkTheme;
    notifyListeners();
  }

  static ThemeData getTheme(){
    return _currTheme;
  }

  // ThemeData get getTheme => _currTheme;

}