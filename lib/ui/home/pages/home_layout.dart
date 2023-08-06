import 'package:flutter/material.dart';
import 'package:gamex/ui/home/widgets/category_widget/categories_widget.dart';
import 'package:gamex/ui/home/widgets/header_title/header_title.dart';
import 'package:gamex/ui/widgets/container_body.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(),
          SizedBox(height: 40.0),
          ContainerBody(
            children: [
              CategoriesWidget(),
              // GamesByCategoryWidget(),
              // AllGamesWidget(title: 'All games'),
            ],
          )
        ],
      ),
    );
  }
}
