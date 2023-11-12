import 'package:flutter/material.dart';

import '../../../assets/images.dart';
import '../../../model/ui_portfolio_entry.dart';

typedef UiConst = GalleryItemUiConst;

class GalleryItem extends StatelessWidget {
  const GalleryItem({super.key, required this.entry});

  final UiPortfolioEntry entry;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);

    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return Column(
      children: [
        Text(entry.name,
            style: textTheme.entryTitleStyle(colorScheme.onBackground)),
        SizedBox(
            width: screenSize.width * 0.2,
            child: AspectRatio(
                aspectRatio: UiConst._galleryItemSizeRatio,
                child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius:
                            const BorderRadius.all(UiConst._borderRadius),
                        color: colorScheme.primary),
                    child: Image.asset(AssetImages.dummyImage,
                        fit: BoxFit.cover))))
      ],
    );
  }
}

mixin GalleryItemUiConst {
  static const double _galleryItemSizeRatio = 3 / 4;

  static const Radius _borderRadius = Radius.circular(10);
}

extension on TextTheme {
  TextStyle? entryTitleStyle(Color color) => headlineSmall?.apply(color: color);
}
