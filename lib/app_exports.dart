// lib/app_exports.dart

// 📦 Flutter & Dart Core
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'dart:convert';

// 🌍 Third-party Packages

export 'package:get_it/get_it.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:equatable/equatable.dart';
export 'package:freezed_annotation/freezed_annotation.dart';

export 'package:provider/provider.dart';

// 🧠 Core & Utils
export 'core/di/injection_container.dart';
export 'core/error/failures.dart';
export 'core/utils/app_colors.dart';
export 'core/utils/app_theme.dart';
export 'core/utils/app_strings.dart';
export 'core/utils/app_images.dart';
export 'core/utils/responsive.dart';
export 'core/utils/shared_utils.dart';

// 💾 Data
export 'data/models/trip_model.dart';
export 'data/datasources/trips_local_data_source.dart';
export 'data/repositories/trips_repository_impl.dart';

// 🧭 Domain
export 'domain/entities/trip.dart';
export 'domain/repositories/trips_repository.dart';
export 'domain/usecases/get_trips.dart';

// 🎨 Presentation
export 'presentation/viewmodels/trips_viewmodel.dart';
export 'presentation/pages/trips_page.dart';
export 'presentation/widgets/trip_card.dart';
