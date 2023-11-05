import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/presentation/feature/home/home_state.dart';
import 'package:portfolio/presentation/feature/home/widgets/portfolio_selector.dart';

import '../../model/ui_portfolio_entry.dart';
import 'home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget body(HomeState state) {
    return Padding(
       padding: EdgeInsets.only(right : 100),
        child: Stack(children: <Widget>[
      selector(state.portfolioEntries),
      Align(alignment: AlignmentDirectional.bottomEnd, child: title())
    ]));
  }

  Widget title() {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [Text('My\nPortfolio', style: textTheme.headlineLarge)],
    );
  }

  Widget selector(List<UiPortfolioEntry> entries) {
    return OverflowBox(
        minWidth: 0,
        minHeight: 0,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        alignment: Alignment.topLeft,
        child: PortfolioSelector(portfolioEntries: entries));
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
