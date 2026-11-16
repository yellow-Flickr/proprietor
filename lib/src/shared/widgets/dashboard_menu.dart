import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Square icon tile with a caption, used for the quick-action menus on each
/// dashboard tab.
class DashboardMenu extends StatelessWidget {
  const DashboardMenu({
    super.key,
    required this.label,
    this.onTap,
    required this.icon,
  });

  final String label;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 8.h,
              width: 8.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.primaryColor,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    icon,
                    color: theme.scaffoldBackgroundColor,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelSmall?.copyWith(fontSize: 1.2.h),
          ),
        ],
      ),
    );
  }
}
