import Foundation

public enum NetworkError: Error {
    case error(statusCode: Int, data: Data? = nil)
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
}

public enum ServiceStatus<T> {
    case success(_ data: T?)
    case failure(_ error: NetworkError)
}

protocol ServiceClient {

    typealias CompletionHandler<T> = (ServiceStatus<T>) -> Void
    
    func request<T: Decodable>(with endpoint: Endpoint) async throws -> ServiceStatus<T>
}

class DefaultServiceClient: ServiceClient {
    
    private let config: NetworkConfigurable
    
    public init(config: NetworkConfigurable) {
        self.config = config
    }
    
    func request<T>(with endpoint: Endpoint) async -> ServiceStatus<T> where T : Decodable {
        do {
            let (data, response) = try await URLSession.shared.data(for: endpoint.asUrlRequest(with: config))
            if let httpResponse = response as? HTTPURLResponse, let httpStatus = HTTPStatus(rawValue: httpResponse.statusCode),
               httpStatus.httpStatusType == .serverError || httpStatus.httpStatusType == .clientError {
                return .failure(.error(statusCode: httpResponse.statusCode))
            } else {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let responseDTO = try decoder.decode(T.self, from: data)
                return .success(responseDTO)
            }
        } catch {
            return .failure(self.resolve(error: error))
        }
    }
    
    @discardableResult
    func request<T: Decodable>(with endpoint: Endpoint, completion: @escaping CompletionHandler<T>) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: endpoint.asUrlRequest(with: config)) { (data, response, error) in
            if let requestError = error {
                var error: NetworkError
                if let response = response as? HTTPURLResponse {
                    error = .error(statusCode: response.statusCode, data: data)
                } else {
                    error = self.resolve(error: requestError)
                }
                completion(.failure(error))
            } else {
                do {
                    let model = try JSONDecoder().decode(T.self, from: data!)
                    completion(.success(model))
                } catch {
                    print(error)
                }
                
            }
        }
        task.resume()
        return task
    }
    
    private func resolve(error: Error) -> NetworkError {
        let code = URLError.Code(rawValue: (error as NSError).code)
        switch code {
        case .notConnectedToInternet: return .notConnected
        case .cancelled: return .cancelled
        default: return .generic(error)
        }
    }
}
