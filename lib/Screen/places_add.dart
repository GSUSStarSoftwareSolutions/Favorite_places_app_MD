import 'package:favourite_places_app/provider/user_places.dart';
import 'package:favourite_places_app/widget/imageinput.dart';
import 'package:favourite_places_app/widget/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:favourite_places_app/provider/user_places.dart';

class PlacesAdd extends ConsumerStatefulWidget {
  const PlacesAdd({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  ConsumerState<PlacesAdd> createState() => _PlacesAddState();
}

class _PlacesAddState extends ConsumerState<PlacesAdd> {
  var _titleController = TextEditingController();

  File? _selectedImage;

  void _savePlace() {
    final enteredText = _titleController.text;

    if (enteredText.isEmpty) {
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredText, _selectedImage!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Places'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            SizedBox(
              height: 18,
            ), //ddfad
            ImageInput(onPickImage: (image) {
              _selectedImage = image;
            }),
            SizedBox(
              height: 10,
            ),
            LocationInput(),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text('Add'))
          ],
        ),
      ),
    );
  }
}
