import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:reminder_app/widgets/primary_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  int _currentDay = 15,
      _currentMonth = 6,
      _currentHour = 6,
      _currentMinute = 30,
      _currentFormat = 0;
  int selectedIndex = 0;
  bool showWeeklyCalendar = true;
  late String _repeatInfo = "Your event will occur only once";
  TimeOfDay selectedTime = TimeOfDay.now();
  late Map<DateTime, List<String>> _selectedEvents = Map();

  @override
  void initState() {
    _currentDay = DateTime.now().day;
    _currentMonth = DateTime.now().month;
    _currentHour = int.parse(DateFormat("h").format(DateTime.now()));
    _currentMinute = int.parse(DateFormat("mm").format(DateTime.now()));
    _currentFormat = DateFormat("a").format(DateTime.now()) == "AM" ? 0 : 1;
    _selectedEvents.addAll({
      DateTime(2024, 4, 20): ["Event 1", "Event 2"],
      DateTime(2024, 4, 21): ["Event 1"],
      DateTime(2024, 4, 25): ["Event 1"],
    });
    super.initState();
  }

  // number picker styling starts here
  TextStyle unselectedStyle = TextStyle(color: Colors.grey, fontSize: 15.sp);

  TextStyle selectedStyle =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700);
  // ends

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Ready to add your note",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                Text(
                  "Add Note",
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
      resizeToAvoidBottomInset: true,
      bottomSheet: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        builder: (context, controller) {
          // log("Home2Screen: MinScrollExtent ${controller.position.minScrollExtent}, MaxScrollExtent ${controller.position.maxScrollExtent}");
          return SingleChildScrollView(
            controller: controller,
            child: Container(
              padding: EdgeInsets.only(
                left: 3.5.w,
                right: 3.5.w,
                top: 2.5.h,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(7.5.w)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date and Time",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Day",
                              style: unselectedStyle,
                            ),
                            NumberPicker(
                              value: _currentDay,
                              selectedTextStyle: selectedStyle.copyWith(
                                  color: Theme.of(context).primaryColor),
                              textStyle: unselectedStyle,
                              minValue: 1,
                              maxValue: 30,
                              onChanged: (value) =>
                                  setState(() => _currentDay = value),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Month",
                              style: unselectedStyle,
                            ),
                            NumberPicker(
                              value: _currentMonth,
                              selectedTextStyle: selectedStyle.copyWith(
                                  color: Theme.of(context).primaryColor),
                              textStyle: unselectedStyle,
                              minValue: 1,
                              maxValue: 12,
                              onChanged: (value) =>
                                  setState(() => _currentMonth = value),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Hour",
                              style: unselectedStyle,
                            ),
                            NumberPicker(
                              value: _currentHour,
                              selectedTextStyle: selectedStyle.copyWith(
                                  color: Theme.of(context).primaryColor),
                              textStyle: unselectedStyle,
                              minValue: 1,
                              maxValue: 12,
                              onChanged: (value) =>
                                  setState(() => _currentHour = value),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Minute",
                              style: unselectedStyle,
                            ),
                            NumberPicker(
                              value: _currentMinute,
                              selectedTextStyle: selectedStyle.copyWith(
                                  color: Theme.of(context).primaryColor),
                              textStyle: unselectedStyle,
                              minValue: 0,
                              maxValue: 100,
                              onChanged: (value) =>
                                  setState(() => _currentMinute = value),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            NumberPicker(
                              value: _currentFormat,
                              selectedTextStyle: selectedStyle.copyWith(
                                  color: Theme.of(context).primaryColor),
                              textStyle: unselectedStyle,
                              minValue: 0,
                              maxValue: 1,
                              textMapper: (value) {
                                if (value == "0") {
                                  return "AM";
                                } else if (value == "1") {
                                  return "PM";
                                }
                                return "-";
                              },
                              onChanged: (value) =>
                                  setState(() => _currentFormat = value),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black87,
                        ),
                      ),
                      labelText: "Enter Title",
                      labelStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                      isDense: true,
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black87,
                        ),
                      ),
                      labelText: "Enter Note",
                      labelStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                      isDense: true,
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Text(
                    "Repeat",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  Wrap(
                    children: [
                      ChoiceChip(
                        label: Text("Once"),
                        selected: 0 == selectedIndex,
                        onSelected: (value) {
                          setState(() {
                            selectedIndex = 0;
                            generateEvents(0);
                          });
                        },
                      ),
                      SizedBox(
                        width: 1.5.w,
                      ),
                      ChoiceChip(
                        label: Text("Daily"),
                        selected: 1 == selectedIndex,
                        onSelected: (value) {
                          setState(() {
                            selectedIndex = 1;
                            generateEvents(1);
                          });
                        },
                      ),
                      SizedBox(
                        width: 1.5.w,
                      ),
                      ChoiceChip(
                        label: Text(
                          "Weekly",
                        ),
                        selected: 2 == selectedIndex,
                        surfaceTintColor: Theme.of(context).colorScheme.primary,
                        onSelected: (value) {
                          setState(() {
                            selectedIndex = 2;
                            generateEvents(2);
                          });
                        },
                        // selectedColor: Theme.of(context).colorScheme.primary,
                        // checkmarkColor: Colors.white,
                      ),
                      SizedBox(
                        width: 1.5.w,
                      ),
                      ChoiceChip(
                        label: Text("Monthly"),
                        selected: 3 == selectedIndex,
                        onSelected: (value) {
                          setState(() {
                            selectedIndex = 3;
                            generateEvents(3);
                          });
                        },
                      ),
                      SizedBox(
                        width: 1.5.w,
                      ),
                      ChoiceChip(
                        label: const Text("Yearly"),
                        selected: 4 == selectedIndex,
                        onSelected: (value) {
                          setState(() {
                            selectedIndex = 4;
                            generateEvents(4);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    _repeatInfo,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  /*SizedBox(
              height: 1.5.h,
            ),
            TextFormField(
              readOnly: true,
              onTap: () {
                _selectTime(context);
              },
              controller:
                  TextEditingController(text: selectedTime.format(context)),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black26,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black87,
                  ),
                ),
                labelText: "Enter Time",
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                ),
                isDense: true,
                alignLabelWithHint: true,
              ),
            ),*/
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: PrimaryButton(title: "Save", onTap: () {})),
                  SizedBox(
                    height: 20.0.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<String> _getEventsForDay(DateTime day) {
    return _selectedEvents[DateTime(day.year, day.month, day.day)] ?? [];
  }

  void generateEvents(int index) {
    // 0 = Once
    // 1 = Daily
    // 2 = Weekly
    // 3 = Monthly
    // 4 = Yearly
    _selectedEvents.clear();
    Map<DateTime, List<String>> map = {};

    if (index == 0) {
      // Once
      _selectedEvents.addAll({
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day):
            ["Event 1"],
      });
      showWeeklyCalendar = true;
      _repeatInfo = "Your event will occur only once";
    } else if (index == 1) {
      // Daily
      for (int i = 0; i < 1; i++) {
        map[DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day)] = [
          "Event 1"
        ];
      }
      _selectedEvents.addAll(map);
      showWeeklyCalendar = true;
      _repeatInfo = "Your event will repeat daily";
    } else if (index == 2) {
      // Weekly
      for (int i = 0; i < 8; i++) {
        map[DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + i)] = ["Event 1"];
      }
      _selectedEvents.addAll(map);
      showWeeklyCalendar = false;
      _repeatInfo = "Your event will occur on every Wednesday";
    } else if (index == 3) {
      // Monthly
      for (int i = 0; i < 31; i++) {
        map[DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + i)] = ["Event 1"];
      }
      _selectedEvents.addAll(map);
      showWeeklyCalendar = false;
      _repeatInfo = "Your event will occur on every 5th of month";
    } else if (index == 4) {
      // Yearly
      for (int i = 0; i < 365; i++) {
        map[DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + i)] = ["Event 1"];
      }
      _selectedEvents.addAll(map);
      showWeeklyCalendar = false;
      _repeatInfo = "Your event will occur on every 19th May";
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        initialEntryMode: TimePickerEntryMode.inputOnly,
        builder: (context, child) {
          return child ?? const SizedBox();
        });

    if (pickedTime != null && pickedTime != selectedTime)
      setState(() {
        selectedTime = pickedTime;
      });
  }
}
