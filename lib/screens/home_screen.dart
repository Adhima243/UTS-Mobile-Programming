import 'package:flutter/material.dart';
import '../data/destination_data.dart';
import '../widgets/destination_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_selector.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Semua';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    var filteredDestinations = destinationList.where((destination) {
      final matchesSearch = destination.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'Semua' || destination.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            CustomSearchBar(
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
            CategorySelector(
              categories: categories,
              selectedCategory: _selectedCategory,
              onSelect: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: filteredDestinations.length,
                itemBuilder: (context, index) {
                  final destination = filteredDestinations[index];
                  return DestinationCard(
                    destination: destination,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(destination: destination),
                        ),
                      );
                    },
                    onFavoritePressed: () {
                      setState(() {
                        destination.isFavorite = !destination.isFavorite;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
