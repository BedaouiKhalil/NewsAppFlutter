import 'package:flutter/material.dart';
import 'package:newsapp/widgets/categories_list_view.dart';
import 'package:newsapp/widgets/news_list_views.dart';
import 'package:newsapp/widgets/news_title.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black),
              ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.orange),
              ),
          ],
        ),
       ),
       body: const Padding(
         padding: EdgeInsets.symmetric(horizontal: 16),
         child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CategoriesListView()),
            SliverToBoxAdapter(
              child: SizedBox(
                height:32,
              ),
            ),
            NewsListView(),
          ],
         ),
       ),
    );
  }
}

