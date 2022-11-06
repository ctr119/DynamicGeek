import Foundation
import ActivityKit

struct GeekAttributes: ActivityAttributes {
    public typealias GeekState = ContentState
    
    public struct ContentState: Codable, Hashable {
        var pokemonName: String
        var pokemonImageData: Data
    }
    
    var pokemonMasterName: String
}
