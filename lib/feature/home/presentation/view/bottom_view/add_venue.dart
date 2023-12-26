import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../venue/domain/entity/venue_entity.dart';
import '../../../../venue/presentation/viewmodel/venue_view_model.dart';

class AddVenue extends ConsumerStatefulWidget {
  const AddVenue({super.key});

  @override
  ConsumerState<AddVenue> createState() => _AddVenueState();
}

class _AddVenueState extends ConsumerState<AddVenue> {
  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;
  Future _browseImage(WidgetRef ref, ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
          ref.read(venueViewModelProvider.notifier).uploadImage(_img);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  final _gap = const SizedBox(height: 8);
  final _formKey = GlobalKey<FormState>();

  final venueNameController = TextEditingController();
  final establishedController = TextEditingController();
  final locationController = TextEditingController();
  final advancePaymentController = TextEditingController();
  final venueTypeController = TextEditingController();
  final spacePreferenceController = TextEditingController();
  final venueHallCapacityController = TextEditingController();
  final contactNumberController = TextEditingController();
  final perPlateController = TextEditingController();
  // final pictureController = TextEditingController();

  void _addVenue() {
    var smth = ref.read(venueViewModelProvider).imageName;

    print(smth);

    VenueEntity newVenue = VenueEntity(
        venueName: venueNameController.text.trim(),
        established: establishedController.text.trim(),
        location: locationController.text.trim(),
        advancePayment: advancePaymentController.text.trim(),
        venueType: venueTypeController.text.trim(),
        spacePreference: spacePreferenceController.text.trim(),
        venueHallCapacity: venueHallCapacityController.text.trim(),
        contactNumber: contactNumberController.text.trim(),
        perPlate: perPlateController.text.trim(),
        picture: ref.read(venueViewModelProvider).imageName ?? '');

    ref.read(venueViewModelProvider.notifier).addVenue(newVenue, context);
  }

  @override
  void dispose() {
    venueNameController.dispose();
    establishedController.dispose();
    locationController.dispose();
    advancePaymentController.dispose();
    venueTypeController.dispose();
    spacePreferenceController.dispose();
    venueHallCapacityController.dispose();
    contactNumberController.dispose();
    perPlateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add venue"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.grey[300],
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                _browseImage(ref, ImageSource.camera);
                                Navigator.pop(context);
                                // Upload image it is not null
                              },
                              icon: const Icon(Icons.camera),
                              label: const Text('Camera'),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                _browseImage(ref, ImageSource.gallery);
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.image),
                              label: const Text('Gallery'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 200,
                    width: 400,
                    child: _img != null
                        ? Image(
                            image: FileImage(_img!),
                            fit: BoxFit.cover,
                          )
                        : Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/naulo.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ),
                _gap,
                TextFormField(
                  controller: venueNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Venue name',
                    // labelText: "Enter Venue name"
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter venue name';
                    }
                    return null;
                  },
                ),
                _gap,
                TextFormField(
                  controller: establishedController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'enter establish date',
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter establish date';
                    }
                    return null;
                  },
                ),
                _gap,
                TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter location of venue',
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter location of venue';
                    }
                    return null;
                  },
                ),
                _gap,
                TextFormField(
                  controller: advancePaymentController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter advance payment',
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter advance payment';
                    }
                    return null;
                  },
                ),
                _gap,
                TextFormField(
                  controller: spacePreferenceController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter space preferences',
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter space preferences';
                    }
                    return null;
                  },
                ),
                _gap,
                TextFormField(
                  controller: venueTypeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter venue type',
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter venue type';
                    }
                    return null;
                  },
                ),
                _gap,
                TextFormField(
                  controller: venueHallCapacityController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter venue hall capacity',
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter venue hall capacity';
                    }
                    return null;
                  },
                ),
                _gap,
                TextFormField(
                  controller: contactNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter contact number',
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please phone number';
                    }
                    return null;
                  },
                ),
                _gap,
                TextFormField(
                  controller: perPlateController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter per plate rate',
                  ),
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please per plate rate ';
                    }
                    return null;
                  },
                ),
                _gap,
                const SizedBox(height: 30),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 250, height: 64),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addVenue();
                      }
                    },
                    child: const Text("Add Venue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
