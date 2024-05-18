import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reminder_app/home/home2_screen.dart';
import 'package:reminder_app/widgets/primary_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SizedBox(
        height: 75.sh,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/note-1.jpg",
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerRight,
              height: 75.sh,
              color: Theme.of(context).colorScheme.primary,
              colorBlendMode: BlendMode.multiply,
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ring Bell",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24.sp,
                    ),
                  ),
                  Text(
                    "Let us keep you progressive, punctuate & profound",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: 100.sh,
        height: 35.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(4.5.w),
          ),
        ),
        padding: EdgeInsets.only(top: 2.5.h, left: 5.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign in by using",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Center(
              child: PrimaryButton(
                title: "Login with Google",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home2Screen(),
                  ),
                ),
                iconPath: "assets/images/google-icon.png",
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Center(
              child: PrimaryButton(
                title: "Login with Facebook",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home2Screen(),
                  ),
                ),
                iconPath: "assets/images/facebook-icon.png",
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Center(
              child: PrimaryButton(
                  title: "Login with LinkedIn",
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home2Screen(),
                        ),
                      ),
                  iconPath: "assets/images/linked-in-icon.png"),
            ),
          ],
        ),
      ),
    );
  }
}
