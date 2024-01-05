import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';
import 'package:venue_look/feature/booking/presentation/viewmodel/booking_view_model.dart';

class BookingVenueView extends ConsumerStatefulWidget {
  const BookingVenueView({Key? key}) : super(key: key);

  @override
  ConsumerState<BookingVenueView> createState() => _BookingVenueViewState();
}

class _BookingVenueViewState extends ConsumerState<BookingVenueView> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay? time = TimeOfDay.now();
  DateTime? date = DateTime.now();
  String? veneuId;

  final _fullNameController = TextEditingController();
  final _contactNumberController = TextEditingController();

  @override
  void didChangeDependencies() {
    veneuId = ModalRoute.of(context)?.settings.arguments as String?;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Custom toolbar height
        child: AppBar(
          title: const Text("Book Venue"),
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Book now for our services",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Text(
              "Limited time offer, grab it soon!",
              style: TextStyle(
                fontFamily: 'RobotoCondensed Regular',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xffA9A9A9),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _fullNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffDCDCDC),
                      hintText: 'Enter your full name',
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    style: const TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _contactNumberController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffDCDCDC),
                      hintText: 'Enter your contact number',
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    style: const TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Select date: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoCondensed Regular',
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          //  backgroundColor: Colors.blue, // Change button color as needed
                        ),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date!,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          );
                          if (newDate != null) {
                            setState(() {
                              date = newDate;
                            });
                          }
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
                          color: Colors.black,
                          fontFamily: 'RobotoCondensed Regular',
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          //  backgroundColor: Colors.blue, // Change button color as needed
                        ),
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                              context: context, initialTime: time!);
                          if (newTime != null) {
                            setState(() {
                              time = newTime;
                            });
                          }
                        },
                        child: Text('${time!.hour}:${time!.minute}'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ), 
                      // backgroundColor: Colors.green, // Change button color as needed
                    ),
                    onPressed: () {
                      final booking = BookingEntity(
                        date: '${date!.day}/${date!.month}/${date!.year}',
                        time: '${time!.hour}:${time!.minute}',
                        contactNumber: _contactNumberController.text.trim(),
                        fullName: _fullNameController.text.trim(),
                      );

                      ref
                          .read(bookingViewModelProvider.notifier)
                          .bookingVenue(context, booking, veneuId!);
                    },
                    child: const Text(
                      "Book Now",
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 35,
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
