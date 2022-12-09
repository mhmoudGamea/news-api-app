import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/webView/my_web_view.dart';

import '../constants.dart';

class ArticleContentWidget extends StatelessWidget {
  final Map<String, dynamic> article;

  const ArticleContentWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = article['urlToImage'];
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyWebView(url: article['url'])));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: image == null ? Colors.grey[200]: null
              ),
              child: image == null
                  ? const Center(
                      child: Text(
                        'No Image',
                        style: TextStyle(color: secondaryColor),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 2),
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Text(
                        '${article['source']['name']}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(DateTime.parse(article['publishedAt'])),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
