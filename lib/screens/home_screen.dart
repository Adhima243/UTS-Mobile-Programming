import 'package:flutter/material.dart';
import '../models/destination.dart'; // tambahkan import ini
import '../data/destination_data.dart';
import '../widgets/destination_card.dart';
import '../widgets/top_rated_card.dart';
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

  List<Destination> _getTopRatedDestinations() {
    var sortedList = List<Destination>.from(destinationList);
    sortedList.sort((a, b) => b.rating.compareTo(a.rating));
    return sortedList.where((d) => d.rating >= 4.9).toList();
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CategorySelector(
                categories: categories,
                selectedCategory: _selectedCategory,
                onSelect: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Destinasi Terbaik',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _getTopRatedDestinations().map((destination) {
                          return Container(
                            width: 280,
                            margin: const EdgeInsets.only(left: 16),
                            child: TopRatedCard(
                              destination: destination,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(destination: destination),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Semua Destinasi',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
