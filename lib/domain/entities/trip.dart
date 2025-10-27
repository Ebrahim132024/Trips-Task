import 'package:equatable/equatable.dart';

/// Core domain entity representing a Trip.
/// Immutable and independent of any data source or framework.
class Trip extends Equatable {
  final String id;
  final String title;
  final String status;
  final DateTime startDate;
  final DateTime endDate;
  final List<Participant> participants;
  final int unfinishedTasks;
  final String coverImage;

  const Trip({
    required this.id,
    required this.title,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.participants,
    required this.unfinishedTasks,
    required this.coverImage,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    status,
    startDate,
    endDate,
    participants,
    unfinishedTasks,
    coverImage,
  ];
}

/// Represents a participant of a trip.
class Participant extends Equatable {
  final String name;
  final String avatarUrl;

  const Participant({
    required this.name,
    required this.avatarUrl,
  });

  @override
  List<Object?> get props => [name, avatarUrl];
}
