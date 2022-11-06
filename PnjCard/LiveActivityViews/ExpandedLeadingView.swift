import SwiftUI
import ActivityKit
import WidgetKit

struct ExpandedLeadingView: View {
    struct Model {
        let pokemonName: String
        let pokemonImageData: Data
    }
    
    let model: Model
    
    var body: some View {
        HStack {
            getPokemonImage(data: model.pokemonImageData)
                
            VStack(alignment: .leading, spacing: 10) {
                Text("\(model.pokemonName.capitalized)\nappeared!")
                    .font(.subheadline)
                
                Text("Lvl 5")
                    .font(.caption)
            }
            .fontDesign(.monospaced)
        }
    }
    
    private func getPokemonImage(data: Data) -> some View {
        let size: CGFloat = 85
        let uiImage = UIImage(data: data) ?? UIImage()
        
        return Image(uiImage: uiImage)
            .resizable()
            .frame(width: size, height: size)
            .background(.gray) // TODO: change the color based on the predominant one from the image
    }
}

struct ExpandedLeadingView_Previews: PreviewProvider {
    static var modelMock: ExpandedLeadingView.Model {
        let data = UIImage(named: "pokeball")!.pngData()!
        
        return .init(pokemonName: "Pikachu", pokemonImageData: data)
    }
    
    static var previews: some View {
        ExpandedLeadingView(model: Self.modelMock)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
