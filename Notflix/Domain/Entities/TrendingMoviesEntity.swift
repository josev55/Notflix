//
//  TrendingMoviesEntity.swift
//  Notflix
//
//  Created by Jose Vildosola on 20-06-22.
//

struct TrendingMoviesEntity {
    let trendingMovies: [TrendingMovieEntity]
}

struct TrendingMovieEntity {
    let movieId: String
    let movieTitle: String
    let movieImage: String
    let movieRating: String
}
