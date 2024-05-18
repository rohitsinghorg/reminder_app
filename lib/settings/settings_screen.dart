import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 10.h,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Customise your input",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: true,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
      ),
      bottomSheet: DraggableScrollableSheet(
          initialChildSize: 1.0,
          maxChildSize: 1.0,
          minChildSize: 1.0,
          builder: (context, controller) {
        return SingleChildScrollView(
          controller: controller,
          child: Container(
            padding: EdgeInsets.only(
              left: 4.5.w,
              right: 4.5.w,
              top: 2.5.h,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(7.5.w),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose a custom settings",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                CheckboxListTile(
                    title: Text(
                      "Vibration",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "This selection requires the permission of your device.",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    value: false,
                    onChanged: (value) {}),
                SizedBox(
                  height: 1.5.h,
                ),
                CheckboxListTile(
                    title: Text(
                      "Custom Tone",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "This selection requires the permission of your device.",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    value: false,
                    onChanged: (value) {}),
                SizedBox(
                  height: 1.5.h,
                ),
                CheckboxListTile(
                    title: Text(
                      "Snooze",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "If you miss the notification, then after how many times we should remind you again.",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    value: true,
                    onChanged: (value) {}),
                SizedBox(
                  height: 1.5.h,
                ),
                CheckboxListTile(
                    title: Text(
                      "Pre-Alert",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "This is a pre-alert notification that you would like to see.",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    value: false,
                    onChanged: (value) {}),
                SizedBox(
                  height: 1.5.h,
                ),
                CheckboxListTile(
                    title: Text(
                      "Flashlight",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "This selection may requires the permission of your device.",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    value: true,
                    onChanged: (value) {}),
                SizedBox(
                  height: 1.5.h,
                ),
                CheckboxListTile(
                    title: Text(
                      "Home Screen Widget",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "This selection requires the permission of your device.",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    value: false,
                    onChanged: (value) {}),
                SizedBox(
                  height: 1.5.h,
                ),
                ListTile(
                  title: Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: (){

                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
