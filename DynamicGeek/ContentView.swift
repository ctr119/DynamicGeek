import SwiftUI
import Kingfisher

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel(pkmnDataSource: PkmnDataSource())
    
    var body: some View {
        VStack {
            ForEach(viewModel.pokemons) { pkmnDTO in
                KFImage.url(URL(string: pkmnDTO.sprites.imageUrl))
                    .padding(10)
                    .onTapGesture {
                        viewModel.startActivity(for: pkmnDTO)
                    }
            }
        }
        .onAppear {
            Task {
                await viewModel.onAppear()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
