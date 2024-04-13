import 'package:favourite_places_app/Screen/places_add.dart';
import 'package:favourite_places_app/provider/user_places.dart';
import 'package:favourite_places_app/widget/places_list.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:favourite_places_app/widget/places_list.dart';
import 'package:favourite_places_app/Screen/places_add.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    File? _selectedImage;

    final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const PlacesAdd(/**/),
                ),
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Placeslist(places: userPlaces),
      ),
    );
  }
}
