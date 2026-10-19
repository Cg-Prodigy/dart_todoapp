import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubits/theme_cubit.dart';
import 'package:todoapp/pages/homepage.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final themecubit = ThemeCubit();
  @override
  void dispose() {
    themecubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      bloc: themecubit,
      builder: (context, theme) {
        return MaterialApp(
          home: Scaffold(
            // resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text("My TODO"),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                IconButton(
                  onPressed: () {
                    themecubit.toggleTheme();
                  },
                  icon: Icon(
                    themecubit.islight ? Icons.dark_mode : Icons.light_mode,
                  ),
                ),
              ],
            ),
            body: Homepage(),
          ),
          theme: themecubit.state,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
