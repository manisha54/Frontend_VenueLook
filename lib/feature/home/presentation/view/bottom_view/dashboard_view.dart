import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/home/presentation/widget/venue_widget.dart';

import '../../../../../core/common/snackbar/my_snackbar.dart';
import '../../../../user/presentation/viewmodel/user_view_model.dart';
import '../../../../venue/presentation/viewmodel/venue_view_model.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    var venueState = ref.watch(venueViewModelProvider);
    var userState = ref.read(userViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome To VenueLook',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(venueViewModelProvider.notifier).venues();
              showSnackBar(message: 'Refressing...', context: context);
            },
            icon: const Icon(
              Icons.refresh,
              color: Color(0xFF0BC7B7),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF0BC7B7),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.search,
                        // color: Color(0xFF0BC7B7),
                        color: Colors.black,
                        size: 32,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          //  color: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  hintText: "Search Venue",
                                  hintStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 13,),
              const Text("Hi !!",
              style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600,color: Color(0xFFFF1493)
              ),),
              // Text(
              //   "${userState.users![0].fName} ${userState.users![0].lName}",
              //   style:
              //       const TextStyle(fontSize: 25, fontWeight: FontWeight.w600,color: Color(0xFFFF1493) ),
              // ),
            ]),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 10),
            child: Text(
              "Popular Venue",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // const PopularVenue(),

          VenueWidget(ref: ref, venueList: venueState.venues),
        ],
      ),
    );
  }
}
