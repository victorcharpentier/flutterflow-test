// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final today = DateUtils.dateOnly(DateTime.now());

class RangeCalendar extends StatefulWidget {
  const RangeCalendar({
    Key? key,
    this.width,
    this.height,
    required this.updatePageUI,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() updatePageUI;

  @override
  _RangeCalendarState createState() => _RangeCalendarState();
}

class _RangeCalendarState extends State<RangeCalendar> {
  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime(today.year, today.month, today.day),
    DateTime(today.year, today.month, today.day),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: widget.width ??
              375, // Utilisez la largeur passée en paramètre ou une valeur par défaut
          child: ListView(
            children: <Widget>[
              _buildDefaultRangeDatePickerWithValue(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultRangeDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.teal[800],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        CalendarDatePicker2(
          config: config,
          value: _rangeDatePickerValueWithDefaultValue,
          onValueChanged: _onDateChanged,
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  void _onDateChanged(List<DateTime?> dates) {
    setState(() => _rangeDatePickerValueWithDefaultValue = dates);

    // Initialise startDate et endDate à null
    DateTime? startDate;
    DateTime? endDate;

    // Vérifie si la liste dates a au moins un élément pour startDate
    if (dates.isNotEmpty && dates[0] != null) {
      startDate = dates[0];
    }

    // Vérifie si la liste dates a un deuxième élément pour endDate
    if (dates.length > 1 && dates[1] != null) {
      endDate = dates[1];
    }

    // Met à jour les AppState de FlutterFlow
    FFAppState().startDate = startDate;
    FFAppState().endDate = endDate;
    widget.updatePageUI();
  }
}
