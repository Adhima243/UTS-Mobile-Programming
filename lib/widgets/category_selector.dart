import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onSelect;

  const CategorySelector({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onSelect(categories[index]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: selectedCategory == categories[index]
                    ? Colors.blue
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: selectedCategory == categories[index]
                        ? Colors.white
                        : Colors.blue,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
