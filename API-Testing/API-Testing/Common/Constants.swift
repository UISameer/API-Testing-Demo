import Foundation

enum NetworkError: Error {
    case invalidURL
    case missingData
}

struct APIConstants {
    static let url = "https://reqres.in/api/users?page=1"
}
