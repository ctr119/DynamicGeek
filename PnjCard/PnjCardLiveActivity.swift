import ActivityKit
import WidgetKit
import SwiftUI
import UIKit

struct PnjCardLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GeekAttributes.self) { context in
            // Lock screen/banner UI goes here
            HStack {
                Text("You have walked 1 km, yay!\nA new Pókemon appeared!")
                    .lineLimit(2)
                    .font(.subheadline)
                    .fontDesign(.monospaced)
                
                Spacer()
                
                pokemonMaster
                    .frame(width: 70, height: 70)
            }
            .activitySystemActionForegroundColor(Color.black) // Auxiliar text by swiping
            // TODO: Introduce Pokemon Colour Edition
            .activityBackgroundTint(Color.cyan) // TODO: Change the color based on the Pokemon Edition you select
            .padding()
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading, priority: 1) {
                    ExpandedLeadingView(model: .init(pokemonName: context.state.pokemonName,
                                                     pokemonImageData: context.state.pokemonImageData))
                    .dynamicIsland(verticalPlacement: .belowIfTooWide)
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    ExpandedTrailingView()
                }
                
                DynamicIslandExpandedRegion(.center) {
                    
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    ExpandedBottomView()
                }
            } compactLeading: {
                pokemonMaster
            } compactTrailing: {
                pokeballImage
            } minimal: {
                pokeballImage
            }
            .keylineTint(.cyan) // compact and minimal - does not work
        }
    }
    
    private func getPokemonImage(context: ActivityViewContext<GeekAttributes>) -> some View {
        let size: CGFloat = 85
        
        return Image(uiImage: UIImage(data: context.state.pokemonImageData) ?? UIImage())
            .resizable()
            .frame(width: size, height: size)
    }
    
    private var pokeballImage: some View {
        Image("pokeball")
            .resizable()
            .frame(width: 25, height: 25)
    }
    
    private var pokemonMaster: some View {
        Image("pokemonMaster")
            .resizable()
            .frame(width: 28, height: 28)
    }
}
