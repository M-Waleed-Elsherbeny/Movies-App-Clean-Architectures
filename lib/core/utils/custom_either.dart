

import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/server_exception_handler.dart';

typedef CustomEither<R> = Future<Either<ServerFailure, R>>;