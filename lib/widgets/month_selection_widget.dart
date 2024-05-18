import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MonthSelectionWidget extends StatefulWidget {
  const MonthSelectionWidget({super.key});

  @override
  State<MonthSelectionWidget> createState() => _MonthSelectionWidgetState();
}

class _MonthSelectionWidgetState extends State<MonthSelectionWidget> {
  List<String> monthList = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
                // childAspectRatio: 1,
                crossAxisCount: 4),
            shrinkWrap: true,
            itemCount: monthList.length,
            itemBuilder: (BuildContext context, int index) {
              return ChoiceChip(label: Text(monthList[index]), selected: true);
            }),*/
        Wrap(
          spacing: 2.5.w,
          children: List.generate(
            monthList.length,
            (index) =>
                ChoiceChip(label: Text(monthList[index]), selected: true, onSelected: (value){},),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return const Row(
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
