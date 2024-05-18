import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:reminder_app/add/add_note_screen.dart';
import 'package:reminder_app/settings/settings_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class Home2Screen extends StatefulWidget {
  const Home2Screen({super.key});

  @override
  State<Home2Screen> createState() => _Home2ScreenState();
}

class _Home2ScreenState extends State<Home2Screen> {
  var eventlist = [
    {
      "time": "10:00 AM",
      "title": "Prepare Presentation",
      "note": "Prepare a physics presentation"
    },
    {
      "time": "01:00 PM",
      "title": "Submit the Project",
      "note": "Biology Project"
    },
    {"time": "05:30 PM", "title": "Gym", "note": "Go to Gym"},
    {"time": "06:30 PM", "title": "Market", "note": "Go to Market for grocery"},
    {
      "time": "10:30 PM",
      "title": "Sleep",
      "note": "Do ironing before going to bed"
    },
    {"time": "05:30 PM", "title": "Gym", "note": "Go to Gym"},
    {"time": "06:30 PM", "title": "Market", "note": "Go to Market for grocery"},
    {
      "time": "10:30 PM",
      "title": "Sleep",
      "note": "Do ironing before going to bed"
    },
  ];

  late Map<DateTime, List<String>> _selectedEvents = Map();

  DateTime activeDay = DateTime.now();

  @override
  void initState() {
    _selectedEvents.addAll({
      DateTime(2024, 5, 20): ["Event 1", "Event 2"],
      DateTime(2024, 5, 21): ["Event 1"],
      DateTime(2024, 5, 25): ["Event 1"],
    });
    log("Init State: ${_selectedEvents}");
    super.initState();
  }

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
                  "Hello, Sophie",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                Text(
                  "Good Evening",
                  style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            /*Container(
              width: 15.w,
              height: 15.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Image.network(
                    "https://t4.ftcdn.net/jpg/03/26/98/51/360_F_326985142_1aaKcEjMQW6ULp6oI9MYuv8lN9f8sFmj.jpg",
                    fit: BoxFit.cover),
              ),
            ),*/
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen())),
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                )),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: activeDay,
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                log("SelectedDay: $selectedDay");
                log("FocusedDay: $focusedDay");
                setState(() {
                  activeDay = selectedDay;
                  // _selectedEvents[selectedDay];
                });
              },
              currentDay: activeDay,
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: const HeaderStyle(
                titleTextStyle: TextStyle(color: Colors.white),
                titleCentered: true,
                formatButtonVisible: false,
                leftChevronIcon: Icon(
                  Icons.chevron_left_sharp,
                  color: Colors.white,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right_sharp,
                  color: Colors.white,
                ),
              ),
              calendarStyle: CalendarStyle(
                weekendTextStyle: const TextStyle(color: Colors.white70),
                todayTextStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp),
                defaultTextStyle: TextStyle(color: Colors.white70),
                weekNumberTextStyle: TextStyle(color: Colors.white70),
                disabledTextStyle: TextStyle(color: Colors.white70),
                holidayTextStyle: TextStyle(color: Colors.white70),
                // outsideDaysVisible: TextStyle(color: Colors.white70),
                outsideTextStyle: TextStyle(color: Colors.white24),
                selectedTextStyle: TextStyle(color: Colors.white70),
                // markerDecoration: BoxDecoration(
                //   color: Colors.greenAccent,
                // ),
                // outsideDecoration: BoxDecoration(
                //   color: Colors.greenAccent,
                // ),
                // rowDecoration: BoxDecoration(
                //   color: Colors.greenAccent,
                // ),
                // weekendDecoration: BoxDecoration(
                //   color: Colors.greenAccent,
                // ),
                todayDecoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Colors.white),
                  // borderRadius: BorderRadius.circular(999),
                  shape: BoxShape.circle,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white),
                weekendStyle: TextStyle(color: Colors.white),
              ),
              eventLoader: (dateTime) {
                return _getEventsForDay(dateTime);
              },
              calendarBuilders:
                  CalendarBuilders(defaultBuilder: (context, day, selectedDay) {
                log("DefaultBuilder: ${_getEventsForDay(day)}");
                return Center(
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      color:
                          _getEventsForDay(day).isEmpty ? null : Colors.white,
                      shape: BoxShape.circle,
                      border: _getEventsForDay(day).isEmpty
                          ? null
                          : Border.all(color: Colors.white),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${day.day}",
                      style: TextStyle(
                        color: _getEventsForDay(day).isEmpty
                            ? Colors.white70
                            : Theme.of(context).colorScheme.primary,
                        fontSize:
                            _getEventsForDay(day).isEmpty ? 16.sp : 16.5.sp,
                        fontWeight: _getEventsForDay(day).isEmpty
                            ? FontWeight.w400
                            : FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }, todayBuilder: (context, day, selectedDay) {
                return Center(
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${day.day}",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                );
              }, markerBuilder: (context, day, eventList) {
                return const SizedBox();
              }),
            ),
          ],
        ),
      ),
      bottomSheet: DraggableScrollableSheet(
        expand: false,
        snap: true,
        snapSizes: const [
          0.5,
        ],
        initialChildSize: 0.5,
        minChildSize: 0.5,
        builder: (context, controller) {
          // log("Home2Screen: MinScrollExtent ${controller.position.minScrollExtent}, MaxScrollExtent ${controller.position.maxScrollExtent}");
          return SingleChildScrollView(
            controller: controller,
            child: Container(
              // height: 45.sh,
              padding: EdgeInsets.only(
                left: 3.5.w,
                right: 3.5.w,
                top: 2.5.h,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.vertical(top: Radius.circular(7.5.w)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Saturday, 6 April 2024",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  /*Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: eventlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 1.75.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    eventlist[index]["time"] ?? "",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        eventlist[index]["title"] ?? "",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        eventlist[index]["note"] ?? "",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.grey,
                                          // fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),*/
                  // Text(controller..toString()),
                  // Text(controller.position.maxScrollExtent.toString()),
                  Column(
                    children: List.generate(1, (index) => Padding(
                      padding: EdgeInsets.only(bottom: 1.75.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              eventlist[index]["time"] ?? "",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  eventlist[index]["title"] ?? "",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  eventlist[index]["note"] ?? "",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                    // fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),).toList(),
                  ),

                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 1.5.h),
        child: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddNoteScreen())),
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  List<String> _getEventsForDay(DateTime day) {
    return _selectedEvents[DateTime(day.year, day.month, day.day)] ?? [];
  }
}
