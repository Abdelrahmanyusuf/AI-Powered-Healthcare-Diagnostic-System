import 'package:flutter/material.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/features/home/domain/entites/health_scan_category_entity.dart';
import 'package:tamenny_app/generated/l10n.dart';

import 'health_scan_categories_header_widget.dart';
import 'health_scan_item_widget.dart';

class HealthScanCategoriesWidget extends StatelessWidget {
  const HealthScanCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<HealthScanCategoryEntity> categories = [
      HealthScanCategoryEntity(
        title: S.of(context).heart,
        image: Assets.imagesHeartIcon,
      ),
      HealthScanCategoryEntity(
        title: S.of(context).lungCancer,
        image: Assets.imagesLungsIcon,
      ),
      HealthScanCategoryEntity(
        title: S.of(context).brainCancer,
        image: Assets.imagesBrainIcon,
      ),
      HealthScanCategoryEntity(
        title: S.of(context).kneeOa,
        image: Assets.imagesBoneIcon,
      ),
    ];

    return Column(
      children: [
        const HealthScanCategoriesHeaderWidget(),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: List.generate(
            categories.length,
            (index) => Expanded(
              child: HealthScanItemWidget(
                healthScanCategoryEntity: categories[index],
                selectedWidgetIndex: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
