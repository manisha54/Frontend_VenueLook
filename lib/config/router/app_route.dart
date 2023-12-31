import 'package:venue_look/feature/booking/presentation/view/booking_venue_view.dart';
import 'package:venue_look/feature/booking/presentation/view/update_booking_view.dart';
import 'package:venue_look/feature/home/presentation/view/bottom_view/booking_view.dart';
import 'package:venue_look/feature/home/presentation/view/home_view.dart';
import 'package:venue_look/feature/home/presentation/widget/aboutus_view.dart';
import 'package:venue_look/feature/home/presentation/widget/chat_with_us.dart';
import 'package:venue_look/feature/home/presentation/widget/edit_profile_view.dart';
import 'package:venue_look/feature/home/presentation/widget/see_users_view.dart';
import 'package:venue_look/feature/home/presentation/widget/setting_view.dart';
import 'package:venue_look/feature/home/presentation/widget/update_password_view.dart';
import 'package:venue_look/feature/user/presentation/view/signup_view.dart';
import 'package:venue_look/feature/venue/presentation/view/venue_details.dart';

import '../../feature/home/presentation/widget/check_availability.dart';
import '../../feature/splash/presentation/view/splash_view.dart';
import '../../feature/user/presentation/view/signin_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String venueDetailRoute = '/venuedetails';
  static const String editProfileRoute = '/userprofile';
  static const String settingRoute = '/setting';
  static const String changePasswordRoute = '/changePassword';
  static const String aboutUsRoute = '/aboutus';
  static const String bookingRoute = '/booking';
  static const String updateBookingRoute = '/updatebooking';
  static const String seeUserRoute = '/seeUser';
  static const String checkAvailabilityRoute = '/check';
  static const String chatwithUsRoute = '/chat';
  static const String bookingDetailView = '/bpookingdetail';
  

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const SignInView(),
      registerRoute: (context) => const SignUpView(),
      homeRoute: (context) => const HomeView(),
      editProfileRoute: (context) => const EditprofileView(),
      settingRoute: (context) => const SettingView(),
      changePasswordRoute: (context) => const UpdatePasswordView(),
      venueDetailRoute: (context) => const VenueDetailsView(),
      aboutUsRoute: (context) => const AboutUsView(),
      bookingRoute: (context) => const BookingVenueView(),
      updateBookingRoute: (context) => const UpdateBookingView(),
      seeUserRoute: (context) => const SeeUserView(),
      checkAvailabilityRoute: (context) => const CheckAvailability(),
      chatwithUsRoute: (context) => const ChatWithUs(),
      bookingDetailView: (context) => const BookingView(),
    };
  }
}
