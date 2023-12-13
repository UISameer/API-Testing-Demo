import Foundation

class DataManager {
    
    private let session: NetworkSessionProtocol
    
    init(session: NetworkSessionProtocol) {
        self.session = session
    }
    
    func fetchData(url: URL?, completion: @escaping (Result<Response, Error>) -> ()) {
        session.execute(url: url) { result in
            switch result {
            case .success(let data):
                let result = Result(catching: {
                    try JSONDecoder().decode(Response.self, from: data)
                })
                completion(result)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
