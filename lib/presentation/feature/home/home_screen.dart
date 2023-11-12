import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/presentation/common/widgets/util.dart';
import 'package:portfolio/presentation/feature/home/home_state.dart';
import 'package:portfolio/presentation/feature/home/widget/gallery_item.dart';
import '../../../domain/entity/portfolio_type.dart';
import '../../common/widgets/radial_listview/radial_listview.dart';
import '../../model/ui_portfolio_entry.dart';
import 'home_cubit.dart';

typedef UiConst = HomeScreenUiConst;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget body(HomeState state) {
    final Size screenSize = MediaQuery.of(context).size;
    return Stack(children: [
      Positioned(
          top: screenSize.height * 0.5,
          left: screenSize.width / 2 - screenSize.width * 0.9 / 2,
          width: screenSize.width * 0.9,
          height: screenSize.width * 0.9,
          child: portfolioGallery()),
      Align(
          alignment: AlignmentDirectional.topCenter,
          child: title()
              .paddingWith(EdgeInsets.only(top: screenSize.height * 0.2)))
    ]);
  }

  Widget title() {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: 'PORTFOLIO',
            style: textTheme.titleStyle(colorScheme.onBackground)),
        if (projectSelected != null)
          TextSpan(
              text: ' #$projectSelected',
              style: textTheme.titleStyle(Colors.black)),
        TextSpan(
            text: '\nwith AI',
            style: textTheme.titleStyle(colorScheme.primary)),
      ]),
    );
  }

  int? projectSelected;

  Widget portfolioGallery() {
    return RadialListView(
        items: List.generate(
            40,
            (index) => UiPortfolioEntry(
                name: 'portfolio_#$index',
                portfolioType: PortfolioType.flutter)),
        onItemSelected: (int index) {
          setState(() {
            projectSelected = index;
          });
        },
        itemBuilder: (BuildContext context, UiPortfolioEntry item) =>
            GalleryItem(entry: item));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
      return Scaffold(
          backgroundColor: colorScheme.background, body: body(state));
    });
  }
}

mixin HomeScreenUiConst {
  static double portfolioSpinnerItemHeight = 50;
}

extension on TextTheme {
  TextStyle? titleStyle(Color color) => displayLarge?.apply(color: color);
}
