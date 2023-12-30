import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_example/src/common/domain/disney_char.dart' as disney;
import 'package:flutter_pagination_example/src/common/domain/hero.dart';

import '../data/network/network_errors/network_errors.dart';

typedef HeroListEither = Either<NetworkError,List<Hero>>;
typedef DisneyListEither = Either<NetworkError,List<disney.DisneyData>>;