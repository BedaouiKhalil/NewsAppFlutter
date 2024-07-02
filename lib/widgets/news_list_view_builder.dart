import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/services/news_services.dart';
import 'package:newsapp/widgets/news_list_views.dart';

class NewListViewBuilder extends StatefulWidget {
  const NewListViewBuilder({
    super.key,
  });

  @override
  State<NewListViewBuilder> createState() => _NewListViewBuilderState();
}

class _NewListViewBuilderState extends State<NewListViewBuilder> {
  List<ArticleModel> articles = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsService(Dio()).getNews();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
        :articles.isNotEmpty ? NewsListView(
            articles: articles,
          ) : const SliverToBoxAdapter(
            child: Text('oops !!!!!!!')
          ) ; 
  }
}
