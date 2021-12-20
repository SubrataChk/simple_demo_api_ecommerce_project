import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  ///Get all product from API
  Future getAllProduct() async {
    final urlProduct = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(urlProduct);
    // print(response.statusCode);
    return jsonDecode(response.body);
  }

  /// Get Single Product from API
  Future getSingleProduct(int id) async {
    final productUrl = Uri.parse("https://fakestoreapi.com/products/$id");
    final response = await http.get(productUrl);

    // print(response.statusCode);
    // print(response.body);

    return jsonDecode(response.body);
  }

  /// Get Category name from API

  Future categoryList() async {
    final catUrl = Uri.parse("https://fakestoreapi.com/products/categories");
    final response = await http.get(catUrl);

    // print(response.body);
    // print(response.statusCode);
    return jsonDecode(response.body);
  }

  /// Product Serial by Category

  Future categoryListProduct(String catName) async {
    final categorylistproUrl =
        Uri.parse("https://fakestoreapi.com/products/category/$catName");
    final response = await http.get(categorylistproUrl);

    print(response.statusCode);
    print(response.body);

    return jsonDecode(response.body);
  }

  Future cartAdd(int id) async {
    final cartUrl = Uri.parse("https://fakestoreapi.com/carts/$id");

    final response = await http.get(cartUrl);

    // print(response.statusCode);
    // print(response.body);

    return jsonDecode(response.body);
  }

  Future userLogin(String username, String password) async {
    final loginUrl = Uri.parse("https://fakestoreapi.com/auth/login");
    final response = await http
        .post(loginUrl, body: {"username": username, "password": password});

    // print(response.statusCode);
    return jsonDecode(response.body);
  }
}
