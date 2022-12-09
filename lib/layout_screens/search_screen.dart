import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/widgets/text_form_widget.dart';
import 'package:provider/provider.dart';

import '../providers/data_provider.dart';
import '../widgets/article_content_widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? searchedWord;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Iconsax.arrow_left_2,
                      size: 24,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            TextFormWidget(searchFunction: (value){
              setState(() {
                searchedWord = value;
              });
            }),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: searchedWord == null ? const Center(child: Text('Please Search', style: TextStyle(fontSize: 18, color: primaryColor),)) : Consumer<DataProvider>(
                  builder: (context, data, ch) {
                    // print('---------------------------------');
                    // print(data.getSearch);
                    // print(data.getSearch.length);
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: data.getSearch['articles'].length,
                      itemBuilder: (context, index) => ArticleContentWidget(article: data.getSearch['articles'][index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
