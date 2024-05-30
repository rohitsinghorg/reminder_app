import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/add/add_note_provider.dart';
import 'package:reminder_app/home/home2_provider.dart';
import 'package:reminder_app/login/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Home2Provider()),
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
        home: const LoginScreen(),
      );
    });
  }
}
