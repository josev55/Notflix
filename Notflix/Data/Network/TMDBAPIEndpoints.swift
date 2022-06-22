//
//  TMDBAPIEndpoints.swift
//  Notflix
//
//  Created by Jose Vildosola on 20-06-22.
//

import Foundation

private let API_KEY_PARAM_KEY = "api_key"

final class TMDBAPIEndpoints {
    static func trendingMoviesEndpoint() -> Endpoint {
        return Endpoint(path: "/trending/movie/week", queryParameters: [API_KEY_PARAM_KEY: SharedConfig.instance.apiKey])
    }
    
    static func movieDetailsEndpoint(movieId: String) -> Endpoint {
        return Endpoint(path: String(format: "/movie/%@", movieId), queryParameters: [API_KEY_PARAM_KEY: SharedConfig.instance.apiKey])
    }
}
