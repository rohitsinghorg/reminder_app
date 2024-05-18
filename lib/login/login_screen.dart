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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Image.asset("assets/images/team.png"),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                "Planner, Reminder, Calendar",
                style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "You can check and handle your projects schedules in a more convenient way",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              PrimaryButton(
                title: "Let's Go",
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Home2Screen())),
                horizontalPadding: 9.5.w,
                verticalPadding: 2.25.h,
                borderRadius: 3.5.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
