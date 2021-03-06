import 'dart:async';

import 'package:flutter/material.dart';
import 'package:search_app/api/api_service.dart';
import 'package:search_app/models/github_response.dart';
import 'package:search_app/utils/spacers.dart';
import 'package:search_app/widgets/search_list_item.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<GithubResponse> response = [];
  StreamSubscription<dynamic>? updateSubscription;
  Timer? _debounce;

  void _handleFieldOnChange(String value) async {
    _debounce?.cancel();
    updateSubscription?.cancel();

    if (value.isEmpty) return setState(() => response = []);

    _debounce = Timer(const Duration(milliseconds: 400), () {
      updateSubscription = ApiService.fetchRepos(value).asStream().listen((List<GithubResponse>? res) {
        if (res == null) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Too many requests, please try again later'),
            duration: Duration(seconds: 2),
          ));
          setState(() => response = []);
        } else {
          res.sort((a, b) => DateTime.parse(b.updatedAt).compareTo(DateTime.parse(a.updatedAt)));
          setState(() => response = res);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Hero(
            tag: 'search_app',
            child: Text(
              'Search App',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        leadingWidth: 200,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.headline3,
              ),
              smallSpacer,
              Text(
                'What would you like to search for?',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              mediumSpacer,
              TextField(
                onChanged: _handleFieldOnChange,
                decoration: InputDecoration(
                  labelText: 'Search',
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
                    borderRadius: mediumRadius,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
                    borderRadius: mediumRadius,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
                    borderRadius: mediumRadius,
                  ),
                ),
              ),
              mediumSpacer,
              if (response.isNotEmpty) ...[
                Text(
                  'Results:',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                mediumSpacer,
                Expanded(
                  child: ListView.builder(
                    itemCount: response.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchListItem(response[index]);
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
