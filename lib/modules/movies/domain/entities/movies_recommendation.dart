import 'package:equatable/equatable.dart';

class MoviesRecommendationEntities extends Equatable {
  final int id;
  final String backdropPath;

  const MoviesRecommendationEntities({
    required this.id,
    required this.backdropPath,
  });

  @override
  List<Object?> get props => [id, backdropPath];
}
