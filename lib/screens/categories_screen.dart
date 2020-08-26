import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';

import '../dummy_data.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map((Category item) => CategoryItem(
                  item.id,
                  item.title,
                  item.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
