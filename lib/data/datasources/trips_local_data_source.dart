import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:webtriplist/data/models/trip_model.dart';

abstract class TripsLocalDataSource {
  Future<List<TripModel>> getLocalTrips();
}

class TripsLocalDataSourceImpl implements TripsLocalDataSource {
  @override
  Future<List<TripModel>> getLocalTrips() async {
    try {
      final jsonStr = await rootBundle.loadString('assets/trips_mock.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonStr);

      if (jsonMap['trips'] == null || jsonMap['trips'] is! List) {
        throw Exception("Invalid JSON structure: 'trips' key not found or not a List");
      }

      final tripsList = (jsonMap['trips'] as List)
          .map((e) {
        try {
          return TripModel.fromJson(Map<String, dynamic>.from(e));
        } catch (err) {
          log('Error parsing trip item: $e \nError: $err');
          return null;
        }
      })
          .where((e) => e != null)
          .cast<TripModel>()
          .toList();

      log('✅ Parsed Trips Count: ${tripsList.length}');
      return tripsList;
    } catch (e, stack) {
      log('❌ Error loading local trips: $e\n$stack');
      throw Exception("Error loading local trips: $e");
    }
  }
}
