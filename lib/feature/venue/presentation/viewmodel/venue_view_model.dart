import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';
import 'package:venue_look/feature/venue/domain/use_case/venue_use_case.dart';
import 'package:venue_look/feature/venue/presentation/state/venue_state.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';

final venueViewModelProvider =
    StateNotifierProvider<VenueViewModel, VenueState>(
  (ref) => VenueViewModel(ref.watch(venueUsecaseProvider)),
);

class VenueViewModel extends StateNotifier<VenueState> {
  final VenueUseCase venueUseCase;

  VenueViewModel(this.venueUseCase) : super(VenueState.initial()) {
    venues();
  }

//getallvenues
  venues() async {
    state = state.copyWith(isLoading: true);
    var data = await venueUseCase.venues();
    state = state.copyWith(venues: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, venues: r, error: null),
    );
  }

  //getvenuebyid

  getVenueById(BuildContext context, String venueId) async {
    state = state.copyWith(isLoading: true);
    var data = await venueUseCase.getAllVenuesById(venueId);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) {
        state = state.copyWith(isLoading: false, singleVenue: r, error: null);
        Navigator.pushNamed(context, AppRoute.venueDetailRoute);
      },
    );
  }

//add venue
  addVenue(VenueEntity venue, BuildContext context) async {
    state.copyWith(isLoading: true);

    var data = await venueUseCase.addVenue(venue);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showSnackBar(
          message: 'Error: ${l.error}',
          context: context,
          color: Colors.red,
        );
      },
      (r) {
        // add new venue in the state as well
        state.venues.add(venue);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'New venue added successfully',
          context: context,
        );
      },
    );
  }


  Future<void> uploadImage(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await venueUseCase.uploadVenuePicture(file!);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (imageName) {
        state =
            state.copyWith(isLoading: false, error: null, imageName: imageName);
      },
    );
  }


  //delete venue
  Future<void> deleteVenue(BuildContext context, VenueEntity venue) async {
    state.copyWith(isLoading: true);
    var data = await venueUseCase.deleteVenue(venue.venueId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.venues.remove(venue);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'venue delete successfully',
          context: context,
        );
      },
    );
  }

  //update venue

  Future<void> updateVenue(String venueId, VenueEntity venue) async {
    state = state.copyWith(isLoading: true);

    var data = await venueUseCase.updateVenue(venueId, venue);

    data.fold((l) => state = state.copyWith(isLoading: false, error: l.error),
        (r) {
      // remove from the list
      state.venues.removeWhere((venue) => venue.venueId == venueId);
      // append the updated venue in the list
      state.venues.add(venue);
      // off the loading
      state = state.copyWith(isLoading: false, error: null);
    });
  }

}
