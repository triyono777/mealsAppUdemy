import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
//  final String categoryId;
//  final String categoryTitle;
//  CategoryMealsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    final categoryTitle = routeArgument['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('The Recipes for The Category'),
      ),
    );
  }
}
