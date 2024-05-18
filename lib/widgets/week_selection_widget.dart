import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WeekSelectionWidget extends StatefulWidget {
  const WeekSelectionWidget({super.key});

  @override
  State<WeekSelectionWidget> createState() => _WeekSelectionWidgetState();
}

class _WeekSelectionWidgetState extends State<WeekSelectionWidget> {
  List<String> dayList = [
    "S",
    "M",
    "T",
    "W",
    "T",
    "F",
    "S",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 7.5.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: dayList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(left: 2.5.w),
                  child: ChoiceChip(label: Text(dayList[index]), selected: true, onSelected: (value){

                  },),
                );
              }),
        ),
        ListView.builder(
          shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Text(
                    "Tuesday",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    " at ",
                  ),
                  Text(
                    "11:30 AM",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                  ),
                ],
              );
            })
      ],
    );
  }
}
