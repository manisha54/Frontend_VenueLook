import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MaterialApp(
    home: CheckAvailability(),
  ));
}

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
    DateTime.now().add(const Duration(days: 19)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select Date:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
            calendarBuilders: CalendarBuilders(
              // Mark booked dates with a different style
              defaultBuilder: (context, date, _) {
                if (events.keys.toList().contains(date)) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: events[date]!.isEmpty ? Colors.green : Colors.red,
                    ),
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        color: events[date]!.isEmpty ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                } else {
                  return null;
                }
              },
              // Add markers for available dates
              markerBuilder: (context, date, events) {
                if (events.isEmpty) {
                  return null;
                }
                return const Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                );
              },
            ),
            // ... other configuration for the calendar
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  //   child: Text(
                  //     'Available Dates:',
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  // Display available dates only
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      DateTime date = events.keys.elementAt(index);
                      List<dynamic> bookings = events[date] ?? [];
                      bool isBooked = bookings.isNotEmpty;

                      if (!isBooked) {
                        return ListTile(
                          title: Text(
                            DateFormat('EEE, MMM d').format(date),
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Available',
                            style: TextStyle(color: Colors.green),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'Booked Dates:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Display booked dates only
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      DateTime date = events.keys.elementAt(index);
                      List<dynamic> bookings = events[date] ?? [];
                      bool isBooked = bookings.isNotEmpty;

                      if (isBooked) {
                        return ListTile(
                          title: Text(
                            DateFormat('EEE, MMM d').format(date),
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Booked',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
