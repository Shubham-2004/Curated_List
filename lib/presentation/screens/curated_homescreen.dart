import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curated_list_task/presentation/provider/curated_provider.dart';
import 'package:curated_list_task/components/widget/listcard.dart';

class CuratedHomeScreen extends StatefulWidget {
  CuratedHomeScreen({super.key});

  @override
  State<CuratedHomeScreen> createState() => _CuratedHomeScreenState();
}

class _CuratedHomeScreenState extends State<CuratedHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CuratedProvider>(context, listen: false).fetchEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curated List'),
      ),
      body: Consumer<CuratedProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (provider.isError) {
            return Center(
              child: Text('Failed to load events. Please try again later.'),
            );
          } else if (provider.list.isEmpty) {
            return Center(child: Text('No events found'));
          } else {
            return ListView.builder(
              itemCount: provider.list.length,
              itemBuilder: (context, index) {
                final list = provider.list[index];
                return Listcard(list: list);
              },
            );
          }
        },
      ),
    );
  }
}
