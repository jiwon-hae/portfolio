import 'package:equatable/equatable.dart';

import '../../model/ui_portfolio_entry.dart';

class HomeState extends Equatable {
  const HomeState({required this.portfolioEntries});

  factory HomeState.getDefault() {
    return const HomeState(portfolioEntries: <UiPortfolioEntry>[]);
  }

  HomeState onEntriesLoaded({required List<UiPortfolioEntry> entries}) {
    return copyWith(portfolioEntries: entries);
  }

  HomeState copyWith({List<UiPortfolioEntry>? portfolioEntries}) {
    return HomeState(
        portfolioEntries: portfolioEntries ?? this.portfolioEntries);
  }

  final List<UiPortfolioEntry> portfolioEntries;

  @override
  List<Object?> get props => <Object?>[portfolioEntries];
}
