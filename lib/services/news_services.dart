import 'package:dio/dio.dart';
import 'package:newsapp/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

   Future<List<ArticleModel>> getNews() async {
     var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=3c88955c487e4d9db668f011dd85e737');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'],
          title: article['title'],
          subTitle: article['description'],
        );
        articlesList.add(articleModel);
      }

       return articlesList;
  }

}