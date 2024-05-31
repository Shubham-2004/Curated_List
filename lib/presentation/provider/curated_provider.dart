import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:curated_list_task/domain/models/curated_list_models.dart';

class CuratedProvider with ChangeNotifier {
  List<Datum> list = [];
  List<Datum> filteredlist = [];
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
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final CuratedList curatedList = curatedListFromJson(response.body);
        list = curatedList.data ?? [];
        filteredlist = list;
        isLoading = false;
        notifyListeners();
      } else {
        isError = true;
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isError = true;
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addNewList(String listTitle) async {
    const String baseUrl = 'https://allevents.in/api/index.php';
    const String endPoint = '/users/lists/update';
    final Uri url = Uri.parse(baseUrl + endPoint);

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'email': 'shubhambera100@gmail.com',
      'user_id': '11820070',
      'title': listTitle,
      'ae_token': '778c5b5f84b9d8d48d60da22a5ad0593',
      'list_id': '0',
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        fetchEvents(); // Refresh the list after adding a new list
      } else {
        isError = true;
        notifyListeners();
      }
    } catch (e) {
      isError = true;
      notifyListeners();
    }
  }

  void searchList(String searchTerm) {
    if (searchTerm.isEmpty) {
      filteredlist = list;
    } else {
      filteredlist = list
          .where((list) =>
              list.title?.toLowerCase().contains(searchTerm.toLowerCase()) ??
              false)
          .toList();
    }
    notifyListeners();
  }
}
