import 'package:equatable/equatable.dart';
import 'package:flutter_pagination_example/src/common/domain/disney_char.dart';
import 'package:flutter_pagination_example/src/common/domain/hero.dart';

import '../../../../common/data/network/network_errors/network_errors.dart';
import 'package:bloc_scroll_paging/bloc_scroll_paging.dart';


final class HeroViewState extends AsyncPagedState<DisneyData,NetworkError> with EquatableMixin{
  @override
  final AsyncViewState asyncViewState;
  @override
  final PagingStatus  pagingStatus;
  @override
  final List<DisneyData> paginatedList;
  @override
  final NetworkError? asyncError;

  HeroViewState({
    this.asyncViewState = AsyncViewState.idle ,
    this.pagingStatus = PagingStatus.idle,
    this.paginatedList = const [],
    this.asyncError
  });

  @override
  List<Object?> get props => [ asyncViewState, pagingStatus, paginatedList,asyncError];



  @override
  HeroViewState copyWith({
    AsyncViewState? asyncViewState,
    PagingStatus? pagingStatus,
    List<DisneyData>? paginatedList,
    NetworkError? asyncError,
  }) => HeroViewState(
    asyncViewState: asyncViewState ?? this.asyncViewState,
    pagingStatus: pagingStatus ?? this.pagingStatus,
    paginatedList: paginatedList ?? this.paginatedList,
    asyncError: asyncError
  );


}