import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/widgets/primary_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'add_note_provider.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddNoteProvider(),
      child: Scaffold(
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
                        _buildNumberPicker(
                          context: context,
                          label: "Day",
                          value: context.watch<AddNoteProvider>().currentDay,
                          minValue: 1,
                          maxValue: 30,
                          onChanged: (value) =>
                              context.read<AddNoteProvider>().updateDay(value),
                        ),
                        _buildNumberPicker(
                          context: context,
                          label: "Month",
                          value: context.watch<AddNoteProvider>().currentMonth,
                          minValue: 1,
                          maxValue: 12,
                          onChanged: (value) => context
                              .read<AddNoteProvider>()
                              .updateMonth(value),
                        ),
                        _buildNumberPicker(
                          context: context,
                          label: "Hour",
                          value: context.watch<AddNoteProvider>().currentHour,
                          minValue: 1,
                          maxValue: 12,
                          onChanged: (value) =>
                              context.read<AddNoteProvider>().updateHour(value),
                        ),
                        _buildNumberPicker(
                          context: context,
                          label: "Minute",
                          value: context.watch<AddNoteProvider>().currentMinute,
                          minValue: 0,
                          maxValue: 59,
                          zeroPadding: true,
                          onChanged: (value) => context
                              .read<AddNoteProvider>()
                              .updateMinute(value),
                        ),
                        _buildNumberPicker(
                          context: context,
                          label: "",
                          value: context.watch<AddNoteProvider>().currentFormat,
                          minValue: 0,
                          maxValue: 1,
                          textMapper: (value) => value == "0" ? "AM" : "PM",
                          onChanged: (value) => context
                              .read<AddNoteProvider>()
                              .updateFormat(value),
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
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 1.5.w),
                          child: ChoiceChip(
                            label: Text(
                              [
                                "Once",
                                "Daily",
                                "Weekly",
                                "Monthly",
                                "Yearly"
                              ][index],
                            ),
                            selected: context
                                .watch<AddNoteProvider>()
                                .selectedIndex ==
                                index,
                            onSelected: (value) {
                              if (value) {
                                context
                                    .read<AddNoteProvider>()
                                    .updateSelectedIndex(index);
                              }
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      context.watch<AddNoteProvider>().repeatInfo,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
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
      ),
    );
  }

  Widget _buildNumberPicker({
    required BuildContext context,
    required String label,
    required int value,
    required int minValue,
    required int maxValue,
    required ValueChanged<int> onChanged,
    String Function(String)? textMapper,
    bool zeroPadding = false,
  }) {
    return Expanded(
      child: Column(
        children: [
          if (label.isNotEmpty)
            Text(
              label,
              style: TextStyle(color: Colors.grey, fontSize: 15.sp),
            ),
          NumberPicker(
            value: value,
            minValue: minValue,
            maxValue: maxValue,
            textMapper: textMapper,
            zeroPad: zeroPadding,
            selectedTextStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            ),
            textStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
