import 'package:curated_list_task/presentation/screens/curated_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curated_list_task/presentation/provider/curated_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CuratedProvider(),
      child: MaterialApp(
        title: 'Curated List Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CuratedHomeScreen(),
      ),
    );
  }
}
