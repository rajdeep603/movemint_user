class AppUrls {
  // static const String baseUrl = 'https://movemint-052bc20ec57b.herokuapp.com';
  // static const String baseUrl = 'http://192.168.29.246:5002';
  // static const String baseUrl = 'http://192.168.29.181:9000';
  // static const String baseUrl = 'http://192.168.29.233:9000';
  static const String baseUrl = 'http://52.205.113.70';
  static const String checkUserExists = '$baseUrl/user/api/userExist';
  static const String signIn = '$baseUrl/auth/api/auth/signin';
  static const String signUp = '$baseUrl/auth/api/auth/signup';
  static const String getOrders = '$baseUrl/user/api/getOrderList';
  static const String createOrder = '$baseUrl/user/api/createOrder';
  static const String cancelOrder = '$baseUrl/user/api/cancelOrder';
  static const String getAllProductList =
      '$baseUrl/user/api/getMasterPriceData';
}
