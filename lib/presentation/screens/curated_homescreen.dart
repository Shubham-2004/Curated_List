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
  final TextEditingController _search = TextEditingController();
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
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    provider.searchList(text);
                  },
                ),
              ),
              Expanded(
                child: provider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : provider.isError
                        ? Center(
                            child: Text(
                                'Failed to load events. Please try again later.'),
                          )
                        : provider.list.isEmpty
                            ? Center(child: Text('No events found'))
                            : ListView.builder(
                                itemCount: _search.text.isNotEmpty
                                    ? provider.filteredlist.length
                                    : provider.list.length,
                                itemBuilder: (context, index) {
                                  final list = _search.text.isNotEmpty
                                      ? provider.filteredlist[index]
                                      : provider.list[index];

                                  return Listcard(list: list);
                                },
                              ),
              ),
            ],
          );
        },
      ),
    );
  }
}
