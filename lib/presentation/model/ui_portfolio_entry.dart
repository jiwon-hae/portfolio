import '../../domain/entity/portfolio_type.dart';

class UiPortfolioEntry {
  const UiPortfolioEntry({required this.name, required this.portfolioType});

  final String name;
  final PortfolioType portfolioType;
}