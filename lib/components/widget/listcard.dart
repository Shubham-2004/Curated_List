import 'package:flutter/material.dart';
import 'package:curated_list_task/domain/models/curated_list_models.dart';

class Listcard extends StatelessWidget {
  final Datum list;

  const Listcard({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                list.title ?? 'No list Title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
