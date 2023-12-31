import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/home/presentation/widget/venue_widget.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140), // Custom toolbar height
        child: AppBar(
          toolbarHeight: 140,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          title: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7E6E7),
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
                          color: Colors.black,
                          size: 32,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            width: 300,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  hintText: "Search Venue",
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.mic,
                          color: Colors.black,
                          size: 32,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 0, horizontal: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 13,
              ),
              const Text(
                "Vendor by Category",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                   // const SizedBox(width: 0), // Add initial padding
                    _buildAvatarWithText('Catrer', 'assets/images/naulo.jpg'),
                    const SizedBox(width: 8), // Add spacing between avatars
                    _buildAvatarWithText(
                        'Photographer', 'assets/images/naulo.jpg'),
                    const SizedBox(width: 8), // Add spacing between avatars
                     _buildAvatarWithText(
                        'Musician', 'assets/images/naulo.jpg'),
                    const SizedBox(width: 8), // Add spacing between avatars
                     _buildAvatarWithText(
                        'Magician', 'assets/images/naulo.jpg'),
                    
                    
                  ],
                ),
              )
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

Widget _buildAvatarWithText(String text, String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    child: Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
