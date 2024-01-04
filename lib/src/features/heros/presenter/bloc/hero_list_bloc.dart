
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_example/src/features/heros/domain/repository/disney_repository.dart';
import 'package:flutter_pagination_example/src/features/heros/presenter/bloc/hero_list_event.dart';
import 'package:flutter_pagination_example/src/features/heros/presenter/bloc/hero_list_view_state.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_scroll_paging/bloc_scroll_paging.dart';
import 'package:network/network.dart';

const throttleDuration = Duration(milliseconds: 100);

@injectable
class HeroBloc extends Bloc<HeroEvent, HeroViewState>
    with BlocPager<DisneyData,NetworkError, HeroEvent, HeroViewState>{
  final DisneyRepository repository;

  HeroBloc(this.repository) : super(HeroViewState()) {
    on<HeroFetched>((event, emit) {
      return pager(
          event: event,
          emit: emit,
          useCase: repository.getChars,
          pageSize: event.pageSize,
          page: event.page);
    }, transformer: pagerTransformerDrop(throttleDuration));
  }
}
