import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/custom_either.dart';

abstract class BaseUseCase<T, Params> {
  CustomEither<T> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}