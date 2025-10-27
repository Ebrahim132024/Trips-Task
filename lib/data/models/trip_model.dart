import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webtriplist/domain/entities/trip.dart';
import 'package:intl/intl.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

@freezed
class TripModel with _$TripModel {
  const factory TripModel({
    @Default('') String id,
    @Default('') String title,
    @Default('') String status,
    @JsonKey(name: 'cover_image') @Default('') String coverImage,
    @Default({}) Map<String, String> dates,
    @Default([]) List<Map<String, String>> participants,
    @JsonKey(name: 'unfinished_tasks') @Default(0) int unfinishedTasks,
  }) = _TripModel;

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);
}
extension TripModelMapper on TripModel {
  Trip toEntity() {


    /// Safely parses a string into a DateTime object.
    /// Returns the parsed DateTime if successful, or a specified fallback value otherwise.


    /// Safely parses a date string in the common "DD-MM-YYYY" format.
    /// Falls back to DateTime.now() if parsing fails or input is invalid.
    DateTime safeParse(String? dateStr) {
      final fallback = DateTime.now();

      if (dateStr == null || dateStr.isEmpty) {
        // log('safeParse received a null or empty date string. Returning fallback.', name: 'safeParse');
        return fallback;
      }

      // 1. Define the expected custom format: Day (dd), Month (MM), Year (yyyy) separated by hyphens.
      const customFormat = 'dd-MM-yyyy';

      try {
        // 2. Use DateFormat from the 'intl' package to parse the non-standard format.
        final DateFormat formatter = DateFormat(customFormat);

        // set_locale_name_to_avoid_runtime_errors is necessary for strict parsing behavior
        return formatter.parseStrict(dateStr);

      } on FormatException catch (e) {
        // This catches the specific error for non-matching formats (e.g., if it's "2024-01-20" instead of "20-01-2024")
        log('safeParse failed to parse: "$dateStr" with format "$customFormat". Error: $e. Returning fallback.', name: 'safeParse');

        // As a secondary fallback, try the standard ISO 8601 format (YYYY-MM-DD)
        final standardParse = DateTime.tryParse(dateStr);
        if (standardParse != null) {
          log('safeParse successfully parsed "$dateStr" as ISO 8601.', name: 'safeParse');
          return standardParse;
        }

        return fallback;
      } catch (e) {
        // Catch any other unexpected error
        log('safeParse encountered an unexpected error for "$dateStr". Error: $e. Returning fallback.', name: 'safeParse');
        return fallback;
      }
    }

    return Trip(
      id: id,
      title: title,
      status: status,
      startDate: safeParse(dates['start']),
      endDate: safeParse(dates['end']),
      participants: participants
          .map((p) => Participant(
        name: p['name'] ?? '',
        avatarUrl: p['avatar_url'] ?? '',
      ))
          .toList(),
      unfinishedTasks: unfinishedTasks,
      coverImage: coverImage,
    );
  }
}
