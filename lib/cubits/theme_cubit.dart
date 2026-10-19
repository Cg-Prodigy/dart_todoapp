import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:todoapp/themes/darktheme.dart';
import 'package:todoapp/themes/lighttheme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(PlatformDispatcher.instance.platformBrightness == Brightness.dark?corporateDarkTheme:corporateLightTheme);
  bool get islight => state.brightness == Brightness.light;
  
  void toggleTheme() {
    emit(islight ? corporateDarkTheme : corporateLightTheme);
  }

}
