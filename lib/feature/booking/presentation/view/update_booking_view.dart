import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/booking_entity.dart';
import '../viewmodel/booking_view_model.dart';

class UpdateBookingView extends ConsumerStatefulWidget {
  const UpdateBookingView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateBookingViewState();
}

class _UpdateBookingViewState extends ConsumerState<UpdateBookingView> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay? time = TimeOfDay.now();
  DateTime? date = DateTime.now();
  String? veneuId;
  String? bookingId;
  final _fullNameController = TextEditingController();
  final _contactNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var bookingState = ref.read(bookingViewModelProvider);
    List<BookingEntity>? userList = bookingState.bookings;
    _fullNameController.text = userList[0].fullName;
    _contactNumberController.text = userList[0].contactNumber;
  }

  @override
  Widget build(BuildContext context) {
    var bookingState = ref.watch(bookingViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Booking"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Book now for our services",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Text(
              "Limited time offer, grab it soon!",
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 16,
                color: Color(0xffA9A9A9),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _fullNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffDCDCDC),
                      hintText: 'Enter your full name',
                      contentPadding: const EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _contactNumberController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffDCDCDC),
                      hintText: 'Enter your contact number',
                      contentPadding: const EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Select date: ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // Date picker logic
                        },
                        child: Text('${date!.day}/${date!.month}/${date!.year}'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Choose time: ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // Time picker logic
                        },
                        child: Text('${time!.hour}:${time!.minute}'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Update booking logic
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        "Update Booking",
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
