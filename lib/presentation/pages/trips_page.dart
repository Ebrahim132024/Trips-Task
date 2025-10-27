import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:webtriplist/app_exports.dart';

/// Main screen that displays the list of trips content (below the header).
class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = sl<TripsViewModel>();
    final isDesktop = MediaQuery.sizeOf(context).width > 600;

    return ChangeNotifierProvider.value(
      value: viewModel..loadTrips(),
      child: Consumer<TripsViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (vm.error != null) {
            return Center(
              child: Text(
                vm.error!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          if (vm.trips.isEmpty) {
            return const Center(
              child: Text(
                AppStrings.noData,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
              ),
            );
          }

          // Use a Center and ConstrainedBox for the web view to control max width
          final content = Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1280, // Max width for content on large screens
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Action Buttons Row
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        isDesktop ? 0 : 20, 24, isDesktop ? 0 : 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.tripsTitle, // 'Items'
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: isDesktop ? 30 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            // Filter/Settings Icon Button
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.card,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: AppColors.border.withOpacity(0.3)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                icon: const Icon(LucideIcons.slidersHorizontal,
                                    color: AppColors.textPrimary),
                                onPressed: () {},
                              ),
                            ),
                            if(isDesktop)...[
                              const SizedBox(width: 12),
                              Container(
                                width: 1,
                                height: 24,
                                color: AppColors.border,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                              ),
                              const SizedBox(width: 12),
                              // Add New Item Button
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(LucideIcons.plus, color: AppColors.card,size: 16,),
                                label: const Text('Add a New Item'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.yellow,
                                  foregroundColor: AppColors.card,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]

                          ],
                        ),
                      ],
                    ),
                  ),

                  // Trips Grid
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: vm.refreshTrips,
                      backgroundColor: AppColors.primary,
                      color: Colors.white,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final width = constraints.maxWidth;

                          // 🔸 Determine how many cards fit per row (max 400 width each)
                          final crossAxisCount =
                          (width / 400).floor().clamp(1, 5); // 1 → 5 columns max

                          return GridView.builder(
                            padding: EdgeInsets.fromLTRB(
                                isDesktop ? 0 : 20, 0, isDesktop ? 0 : 20, 20),
                            itemCount: vm.trips.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,

                              mainAxisExtent: 300,
                              childAspectRatio: 0.85, // same height for all
                            ),
                            itemBuilder: (context, index) {
                              return SizedBox.expand(
                                child: TripCard(trip: vm.trips[index]),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );

          // For the main Scaffold, we wrap the content
          return content;
        },
      ),
    );
  }
}