import Foundation
import Alamofire

// DOCU: https://pokeapi.co/

struct PkmnDataSource {
    enum Endpoint {
        case pokemonDetails(name: String)

        var url: String {
            let host = "https://pokeapi.co"
            let apiVersion = "/api/v2"
            let baseUrl = host + apiVersion
            
            return baseUrl + self.path
        }
        
        private var path: String {
            switch self {
            case .pokemonDetails(let name):
                return "/pokemon/" + name
            }
        }
    }
    
    func getPokemon(name: String) async throws -> PkmnDTO {
        let urlString = Endpoint.pokemonDetails(name: name).url
        let result = await AF.request(urlString)
            .validate()
            .serializingData()
            .result
        
        switch result {
        case .success(let data):
            do {
                return try JSONDecoder().decode(PkmnDTO.self, from: data)
            } catch {
                throw DataError.decoding
            }
            
        case .failure(let error):
            throw DataError.unknown(description: error.localizedDescription)
        }
    }
}
