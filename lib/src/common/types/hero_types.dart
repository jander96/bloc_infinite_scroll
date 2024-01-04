import 'package:dartz/dartz.dart';
import 'package:network/network.dart';

typedef HeroListEither = Either<NetworkError,List<Hero>>;
typedef DisneyListEither = Either<NetworkError,List<DisneyData>>;