import 'package:equatable/equatable.dart';
import 'package:bloc_scroll_paging/bloc_scroll_paging.dart';
import 'package:network/network.dart';


final class HeroViewState extends AsyncPagedState<DisneyData,NetworkError> with EquatableMixin{
  @override
  final AsyncValue<List<DisneyData>> asyncValue;
  @override
  final  PagingStatus pagingStatus;

  HeroViewState({
    this.asyncValue = const AsyncInitial(),
    this.pagingStatus = PagingStatus.idle
  });


  @override
  List<Object?> get props => [asyncValue, pagingStatus];

  @override
  HeroViewState copyWith({
    AsyncValue<List<DisneyData>>? asyncValue,
    PagingStatus? pagingStatus
  }) => HeroViewState(
    asyncValue: asyncValue?? this.asyncValue,
    pagingStatus: pagingStatus ?? this.pagingStatus
  );


}