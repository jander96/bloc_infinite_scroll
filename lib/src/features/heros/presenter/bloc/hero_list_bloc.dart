import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_example/src/features/heros/domain/repository/hero_repository.dart';
import 'package:flutter_pagination_example/src/features/heros/presenter/bloc/hero_list_event.dart';
import 'package:flutter_pagination_example/src/features/heros/presenter/bloc/hero_list_view_state.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart' as stream_transform;
import 'package:bloc_concurrency/bloc_concurrency.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration){
  return(events,mapper){
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class HeroBloc extends Bloc<HeroEvent,HeroViewState>{
  final HeroRepository repository;
  HeroBloc(this.repository) : super(const HeroViewState()){
   on<HeroFetched>(_loadList,transformer:  throttleDroppable(throttleDuration));
  }

  Future<void> _loadList(HeroFetched event, Emitter<HeroViewState> emit) async {

    if(state.hasReachedMax) return;
    if(state.status == HeroStatus.initial){
      final response = await repository.getHeroList(event.pageSize,event.page);

      response.fold((error) {
        return emit(state.copyWith(status: HeroStatus.failure));
      }, (data) {
        return emit(state.copyWith(
          heros: data,
          status: HeroStatus.success,
          hasReachedMax: false,
        ));
      });
    }
    final response = await repository.getHeroList(event.pageSize,event.page);
    response.fold((error) {
      return emit(state.copyWith(status: HeroStatus.failure));
    }, (data) {
      return emit((data.isEmpty || data.length < event.pageSize)
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              heros: List.of(state.heros)..addAll(data),
              status: HeroStatus.success,
              hasReachedMax: false,
            ));
    });
  }

}