//
//  MovieDetailsDTO.swift
//  Notflix
//
//  Created by Jose Vildosola on 21-06-22.
//

struct MovieDetailsDTO: Decodable {
    let backdropPath: String
    let homepage: String
    let overview: String
    let title: String
    let tagline: String
}
