import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CheckAvailability extends StatefulWidget {
  const CheckAvailability({Key? key}) : super(key: key);

  @override
  _CheckAvailabilityState createState() => _CheckAvailabilityState();
}

class _CheckAvailabilityState extends State<CheckAvailability> {
  late CalendarFormat _calendarFormat;
  DateTime _focusedDay = DateTime.now(); // Initialize _focusedDay

  // Sample booked dates
  List<DateTime> bookedDates = [
    DateTime.now().add(const Duration(days: 2)),
    DateTime.now().add(const Duration(days: 5)),
    DateTime.now().add(const Duration(days: 10)),
  ];

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
  }

  Map<DateTime, List<dynamic>> _generateEvents(List<DateTime> bookedDates) {
    Map<DateTime, List<dynamic>> events = {};
    for (var date in bookedDates) {
      events[date] = ['Booked'];
    }
    return events;
  }

  @override
  Widget build(BuildContext context) {
    final Map<DateTime, List<dynamic>> events = _generateEvents(bookedDates);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Availability"),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (date) {
              return events[date] ?? []; // Return booked dates, or an empty list if no events
            },
            // ... other configuration for the calendar
          ),
          // Additional UI or functionality for availability checking
        ],
      ),
    );
  }
}
