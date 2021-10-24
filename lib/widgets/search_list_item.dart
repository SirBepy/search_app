import 'package:flutter/material.dart';
import 'package:search_app/models/github_response.dart';
import 'package:search_app/screens/detail_screen.dart';
import 'package:search_app/utils/date_parser.dart';
import 'package:search_app/utils/spacers.dart';

class SearchListItem extends StatelessWidget {
  final GithubResponse response;
  const SearchListItem(this.response, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => DetailScreen(response),
            ),
          ),
          child: Ink(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                border: Border.all(color: Theme.of(context).colorScheme.primary),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Repo name: ${response.name}'),
                  smallSpacer,
                  Text(
                    'Last updated: ${parseDate(response.updatedAt)}',
                  ),
                ],
              ),
            ),
          ),
        ),
        mediumSpacer,
      ],
    );
  }
}
