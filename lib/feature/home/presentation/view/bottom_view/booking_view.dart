import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/booking/presentation/viewmodel/booking_view_model.dart';

import '../../../../../core/common/snackbar/my_snackbar.dart';
import '../../../../booking/presentation/widget/booking_widget.dart';
import '../../../../venue/presentation/viewmodel/venue_view_model.dart';

class BookingView extends ConsumerStatefulWidget {
  const BookingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookingViewState();
}

class _BookingViewState extends ConsumerState<BookingView> {
  @override
  Widget build(BuildContext context) {
    var bookingState = ref.watch(bookingViewModelProvider);
    var venuestate = ref.watch(venueViewModelProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Custom toolbar height
        child: AppBar(
          title: const Text("Your Booking"),
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(bookingViewModelProvider.notifier).getAllBookings();
                showSnackBar(message: 'Refressing...', context: context);
              },
              icon: const Icon(
                Icons.refresh,
                color: Color.fromARGB(255, 239, 243, 243),
              ),
            ),
          ],
        ),
      ),
        
        body: Column(
          children: [
            Flexible(
              child: BookingWidget(
                ref: ref,
                bookingList: bookingState.bookings,
                venueList: venuestate.venues,
              ),
            ),
          ],
        ));
  }
}
