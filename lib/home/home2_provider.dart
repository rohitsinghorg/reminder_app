import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home2Provider with ChangeNotifier {
  final _eventList = [
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

  final _eventList1 = [
    {
      "time": "10:00 AM",
      "title": "Prepare Presentation",
      "note":
          "Prepare a physics presentation about the principles of thermodynamics and their applications in real-world scenarios."
    },
    {
      "time": "01:00 PM",
      "title": "Submit the Project",
      "note":
          "Submit the final draft of the Biology Project report on the impact of climate change on biodiversity and ecosystem stability."
    },
    {
      "time": "05:30 PM",
      "title": "Gym",
      "note":
          "Hit the gym for an intense workout session focusing on cardio and strength training exercises."
    },
    {
      "time": "06:30 PM",
      "title": "Grocery Shopping",
      "note":
          "Visit the nearby market to purchase groceries, including fresh fruits, vegetables, dairy products, and household essentials."
    },
    {
      "time": "10:30 PM",
      "title": "Bedtime Routine",
      "note":
          "Follow the bedtime routine, including reading a chapter from a favorite book, practicing meditation, and preparing clothes for the next day."
    },
  ];

  final _eventList2 = [
    {
      "time": "05:30 PM",
      "title": "Yoga Class",
      "note":
          "Attend the yoga class at the community center to improve flexibility, reduce stress, and promote overall well-being."
    },
    {
      "time": "06:30 PM",
      "title": "Dinner with Friends",
      "note":
          "Enjoy a delicious dinner with friends at the new Italian restaurant downtown, trying out various pasta dishes and desserts."
    },
    {
      "time": "09:00 PM",
      "title": "Movie Night",
      "note":
          "Host a cozy movie night at home with popcorn, snacks, and a selection of classic movies for an entertaining evening."
    },
    {
      "time": "11:00 PM",
      "title": "Late-night Walk",
      "note":
          "Take a leisurely stroll under the starry sky, enjoying the cool breeze and peaceful ambiance of the neighborhood."
    },
  ];

  late final Map<DateTime, List<Map>> _selectedEvents = {};

  DateTime _activeDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  bool _isSixWeekMonth = false;
  double height = 0.5;

  Home2Provider() {
    _selectedEvents.addAll({
      DateTime(2024, 5, 25): _eventList1,
      DateTime(2024, 5, 27): _eventList2,
      DateTime(2024, 6, 11): _eventList,
    });
  }

  DateTime get activeDay => _activeDay;
  DateTime get focusedDay => _focusedDay;
  bool get isSixWeekMonth => _isSixWeekMonth;

  List<Map> getEventsForDay(DateTime day) {
    return _selectedEvents[DateTime(day.year, day.month, day.day)] ?? [];
  }

  void onPageChanged(DateTime dateTime) {
    int daysInMonth = DateTime(dateTime.year, dateTime.month + 1, 0).day;
    int firstDayOfMonth = DateTime(dateTime.year, dateTime.month, 1).weekday;

    // Calculate the number of days to display before the first occurrence of Monday
    int daysBeforeMonday = (firstDayOfMonth - DateTime.monday + 7) % 7;

    // Calculate the number of full rows needed
    int fullRows = (daysInMonth + daysBeforeMonday) ~/ 7;

    // Check if there are any remaining days after the full rows
    int remainingDays = (daysInMonth + daysBeforeMonday) % 7;
    if (remainingDays > 0) {
      fullRows++;
    }

    if (fullRows == 5) {
      height = 0.5;
    } else {
      height = 0.45;
    }
    _focusedDay = dateTime;
    notifyListeners();
  }

  void setActiveDay(DateTime day) {
    _activeDay = day;
    notifyListeners();
  }

  void setFocusedDay(DateTime day) {
    _focusedDay = day;
    notifyListeners();
  }

  void setIsSixWeekMonth(bool value) {
    _isSixWeekMonth = value;
    notifyListeners();
  }

  String compareActiveDay(DateTime activeDay) {
    DateTime today = DateTime.now();

    if (activeDay.year == today.year &&
        activeDay.month == today.month &&
        activeDay.day == today.day) {
      return 'Today';
    } else if (activeDay.year == today.year &&
        activeDay.month == today.month &&
        activeDay.day == today.day + 1) {
      return 'Tomorrow';
    } else if (activeDay.year == today.year &&
        activeDay.month == today.month &&
        activeDay.day == today.day - 1) {
      return 'Yesterday';
    } else if (activeDay.isAfter(today)) {
      int daysDifference = activeDay.difference(today).inDays;
      return 'After $daysDifference days';
    } else {
      int daysDifference = today.difference(activeDay).inDays;
      return 'Before $daysDifference days';
    }
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 20) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }
}
