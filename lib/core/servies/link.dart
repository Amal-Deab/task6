import '../const_data/const_data.dart';

class AppLink {
//local
  static String localHost = '127.0.0.1';

//remote address
  static String appRoot = 'https://task.focal-x.com';

  static String imageWithRoot = "$appRoot/storage/";
  static String imageWithoutRoot = "$appRoot";
  static String serverApiRoot = "$appRoot/api";

//api
  static String login = "$serverApiRoot/login";
  static String register = "$serverApiRoot/register";
  static String products = "$serverApiRoot/products";
  static String categories = "$serverApiRoot/categories";
  static String logout = "$serverApiRoot/logout";
  static String getOrders = "$serverApiRoot/orders";
  static String updateOrder = "$serverApiRoot/orders";

  Map<String, String> getHeader() {
    Map<String, String> mainHeader = {
      'Accept': 'application/json',
    };

    return mainHeader;
  }

  Map<String, String> getHeaderWithToken() {
    Map<String, String> mainHeader = {
      'Accept': 'application/json',
      "Authorization": "Bearer ${ConstData.token}"
    };
    return mainHeader;
  }
}

//function get header without token


//function get header with token

