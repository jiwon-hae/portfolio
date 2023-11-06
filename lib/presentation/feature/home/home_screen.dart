import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/presentation/feature/home/home_state.dart';
import 'package:portfolio/presentation/feature/home/widgets/portfolio_selector.dart';

import '../../common/gaps.dart';
import '../../model/ui_portfolio_entry.dart';
import 'home_cubit.dart';
import 'widgets/portfolio_picker_item.dart';

typedef UiConst = HomeScreenUiConst;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FixedExtentScrollController portfolioSpinnerController =
      FixedExtentScrollController();
  int currentPortfolioIndex = 0;

  Widget body(HomeState state) {
    return Padding(
        padding: const EdgeInsets.only(right: 100),
        child: Stack(children: <Widget>[
          portfolioSelector(state.portfolioEntries),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  title(),
                  Gaps.vertical(20),
                  portfolioSpinner(state.portfolioEntries)
                ],
              ))
        ]));
  }

  Widget title() {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Text('My\nPortfolio', style: textTheme.headlineLarge);
  }

  Widget portfolioSelector(List<UiPortfolioEntry> entries) {
    return OverflowBox(
        minWidth: 0,
        minHeight: 0,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        alignment: Alignment.topLeft,
        child: PortfolioSelector(
            portfolioEntries: entries, onAngleChanged: onPortfolioItemChanged));
  }

  Widget portfolioSpinner(List<UiPortfolioEntry> entries) {
    return SizedBox(
        width: UiConst.portfolioSpinnerWidth,
        height: UiConst.portfolioSpinnerHeight,
        child: CupertinoPicker.builder(
            itemExtent: UiConst.portfolioSpinnerItemHeight,
            childCount: entries.length,
            scrollController: portfolioSpinnerController,
            onSelectedItemChanged: (int index) {},
            itemBuilder: (BuildContext context, int index) {
              return PortfolioPickerItem(label: entries[index].name);
            }));
  }

  void onPortfolioItemChanged(int portfolioIndex) {
    setState(() {
      currentPortfolioIndex = portfolioIndex;
      portfolioSpinnerController.animateToItem(portfolioIndex,
          duration: const Duration(milliseconds: 10), curve: Curves.decelerate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    return BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
      return Scaffold(backgroundColor: scheme.background, body: body(state));
    });
  }
}

mixin HomeScreenUiConst {
  static double portfolioSpinnerWidth = 200;
  static double portfolioSpinnerHeight = 100;

  static double portfolioSpinnerItemHeight = 50;
}
