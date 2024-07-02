import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';

class NewsTitle extends StatelessWidget {
  const NewsTitle({super.key,required this.articleModel});

final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
              articleModel.image?? 'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/NYCGCBYE4YSDRHV6JYIJ7VUUB4.JPG&w=1440',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
         articleModel.subTitle ?? '',
          maxLines: 2,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}