import Foundation

protocol NetworkSessionProtocol {
    func execute(url: URL?, completion: @escaping (Result<Data, Error>) -> ())
}

class NetworkManager: NetworkSessionProtocol {

    func execute(url: URL?, completion: @escaping (Result<Data, Error>) -> ()) {
        
        // Check if url is empty
        guard let url = url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        // Get data
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NetworkError.missingData))
            }
        }
        .resume()
    }
}
