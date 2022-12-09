import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../widgets/article_content_widget.dart';
import '../providers/data_provider.dart';

class SportsScreen extends StatelessWidget{
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context).getSports;
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: data['articles'].length,
        itemBuilder: (context, index) => ArticleContentWidget(article: data['articles'][index]),
      ),
    );
  }
}