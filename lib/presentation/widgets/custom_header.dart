import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:webtriplist/app_exports.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String selected; // ✅ لمعرفة العنصر المحدد

  const Header({super.key, this.selected = 'Items'});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.sizeOf(context).width > 600;

    if (isDesktop) {
      return Stack(
        children: [
          // 🔹 الهيدر نفسه
          Container(
            height: preferredSize.height,
            color: AppColors.card,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                Image.asset(AppImages.logo),
                const Spacer(),

                // 🔹 روابط التنقل
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _NavLink(title: 'Items', isSelected: selected == 'Items'),
                    _NavLink(title: 'Pricing', isSelected: selected == 'Pricing'),
                    _NavLink(title: 'Info', isSelected: selected == 'Info'),
                    _NavLink(title: 'Tasks', isSelected: selected == 'Tasks'),
                    _NavLink(title: 'Analytics', isSelected: selected == 'Analytics'),
                  ],
                ),

                // 🔹 فاصل
                Container(
                  width: 1,
                  height: 24,
                  color: AppColors.border,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),

                // 🔹 أيقونات وملف شخصي
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(LucideIcons.settings),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(LucideIcons.bell),
                      onPressed: () {},
                    ),
                    Container(
                      width: 1,
                      height: 24,
                      color: AppColors.border,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/profile_placeholder.jpg'),
                    ),
                    const SizedBox(width: 8),
                    const Text('John Doe', style: TextStyle(color: AppColors.textPrimary)),
                    const SizedBox(width: 4),
                    const Icon(LucideIcons.chevronDown, color: AppColors.textPrimary,size: 16,),
                  ],
                ),
              ],
            ),
          ),

          // 🔹 الخط السفلي عند العنصر المحدد
          Positioned(
            bottom: 0,
            right: _getUnderlineOffset(selected),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 1,
              width: 50,
              color: AppColors.yellow,
            ),
          ),
        ],
      );
    } else {
      // 🔹 نسخة الموبايل
      return Container(
        height: preferredSize.height,
        color: AppColors.card,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SafeArea(
          child: Row(
            children: [
              IconButton(
                icon: const Icon(LucideIcons.menu, color: AppColors.textPrimary),
                onPressed: () {},
              ),

              Image.asset(AppImages.logo),
              const Spacer(),
              IconButton(
                icon: const Icon(LucideIcons.settings),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(LucideIcons.bell),
                onPressed: () {},
              ),
              Container(
                width: 1,
                height: 24,
                color: AppColors.border,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/profile_placeholder.jpg'),
              ),
            ],
          ),
        ),
      );
    }
  }


  double _getUnderlineOffset(String selected) {
    switch (selected) {
      case 'Items':
        return 538;
      case 'Pricing':
        return 160;
      case 'Info':
        return 260;
      case 'Tasks':
        return 340;
      case 'Analytics':
        return 440;
      default:
        return 60; // Items
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

// 🔹 روابط القائمة بدون خط
class _NavLink extends StatelessWidget {
  final String title;
  final bool isSelected;

  const _NavLink({required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: isSelected ? AppColors.yellow : AppColors.textSecondary,
      fontWeight: FontWeight.w400,
    );

    // لقياس عرض النص عشان نعمل underline بنفس العرض بالضبط
    final textPainter = TextPainter(
      text: TextSpan(text: title, style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout();

    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Stack(
           // mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: textStyle),
            // if (isSelected)
            //
            //   Align(
            //     alignment: Alignment.bottomCenter,
            //     child: FractionalTranslation(
            //       translation: const Offset(0, 0.45), // نزوله تحت آخر البار
            //       child: Container(
            //         height: 2,
            //         width: textPainter.width,
            //         color: AppColors.yellow,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

