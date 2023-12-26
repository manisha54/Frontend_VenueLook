import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';
import 'package:venue_look/feature/booking/presentation/viewmodel/booking_view_model.dart';

class BookingVenueView extends ConsumerStatefulWidget {
  const BookingVenueView({super.key});

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
      appBar: AppBar(
        title: const Text("Book Venue"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Book now for our services          ",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Text(
                "Limited time offer, grab it soon !",
                style: TextStyle(
                  fontFamily: 'RobotoCondensed REgular',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffA9A9A9),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _fullNameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xffDCDCDC),
                        hintText: 'Enter your full name',
                        // labelText: "Name",
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      style: const TextStyle(fontSize: 19, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _contactNumberController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xffDCDCDC),
                        hintText: 'Enter your contact number',
                        // labelText: "Name",
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          // borderRadius: BorderRadius.all(
                          //   Radius.circular(25),
                          // )
                        ),
                      ),
                      style: const TextStyle(fontSize: 19, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Selects date :    ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: 'RobotoCondensed Regular',
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
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
                          child:
                              Text('${date!.day}/${date!.month}/${date!.year}'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Choose Time :    ',
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
                          )),
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
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        onPressed: () {
                          final booking = BookingEntity(
                              date: '${date!.day}/${date!.month}/${date!.year}',
                              time: '${time!.hour}:${time!.minute}',
                              contactNumber:
                                  _contactNumberController.text.trim(),
                              fullName: _fullNameController.text.trim());

                          ref
                              .read(bookingViewModelProvider.notifier)
                              .bookingVenue(context, booking, veneuId!);
                          // showSnackBar(
                          //     context: context,
                          //     message: "Booking sucessfully",
                          //     color: Colors.green);
                        },
                        child: const Text(
                          "Book Now",
                          style: TextStyle(
                            backgroundColor: Color(0xFF0BC7B7),
                            fontFamily: 'RobotoCondensed Regular',
                            fontWeight: FontWeight.w400,
                            fontSize: 35,
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
