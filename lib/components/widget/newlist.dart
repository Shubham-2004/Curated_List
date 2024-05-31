import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curated_list_task/presentation/provider/curated_provider.dart';

class AddListDialog extends StatefulWidget {
  @override
  _AddListDialogState createState() => _AddListDialogState();
}

class _AddListDialogState extends State<AddListDialog> {
  final TextEditingController _newListTitleController = TextEditingController();

  @override
  void dispose() {
    _newListTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New List'),
      content: TextField(
        controller: _newListTitleController,
        decoration: InputDecoration(hintText: 'List Title'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final listTitle = _newListTitleController.text;
            if (listTitle.isNotEmpty) {
              Provider.of<CuratedProvider>(context, listen: false)
                  .addNewList(listTitle);
              _newListTitleController.clear();
              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
