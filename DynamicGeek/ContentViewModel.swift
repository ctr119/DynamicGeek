import Foundation
import ActivityKit
import Kingfisher

// DOCU
// https://betterprogramming.pub/explore-the-dynamic-island-activitykit-tutorial-a7b8e3f9e234
// https://developer.apple.com/documentation/activitykit
// https://developer.apple.com/documentation/activitykit/displaying-live-data-with-live-activities

class ContentViewModel: ObservableObject {
    @Published var pokemons: [PkmnDTO] = []
    
    private let pokemonNames = ["bulbasaur", "charmander", "squirtle", "pikachu"]
    private let pkmnDataSource: PkmnDataSource
    
    private var activity: Activity<GeekAttributes>?
    
    init(pkmnDataSource: PkmnDataSource) {
        self.pkmnDataSource = pkmnDataSource
    }
    
    func onAppear() async {
        do {
            let pokemons = try await withThrowingTaskGroup(of: PkmnDTO.self) { taskGroup in
                for name in pokemonNames {
                    taskGroup.addTask {
                        try await self.pkmnDataSource.getPokemon(name: name)
                    }
                }
                return try await taskGroup.reduce(into: [PkmnDTO](), { $0.append($1) })
            }
            
            DispatchQueue.main.async {
                self.pokemons = pokemons
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func startActivity(for pokemon: PkmnDTO) {
        guard let url = URL(string: pokemon.sprites.imageUrl) else { return }
        
        Task {
            do {
                if activity != nil {
                    await activity?.end(dismissalPolicy: .immediate)
                }
                
                let data = try await URLSession.shared.data(from: url).0
                
                let attributes = GeekAttributes(pokemonMasterName: "Ash Ketchup")
                let initialState = GeekAttributes.GeekState(pokemonName: pokemon.name,
                                                            pokemonImageData: data)
                
                // There is no need to start an activity from a Task.
                // This is only for the use case of downloading the image for getting its Data representation for the Widget.
                activity = try Activity<GeekAttributes>.request(attributes: attributes, contentState: initialState)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    /*
    func displayPnj() {
        let attr = GeekAttributes(pnjName: "Mario")
        // NOTE: A huge picture, makes the request to fail
        let initialState = GeekAttributes.GeekState(mood: .happy, pnjDescription: "Our beloved plumber <3")
        
        do {
            activity = try Activity<GeekAttributes>.request(attributes: attr, contentState: initialState)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func updateState() async {
        // NOTE: A huge picture, makes the request to fail
        await activity?.update(using: GeekAttributes.GeekState(mood: .sad, pnjDescription: "Sad Mario..."))
    }
    
    func stop() async {
        await activity?.end()
    }
    */
}
