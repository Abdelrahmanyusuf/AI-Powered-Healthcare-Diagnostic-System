import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/features/home/domain/entites/health_scan_category_entity.dart';
import 'package:tamenny_app/features/scan/domain/entites/scan_details_entity.dart';
import 'package:tamenny_app/generated/l10n.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_styles.dart';

class HealthScanItemWidget extends StatelessWidget {
  const HealthScanItemWidget({
    super.key,
    required this.healthScanCategoryEntity,
    required this.selectedWidgetIndex,
  });
  final HealthScanCategoryEntity healthScanCategoryEntity;
  final int selectedWidgetIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    List<ScanDetailsEntity> scansDetails = [
      ScanDetailsEntity(
        analysisTitle: S.of(context).scan_heart_title,
        analysisType: 'heart',
        analysisGuidanceMessages: S.of(context).scan_heart_message,
      ),
      ScanDetailsEntity(
        analysisTitle: S.of(context).scan_lung_title,
        analysisType: 'lung',
        analysisGuidanceMessages: S.of(context).scan_lung_message,
      ),
      ScanDetailsEntity(
        analysisTitle: S.of(context).scan_brain_title,
        analysisType: 'brain',
        analysisGuidanceMessages: S.of(context).scan_brain_message,
      ),
      ScanDetailsEntity(
          analysisGuidanceMessages: S.of(context).scan_knee_message,
          analysisTitle: S.of(context).scan_knee_title,
          analysisType: 'knee'),
    ];

    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          Routes.scanView,
          arguments: scansDetails[selectedWidgetIndex],
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: isDark ? theme.cardColor : const Color(0xffF4F8FF),
            child: SvgPicture.asset(
              healthScanCategoryEntity.image,
              color: isDark ? Colors.white : null,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            healthScanCategoryEntity.title,
            style: AppStyles.font12Regular.copyWith(
              color: theme.textTheme.bodyMedium?.color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
