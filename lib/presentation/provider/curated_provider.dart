import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:curated_list_task/domain/models/curated_list_models.dart';

class CuratedProvider with ChangeNotifier {
  List<Datum> list = [];
  bool isLoading = true;
  bool isError = false;

  Future<void> fetchEvents() async {
    isLoading = true;
    isError = false;
    notifyListeners();

    const String baseUrl = 'https://allevents.in/api/index.php';
    const String endPoint = '/users/lists/get_list';
    final Uri url = Uri.parse(baseUrl + endPoint);

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'email': 'shubhambera100@gmail.com',
      'user_id': '11820070',
    };

    try {
      print('Making request to: $url');
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final CuratedList curatedList = curatedListFromJson(response.body);
        list = curatedList.data ?? [];
        isLoading = false;
        notifyListeners();
      } else {
        debugPrint('Failed to load list. Status code: ${response.statusCode}');
        isError = true;
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error during API call: $e');
      isError = true;
      isLoading = false;
      notifyListeners();
    }
  }
}
