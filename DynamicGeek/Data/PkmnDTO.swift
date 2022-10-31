import Foundation

struct SpritesDTO: Codable {
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "front_default"
    }
}

struct PkmnDTO: Codable {
    let name: String
    let sprites: SpritesDTO
}
