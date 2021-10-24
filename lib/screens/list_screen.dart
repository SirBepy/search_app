import 'package:flutter/material.dart';
import 'package:search_app/utils/spacers.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<dynamic> response = [];

  void _handleFieldOnChange(String value) async {
    if (value.isEmpty) {
      response = [];
    } else {
      print(value);
    }
    setState(() {});
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
                onChanged: (value) => _handleFieldOnChange(value),
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
                      return Container(); // TODO: Implement list item widget
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
