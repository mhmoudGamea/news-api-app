import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:provider/provider.dart';

import '../providers/data_provider.dart';
import '../widgets/article_content_widget.dart';

class BusinessScreen extends StatelessWidget{
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context).getBusiness;
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
      child: data.isEmpty ? const Center(child: CircularProgressIndicator(color: primaryColor,),) : ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: data['articles'].length,
        itemBuilder: (context, index) => ArticleContentWidget(article: data['articles'][index]),
      ),
    );
  }
}
