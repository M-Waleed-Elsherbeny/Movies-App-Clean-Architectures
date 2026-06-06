import 'package:flutter/material.dart';
import 'package:movies_app/core/networking/api_services.dart';
import 'package:movies_app/modules/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/modules/movies/data/repository/movies_remote_repository.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_now_playing_movies_usecas.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  initState() {
    super.initState();
    _getMovies();
  }
  void _getMovies() async {
    BaseMoviesRemoteDatasource baseMoviesRemoteDatasource = MoviesRemoteDatasource(apiService: ApiServices()) ;
    BaseMoviesRepository  baseMoviesRepository = MoviesRemoteRepository(baseMoviesRemoteDatasource: baseMoviesRemoteDatasource); ;
    await GetNowPlayingMoviesUsecase(baseMoviesRepository).execute();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
  
}