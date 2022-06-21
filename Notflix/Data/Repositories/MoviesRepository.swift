//
//  MoviesRepository.swift
//  Notflix
//
//  Created by Jose Vildosola on 20-06-22.
//

final class MoviesRepository {
    private let serviceClient: ServiceClient
    
    init(serviceClient: ServiceClient) {
        self.serviceClient = serviceClient
    }
}

enum DomainError: Error {
    case mappingError
    case networkError
}

extension MoviesRepository: MoviesRepositoryProtocol {
    func getTrendingMovies() async throws -> TrendingMoviesDTO {
        let serviceResponse: ServiceStatus<TrendingMoviesDTO> = try await serviceClient.request(with: TMDBAPIEndpoints.trendingMoviesEndpoint())
        switch serviceResponse {
            case .success(let data):
            guard let data = data else { throw DomainError.mappingError }
            return data
            case .failure:
            throw DomainError.networkError
        }
    }
}
