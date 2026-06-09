import 'package:movies_app/modules/movies/domain/entities/movies_recommendation.dart';

class MoviesRecommendationModel extends MoviesRecommendationEntities {
  const MoviesRecommendationModel({
    required super.id,
    required super.backdropPath,
  });

  factory MoviesRecommendationModel.fromJson(Map<String, dynamic> json) => MoviesRecommendationModel(
    id: json["id"],
    backdropPath: json["backdrop_path"]
  );
}
