import 'package:equatable/equatable.dart';

abstract class HeroEvent extends Equatable{
  @override
  List<Object> get props =>[];
}

class HeroFetched extends HeroEvent{
  final int page;
  final int pageSize;

  HeroFetched({this.page = 1, this.pageSize = 20});
}

class NextPage extends HeroEvent{}