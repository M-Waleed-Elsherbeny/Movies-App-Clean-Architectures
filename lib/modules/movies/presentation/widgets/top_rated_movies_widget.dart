import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/enums/request_state.dart';
import 'package:movies_app/core/server/api_constance.dart';
import 'package:movies_app/modules/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controller/bloc/movies_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopRatedMoviesWidget extends StatelessWidget {
  const TopRatedMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRatedMovies != current.topRatedMovies,
      builder: (context, state) {
        log("TopRatedMoviesWidget builder");
        return Skeletonizer(
          enabled:
              state.movieStatus == RequestState.loading || state.topRatedMovies.isEmpty,
          child: FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.topRatedMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.topRatedMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
