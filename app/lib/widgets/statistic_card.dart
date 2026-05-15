import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import '../style/theme.dart';

class StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final HeroIcons icon;

  const StatisticCard({super.key, required this.title, required this.value, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.white500,
          borderRadius: BorderRadius.circular(16),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                HeroIcon(icon, size: 20, color: AppTheme.gray500),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.gray500,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppTheme.blue500,
                    fontSize: 48,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.black500,
                      fontWeight: FontWeight.w600,
                      fontSize: 12, //gin adjust ko ang size kay naga overflow huhu
                    ),
            )
          ],
        ),
      ),
    );
  }
}
