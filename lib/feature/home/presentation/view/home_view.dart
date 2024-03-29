import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/home/presentation/view/bottom_view/chat_view.dart';
import 'package:venue_look/feature/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:venue_look/feature/home/presentation/widget/favourite_view.dart';

import 'bottom_view/profile_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewViewState();
}

class _HomeViewViewState extends ConsumerState<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _screen = [
    const DashboardView(),
    const ChatView(),
     FavouriteView(),
    //const AddVenue(),
   // const AboutUsView(),

    //const BookingView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screen[_selectedIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: BottomNavigationBar(
            iconSize: 30.0,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                backgroundColor: Color(0xFFD9D9EC),
                icon: Icon(
                  Icons.home,
                  size: 45,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  size: 45,
                ),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 45,
                ),
                label: "favourite",
              ),
              //  BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.book_online_sharp,
              //     size: 45,
              //   ),
              //   label: "Booking detailsy",
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 45,
                ),
                label: "profile",
              ),
            ],
            onTap: (i) {
              setState(() {
                _selectedIndex = i;
              });
            },
            currentIndex: _selectedIndex,
          ),
        ),
      ),
    );
  }
}
