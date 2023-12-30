
import 'package:flutter_pagination_example/src/common/types/hero_types.dart';

abstract class DisneyDatasource{
  Future<DisneyListEither> getDisneyList(int limit, int offset);
}