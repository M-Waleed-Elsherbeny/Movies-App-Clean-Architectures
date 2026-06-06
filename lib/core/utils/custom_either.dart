

import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_entities.dart';

typedef CustomEither<L> = Future<Either<L, List<MoviesEntities>>>;