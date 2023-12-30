import 'package:flutter_pagination_example/src/common/types/hero_types.dart';

abstract class DisneyRepository{
  Future<DisneyListEither> getChars(int limit, int offset);
}