import 'package:flutter/material.dart';
import '../data/destination_data.dart';
import '../widgets/destination_card.dart';
import 'detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteDestinations = destinationList.where((d) => d.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorit'),
      ),
      body: favoriteDestinations.isEmpty
          ? const Center(
              child: Text('Belum ada tempat favorit'),
            )
          : ListView.builder(
              itemCount: favoriteDestinations.length,
              itemBuilder: (context, index) {
                final destination = favoriteDestinations[index];
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
    );
  }
}
