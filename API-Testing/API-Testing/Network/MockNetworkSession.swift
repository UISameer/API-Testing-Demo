import Foundation

class MockNetworkSession: NetworkSessionProtocol {
    
    func execute(url: URL?, completion: @escaping (Result<Data, Error>) -> ()) {
        guard url != nil else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        // Mock the data and response here (e.g., create a sample JSON response)
        let mockData = """
                                    {"page": 1,
                                       "per_page": 6,
                                       "total": 12,
                                       "total_pages": 2,
                                       "data": [
                                        {
                                        "id": 1,
                                        "email": "george.bluth@reqres.in",
                                        "first_name": "George",
                                        "last_name": "Bluth",
                                        "avatar": "https://reqres.in/img/faces/1-image.jpg"
                                       }
                                     ]
                                    }
                        """
        if let data = mockData.data(using: .utf8)  {
            completion(.success(data))
        } else {
            let error = NSError(domain: "MockNetworkingServiceErrorDomain", code: -1, userInfo: nil)
            completion(.failure(error))
        }
    }
}
