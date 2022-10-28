import ActivityKit
import WidgetKit
import SwiftUI

struct PnjCardLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GeekAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hi it's me! \(context.attributes.pnjName)!")
            }
            .activitySystemActionForegroundColor(Color.black) // Auxiliar text by swiping
            .activityBackgroundTint(Color.cyan)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text(context.attributes.pnjName)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.attributes.pnjName)
                }
                DynamicIslandExpandedRegion(.center) {
                    Image("\(context.attributes.pnjName)-\(context.state.mood.toString)")
                        .resizable()
                        .frame(width: 50, height: 60)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text(context.state.pnjDescription)
                }
            } compactLeading: {
                Label {
                    Text(context.attributes.pnjName)
                } icon: {
                    Image(systemName: "bag")
                }
            } compactTrailing: {
                Text("*")
            } minimal: {
                Text("-")
            }
            .keylineTint(.cyan) // compact and minimal - does not work
        }
    }
}
