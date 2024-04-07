class AppUrls {
  static const String baseUrl = 'https://movemint-052bc20ec57b.herokuapp.com';

  static const String checkUserExists = '$baseUrl/user/api/userExist';
  static const String signIn = '$baseUrl/auth/api/auth/signin';
  static const String signUp = '$baseUrl/auth/api/auth/signup';
  static const String getOrders = '$baseUrl/user/api/getOrderList';
  static const String createOrder = '$baseUrl/user/api/createOrder';
}
