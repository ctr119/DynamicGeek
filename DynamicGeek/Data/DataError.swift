import Foundation

enum DataError: Error {
    case decoding
    case unknown(description: String)
}
