import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/domain/entity/portfolio_type.dart';
import 'package:portfolio/presentation/feature/home/home_state.dart';
import 'package:portfolio/presentation/model/ui_portfolio_entry.dart';

abstract class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.getDefault());

  void init();
}

@Injectable(as: HomeCubit)
class HomeCubitImpl extends HomeCubit {
  @override
  void init() {
    emit(state.onEntriesLoaded(entries: [
      const UiPortfolioEntry(name: 'portfolio1', portfolioType: PortfolioType.ai),
      const UiPortfolioEntry(name: 'portfolio2', portfolioType: PortfolioType.ai),
      const UiPortfolioEntry(name: 'portfolio3', portfolioType: PortfolioType.ai)
    ]));
  }
}
