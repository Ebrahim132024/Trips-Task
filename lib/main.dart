import 'package:flutter/material.dart';

import 'package:webtriplist/app_exports.dart';
import 'package:webtriplist/presentation/widgets/custom_header.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home:SafeArea(
        child: const Scaffold(
          backgroundColor: AppColors.background,
          appBar: Header(), // Use the custom responsive header
          body: TripsPage(), // The main content
        ),
      ),
    );
  }
}

