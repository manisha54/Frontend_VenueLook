class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 3000);
  static const Duration receiveTimeout = Duration(seconds: 3000);
  static const String baseUrl = "http://10.0.2.2:3001/";
  //static const String baseUrl = "http://192.168.137.1:3001/";

  // ====================== users Routes ======================
  static const String login = "users/login";
  static const String register = "users/register";
  static const String getUserInfo = "users/userinfo";
  static const String updateProfile = "users/userinfo";

  // ====================== Venue Routes ======================
  static const String createVenue = "/venues";
  static const String getAllVenue = "/venues";
  static const String deleteVenue = "/venues/";
  static const String getVenueById = "/venues/";
  static const String updateVenue = "/venues/";
  static const String uploadImage = "/upload/";
  static const String imageUrl = "http://10.0.2.2:3001/uploads/";
  //static const String imageUrl = "http://192.168.137.1:3001/uploads/";

  // ====================== booking route ======================
  static const String createBooking = "/bookings/";
  static const String getAllBookings = "/bookings/allbookings";
  static const String deleteBooking = "/bookings/";
  static const String updateBooking = "/bookings/";


  // ====================== Review route ======================
  static const String getAllReviews = "/venues/reviews";
  static const String createReview = "/venues/reviews";
  static const String deleteAllReviews = "/venues/reviews/";
  static const String updateReviewById = "/venues/reviews/";
}
