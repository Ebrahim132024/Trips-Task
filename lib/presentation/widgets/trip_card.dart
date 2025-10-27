import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:webtriplist/app_exports.dart';

/// A single trip card UI component that matches Figma design.
class TripCard extends StatelessWidget {
  final Trip trip;
  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    // Helper to format dates
    String formatDate(DateTime date) => SharedUtils.formatDate(date);
    final nights =
        SharedUtils.calculateNights(trip.startDate, trip.endDate).toString();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Height is flexible, determined solely by the sum of its children's heights
        children: [
          // 1. Image Stack (Responsive Width)
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: trip.coverImage,
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity, // 💡 Horizontal Responsiveness
                  placeholder: (_, __) => Container(color: Colors.grey.shade800),
                  errorWidget: (_, __, ___) => Container(
                    color: Colors.grey.shade700,
                    height: 150,
                    child: const Icon(LucideIcons.imageOff, color: Colors.white),
                  ),
                ),
              ),
              // Status pill & Menu buttons... (Positioned)
              Positioned(
                bottom: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.orange.withOpacity(0.1),
                    border: Border.all(color: AppColors.orange.withOpacity(0.8), width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        trip.status,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        LucideIcons.chevronDown,
                        color: AppColors.textSecondary,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      LucideIcons.ellipsis,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // 2. Card Content (Title & Date)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      LucideIcons.calendar,
                      color: AppColors.textSecondary,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Expanded( // 💡 Horizontal Responsiveness
                      child: Text(
                        "$nights Nights (${formatDate(trip.startDate)} - ${formatDate(trip.endDate)}, ${trip.endDate.year})",
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 3. Separator and Footer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(color: AppColors.border.withOpacity(0.4), height: 1),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Avatars stack
                ParticipantsStack(
                  avatarUrls: trip.participants.map((p) => p.avatarUrl).toList(),
                  maxAvatarsToShow: 3,
                  avatarRadius: 14,
                  overlapAmount: 0.6,
                  borderColor: AppColors.card,
                ),
                const Spacer(),
                Text(
                  "${trip.unfinishedTasks} ${AppStrings.unfinishedTasks}",
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //   Container(
    //   decoration: BoxDecoration(
    //     color: AppColors.card,
    //     borderRadius: BorderRadius.circular(16),
    //     border: Border.all(color: AppColors.border.withOpacity(0.1)),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black.withOpacity(0.2),
    //         offset: const Offset(0, 4),
    //         blurRadius: 8,
    //       ),
    //     ],
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       // Trip cover image with Status pill and Options button overlay
    //       Stack(
    //         children: [
    //           ClipRRect(
    //             borderRadius:
    //                 const BorderRadius.vertical(top: Radius.circular(16)),
    //             child: CachedNetworkImage(
    //               imageUrl: trip.coverImage,
    //               fit: BoxFit.cover,
    //               height: 150, // Fixed height as per design
    //               width: double.infinity,
    //               placeholder: (_, __) => Container(
    //                 color: Colors.grey.shade800,
    //               ),
    //               errorWidget: (_, __, ___) => Container(
    //                 color: Colors.grey.shade700,
    //                 height: 150,
    //                 child:
    //                     const Icon(LucideIcons.imageOff, color: Colors.white),
    //               ),
    //             ),
    //           ),
    //           // Status pill (positioned over the image)
    //           Positioned(
    //             bottom: 12,
    //             left: 12,
    //             child: Container(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 // Use AppColors.secondary or black opacity, border is critical
    //                 color: AppColors.secondary.withOpacity(0.5),
    //                 // Use a subtle orange/yellow border for highlighting
    //                 border: Border.all(
    //                     color: AppColors.primary.withOpacity(0.8), width: 1),
    //               ),
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   Text(
    //                     trip.status,
    //                     style: const TextStyle(
    //                       fontSize: 12,
    //                       color: AppColors.textSecondary,
    //                       fontWeight: FontWeight.w600,
    //                     ),
    //                   ),
    //                   const SizedBox(width: 4),
    //                   // Dropdown Icon on the right
    //                   const Icon(
    //                     LucideIcons.chevronDown,
    //                     color: AppColors.textSecondary,
    //                     size: 16,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           // Options/Menu button (positioned over the image)
    //           Positioned(
    //             top: 12,
    //             right: 12,
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 color: Colors.black.withOpacity(0.4),
    //                 borderRadius: BorderRadius.circular(20),
    //               ),
    //               child: const Padding(
    //                 padding: EdgeInsets.all(4.0),
    //                 child: Icon(
    //                   LucideIcons.ellipsis, // Correct Lucide icon for ellipsis
    //                   color: Colors.white,
    //                   size: 24,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //
    //       // Card content
    //       Padding(
    //         padding: const EdgeInsets.all(12),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             // Trip title
    //             Text(
    //               trip.title,
    //               maxLines: 2,
    //               overflow: TextOverflow.ellipsis,
    //               style: const TextStyle(
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.bold,
    //                 color: AppColors.textPrimary,
    //               ),
    //             ),
    //
    //             const SizedBox(height: 8),
    //
    //             // Trip duration with Calendar icon
    //             Row(
    //               children: [
    //                 const Icon(
    //                   LucideIcons.calendarDays, // Use the simpler calendar icon
    //                   color: AppColors.textSecondary,
    //                   size: 14,
    //                 ),
    //                 const SizedBox(width: 4),
    //                 Expanded(
    //                   child: Text(
    //                     // Corrected format: 5 Nights (Jan 16 - Jan 20, 2024)
    //                     "$nights Nights (${formatDate(trip.startDate)} - ${formatDate(trip.endDate)}, ${trip.endDate.year})",
    //                     style: const TextStyle(
    //                       fontSize: 13, // Restored to a better readable size
    //                       color: AppColors.textSecondary,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //
    //       // Separator and Footer
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 12.0),
    //         child: Divider(color: AppColors.border.withOpacity(0.4), height: 1),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(12),
    //         child: Row(
    //           children: [
    //             // Avatars stack using the corrected ParticipantsStack
    //             ParticipantsStack(
    //               avatarUrls:
    //                   trip.participants.map((p) => p.avatarUrl).toList(),
    //               maxAvatarsToShow: 3,
    //               avatarRadius: 14,
    //               overlapAmount: 0.6,
    //               borderColor: AppColors.card,
    //             ),
    //
    //             const Spacer(),
    //             Text(
    //               "${trip.unfinishedTasks} ${AppStrings.unfinishedTasks}",
    //               style: const TextStyle(
    //                 color: AppColors.textSecondary,
    //                 fontSize: 13, // Restored to a better readable size
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class ParticipantsStack extends StatelessWidget {
  final List<String> avatarUrls;

  final int maxAvatarsToShow;

  final double avatarRadius;

  final double overlapAmount;

  final Color borderColor;

  final Color plusCountBackgroundColor;

  final TextStyle plusCountTextStyle;

  const ParticipantsStack({
    super.key,
    required this.avatarUrls,
    this.maxAvatarsToShow = 3,
    this.avatarRadius = 14,
    this.overlapAmount = 0.6, // 60% overlap

    this.borderColor = AppColors.card,
    this.plusCountBackgroundColor = const Color(0xFF333333),
    this.plusCountTextStyle = const TextStyle(
      color: AppColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final int totalParticipants = avatarUrls.length;

    final int avatarsToDisplay = totalParticipants.clamp(0, maxAvatarsToShow);

    final int remainingCount = totalParticipants - avatarsToDisplay;

// ----- Calculations for positioning -----

    final double avatarWidth = 2 * avatarRadius;

    final double shiftPerAvatar = avatarWidth * (1 - overlapAmount);

// Calculate the left position for the last displayed avatar's edge

    final double lastAvatarEdgePosition =
        (avatarsToDisplay - 1) * shiftPerAvatar;

// The total width of the stack (without the count box)

    final double stackWidth =
        avatarsToDisplay * shiftPerAvatar + (avatarWidth * overlapAmount);

// ----------------------------------------

// Build the list of Positioned children

    final List<Widget> children = List.generate(avatarsToDisplay, (index) {
      return Positioned(
        left: index * shiftPerAvatar,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 2),
          ),
          child: CircleAvatar(
            radius: avatarRadius,
            backgroundImage: CachedNetworkImageProvider(avatarUrls[index]),
            backgroundColor: AppColors.background,
          ),
        ),
      );
    });

// Add the "+X" count box only if there are remaining participants

    if (remainingCount > 0) {
      children.add(
        Positioned(
// Position the box slightly offset from the center of the last avatar

          left: lastAvatarEdgePosition +
              avatarRadius * 0.7, // Adjust 0.8 to fine-tune placement

          top: avatarRadius *
              0.7, // Slightly offset from the top for visual appeal

          child: Text(
            "+$remainingCount",

            style: const TextStyle(
              color: AppColors.yellow, // Orange text color
              fontSize: 10, // Match the size of the surrounding text
              fontWeight: FontWeight.w600,
            ), // Smaller text for overlay
          ),
        ),
      );
    }

// Determine the width of the entire component for the SizedBox

    double finalWidth = stackWidth;

    if (remainingCount > 0) {
// Add approximated space for the overlay box to ensure nothing is clipped

      finalWidth = finalWidth + avatarRadius; // Increased to cover the overlay
    }

// Use a single SizedBox to contain the Stack

    return SizedBox(
      height: avatarWidth,
      width: finalWidth,
      child: Stack(
        clipBehavior: Clip.none, // Essential for showing full overlap

        children: children,
      ),
    );
  }
}
