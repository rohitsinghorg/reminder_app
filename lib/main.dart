import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/add/add_note_provider.dart';
import 'package:reminder_app/helpers/themes.dart';
import 'package:reminder_app/home/home2_provider.dart';
import 'package:reminder_app/login/login_screen.dart';
import 'package:reminder_app/temp/temp_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'add/add_note_screen.dart';
import 'home/home2_screen.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Home2Provider()),
        ChangeNotifierProvider(create: (context) => AddNoteProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: "Poppins",
          bottomSheetTheme: BottomSheetThemeData(
            surfaceTintColor: Theme.of(context).colorScheme.background,
          ),
        ),
        // theme: //lightTheme,
        // darkTheme: darkTheme,
        home: LoginScreen(),
      );
    });
  }
}
