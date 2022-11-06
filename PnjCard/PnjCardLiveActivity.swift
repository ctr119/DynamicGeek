import ActivityKit
import WidgetKit
import SwiftUI
import UIKit

struct PnjCardLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GeekAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("You got a new Pókemon waiting for you! <3")
            }
            .activitySystemActionForegroundColor(Color.black) // Auxiliar text by swiping
            .activityBackgroundTint(Color.cyan)
            .padding()
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    ExpandedLeadingView(model: .init(pokemonName: context.state.pokemonName,
                                                     pokemonImageData: context.state.pokemonImageData))
                    .dynamicIsland(verticalPlacement: .belowIfTooWide)
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    
                }
                
                DynamicIslandExpandedRegion(.center) {
                    
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    
                }
            } compactLeading: {
                Image("pokemonMaster")
                    .resizable()
                    .frame(width: 28, height: 28)
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
}
