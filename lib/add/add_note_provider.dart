import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNoteProvider extends ChangeNotifier {
  int _currentDay = DateTime.now().day;
  int _currentMonth = DateTime.now().month;
  int _currentHour = int.parse(DateFormat('h').format(DateTime.now()));
  int _currentMinute = int.parse(DateFormat("mm").format(DateTime.now()));
  int _currentFormat = DateFormat("a").format(DateTime.now()) == "AM" ? 0 : 1;  int _selectedIndex = 0;
  String _repeatInfo = "One-time event: Useful for small tasks.";
  TimeOfDay _selectedTime = TimeOfDay.now();

  int get currentDay => _currentDay;
  int get currentMonth => _currentMonth;
  int get currentHour => _currentHour;
  int get currentMinute => _currentMinute;
  int get currentFormat => _currentFormat;
  int get selectedIndex => _selectedIndex;
  String get repeatInfo => _repeatInfo;
  TimeOfDay get selectedTime => _selectedTime;

  void updateDay(int value) {
    _currentDay = value;
    if (_currentMonth == 2 && _currentDay > 28) {
      // February does not have 30 days, so if the day is 30th,
      // automatically shift to the next month
      _currentMonth++;
      if (_currentMonth > 12) {
        // If the month exceeds 12, reset to 1 (January)
        _currentMonth = 1;
      }
    }
    _updateRepeatInfo();
    notifyListeners();
  }

  void updateMonth(int value) {
    _currentMonth = value;
    if (_currentMonth == 2 && _currentDay > 28) {
      // If the selected month is February and the day is 29th, 30th, or 31st,
      // set the day to 28th
      _currentDay = 28;
    }
    _updateRepeatInfo();
    notifyListeners();
  }

  void updateHour(int value) {
    _currentHour = value;
    _updateRepeatInfo();
    notifyListeners();
  }

  void updateMinute(int value) {
    _currentMinute = value;
    _updateRepeatInfo();
    notifyListeners();
  }

  void updateFormat(int value) {
    _currentFormat = value;
    _updateRepeatInfo();
    notifyListeners();
  }

  void updateSelectedIndex(int value) {
    _selectedIndex = value;
    _updateRepeatInfo();
    notifyListeners();
  }

  void updateSelectedTime(TimeOfDay time) {
    _selectedTime = time;
    notifyListeners();
  }

  void _updateRepeatInfo() {
    try {
      DateTime selectedDate = DateTime(DateTime.now().year, _currentMonth, _currentDay);
      String formattedDate = DateFormat.EEEE().format(selectedDate);
      String monthName = DateFormat.MMMM().format(selectedDate);
      String paddedMinute = _currentMinute.toString().padLeft(2, '0'); // Add zero padding to currentMinute

      switch (_selectedIndex) {
        case 0:
          _repeatInfo = "One-time event: Useful for small tasks.";
          break;
        case 1:
          _repeatInfo = "Daily at $_currentHour:$paddedMinute ${_currentFormat == 0 ? 'AM' : 'PM'}: Ideal for habits like drinking water, going to the gym, reading, etc.";
          break;
        case 2:
          _repeatInfo = "Every $formattedDate: Great for weekly meetings, cleaning, grocery shopping, etc.";
          break;
        case 3:
          _repeatInfo = "Monthly on the $_currentDay${getDayOfMonthSuffix(_currentDay)}: Perfect for bills, recharges, installment reminders, etc.";
          break;
        case 4:
          _repeatInfo = "Yearly on $monthName $_currentDay${getDayOfMonthSuffix(_currentDay)}: Use for birthdays, anniversaries, and annual reminders.";
          break;
      }
    } catch (e) {
      _repeatInfo = "Invalid date selected.";
    }
    notifyListeners();
  }

  String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch (dayNum % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
