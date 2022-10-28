import Foundation
import ActivityKit

enum Mood: Codable {
    case happy
    case sad
    
    var toString: String {
        switch self {
        case .happy:
            return "happy"
        case .sad:
            return "sad"
        }
    }
}

struct GeekAttributes: ActivityAttributes {
    public typealias GeekState = ContentState
    
    public struct ContentState: Codable, Hashable {
        var mood: Mood
        var pnjDescription: String
    }
    
    var pnjName: String
}
