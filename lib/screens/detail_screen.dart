import 'package:flutter/material.dart';
import 'package:search_app/models/github_response.dart';
import 'package:search_app/utils/date_parser.dart';
import 'package:search_app/utils/spacers.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.response, {Key? key}) : super(key: key);

  final GithubResponse response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ],
                ),
                largeSpacer,
                Text(
                  response.name,
                  style: Theme.of(context).textTheme.headline3,
                ),
                smallSpacer,
                Row(
                  children: [
                    Text(
                      parseDate(response.updatedAt),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                largeSpacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Owner',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        smallSpacer,
                        Text(
                          response.ownerName ?? '',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    if (response.imageUrl != null && response.imageUrl != '')
                      Container(
                        width: 100,
                        height: 100,
                        padding: const EdgeInsets.only(right: 32.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(response.imageUrl!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                  ],
                ),
                largeSpacer,
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                ),
                largeSpacer,
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.headline6,
                ),
                smallSpacer,
                Text(
                  response.description ?? '',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
