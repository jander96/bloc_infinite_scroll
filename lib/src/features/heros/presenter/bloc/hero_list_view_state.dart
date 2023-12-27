import 'package:equatable/equatable.dart';
import 'package:flutter_pagination_example/src/common/data/network/network_errors/network_errors.dart';
import 'package:flutter_pagination_example/src/common/domain/hero.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// @freezed
// class HeroViewState with _$HeroViewState {
//   const factory HeroViewState({
//     @Default(ListState.idle)  ListState listState,
//     @Default(<Hero>[])  List<Hero> heroList,
//     @Default(null)  NetworkError? error,
//     @Default(1)  int page,
//   }) = _HeroViewState;
// }

enum ListState {
  idle,
  loading,
  error,
  success,
}

enum HeroStatus{
  initial,success, failure
}

final class HeroViewState extends Equatable{
  const HeroViewState({
    this.status = HeroStatus.initial,
    this.heros = const <Hero>[],
    this.hasReachedMax = false,
});

final HeroStatus status;
final List<Hero> heros;
final bool hasReachedMax;

  HeroViewState copyWith({
    HeroStatus? status,
    List<Hero>? heros,
    bool? hasReachedMax,
  }) {
    return HeroViewState(
      status: status ?? this.status,
      heros: heros ?? this.heros,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
  @override
  String toString() {
    return '''HeroViewState { status: $status, hasReachedMax: $hasReachedMax, heros: ${heros.length} }''';
  }

  @override
  List<Object> get props => [status, heros, hasReachedMax];
}