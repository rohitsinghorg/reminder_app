import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/add/add_note_screen.dart';
import 'package:reminder_app/settings/settings_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import 'home2_provider.dart';

class Home2Screen extends StatelessWidget {
  const Home2Screen({super.key});

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
                Consumer<Home2Provider>(
                  builder: (context, provider, child) {
                    return Text(
                      provider.getGreeting(),
                      style: TextStyle(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }
                ),
              ],
            ),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen())),
                icon: const Icon(
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
              focusedDay: Provider.of<Home2Provider>(context, listen: true).focusedDay,//provider.activeDay,
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                log("SelectedDay: $selectedDay");
                log("FocusedDay: $focusedDay");
                Provider.of<Home2Provider>(context, listen: false).setActiveDay(selectedDay);
                Provider.of<Home2Provider>(context, listen: false).setFocusedDay(focusedDay);
              },
              currentDay: Provider.of<Home2Provider>(context, listen: false).activeDay,
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
                defaultTextStyle: const TextStyle(color: Colors.white70),
                weekNumberTextStyle:
                const TextStyle(color: Colors.white70),
                disabledTextStyle: const TextStyle(color: Colors.white70),
                holidayTextStyle: const TextStyle(color: Colors.white70),
                // outsideDaysVisible: TextStyle(color: Colors.white70),
                outsideTextStyle: const TextStyle(color: Colors.white24),
                selectedTextStyle: const TextStyle(color: Colors.white70),
                todayDecoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white),
                weekendStyle: TextStyle(color: Colors.white),
              ),
              eventLoader: (dateTime) {
                return Provider.of<Home2Provider>(context, listen: false).getEventsForDay(dateTime);
                // return provider.getEventsForDay(dateTime);
              },
              onPageChanged: (dateTime) {
                // provider.onPageChanged(dateTime);
                Provider.of<Home2Provider>(context, listen: false).onPageChanged(dateTime);
              },
              calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, selectedDay) {
                    // log("DefaultBuilder: ${provider.getEventsForDay(day)}");
                    return Center(
                      child: Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color: Provider.of<Home2Provider>(context, listen: false).getEventsForDay(day).isEmpty
                              ? null
                              : Colors.white,
                          shape: BoxShape.circle,
                          border: Provider.of<Home2Provider>(context, listen: false).getEventsForDay(day).isEmpty
                              ? null
                              : Border.all(color: Colors.white),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${day.day}",
                          style: TextStyle(
                            color:Provider.of<Home2Provider>(context, listen: false).getEventsForDay(day).isEmpty
                                ? Colors.white70
                                : Theme.of(context).colorScheme.primary,
                            fontSize: Provider.of<Home2Provider>(context, listen: false).getEventsForDay(day).isEmpty
                                ? 16.sp
                                : 16.5.sp,
                            fontWeight: Provider.of<Home2Provider>(context, listen: false).getEventsForDay(day).isEmpty
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
                      style:
                      TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                );
              }, markerBuilder: (context, day, eventList) {
                return const SizedBox();
              }, selectedBuilder: (context, day, selectedDay){
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
                      style:
                      TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      bottomSheet: Consumer<Home2Provider>(
        builder: (context, provider, child) {
          log("Draggable Bottom Sheet: ${provider.height}");
          return DraggableScrollableSheet(
            expand: false,
            snap: true,
            // snapSizes: const [
            //   0.5,
            // ],
            initialChildSize: provider.height,
            minChildSize: provider.height,
            maxChildSize: 1,
            builder: (context, controller) {
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
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(7.5.w)),
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
                            "${DateFormat('EEEE').format(provider.activeDay)}, ${DateFormat('dd MMMM yyyy').format(provider.activeDay)}",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            provider.compareActiveDay(provider.activeDay),
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
                      provider.getEventsForDay(provider.activeDay).isEmpty
                          ? const Text("No event found")
                          : Column(
                        children: List.generate(
                          provider
                              .getEventsForDay(provider.activeDay)
                              .length,
                              (index) => Padding(
                            padding: EdgeInsets.only(bottom: 1.75.h),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    provider.getEventsForDay(
                                        provider.activeDay)[index]
                                    ["time"],
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        provider.getEventsForDay(
                                            provider.activeDay)[
                                        index]["title"] ??
                                            "",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        provider.getEventsForDay(
                                            provider.activeDay)[
                                        index]["note"] ??
                                            "",
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
                          ),
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endContained,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 1.5.h),
        child: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddNoteScreen())),
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
