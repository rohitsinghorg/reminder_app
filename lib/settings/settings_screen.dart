import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool vibration = false;
  bool customTone = false;
  bool snooze = true;
  bool preAlert = false;
  bool flashlight = true;
  bool homeScreenWidget = false;

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
              children: const [
                Text(
                  "Customise your input",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 21,
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
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCheckboxListTile(
                    title: "Vibration",
                    subtitle:
                    "This selection requires the permission of your device.",
                    value: vibration,
                    onChanged: (value) {
                      setState(() {
                        vibration = value!;
                      });
                    },
                  ),
                  _buildCheckboxListTile(
                    title: "Custom Tone",
                    subtitle:
                    "This selection requires the permission of your device.",
                    value: customTone,
                    onChanged: (value) {
                      setState(() {
                        customTone = value!;
                      });
                    },
                  ),
                  _buildCheckboxListTile(
                    title: "Snooze",
                    subtitle:
                    "If you miss the notification, then after how many times we should remind you again.",
                    value: snooze,
                    onChanged: (value) {
                      setState(() {
                        snooze = value!;
                      });
                    },
                  ),
                  _buildCheckboxListTile(
                    title: "Pre-Alert",
                    subtitle:
                    "This is a pre-alert notification that you would like to see.",
                    value: preAlert,
                    onChanged: (value) {
                      setState(() {
                        preAlert = value!;
                      });
                    },
                  ),
                  _buildCheckboxListTile(
                    title: "Flashlight",
                    subtitle:
                    "This selection may requires the permission of your device.",
                    value: flashlight,
                    onChanged: (value) {
                      setState(() {
                        flashlight = value!;
                      });
                    },
                  ),
                  _buildCheckboxListTile(
                    title: "Home Screen Widget",
                    subtitle:
                    "This selection requires the permission of your device.",
                    value: homeScreenWidget,
                    onChanged: (value) {
                      setState(() {
                        homeScreenWidget = value!;
                      });
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCheckboxListTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool?)? onChanged,
  }) {
    return Column(
      children: [
        CheckboxListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 13),
          ),
          value: value,
          onChanged: onChanged,
        ),
        SizedBox(
          height: 1.5.h,
        ),
      ],
    );
  }
}
