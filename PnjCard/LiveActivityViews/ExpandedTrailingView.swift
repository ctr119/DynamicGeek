import SwiftUI
import WidgetKit

struct ExpandedTrailingView: View {
    var body: some View {
            VStack {
                Image("pokeball")
                    .resizable()
                    .frame(width: 25, height: 25)
                
                Text("5 Pokeballs")
                    .font(.caption)
                    .fontDesign(.monospaced)
            }
            .frame(maxHeight: .infinity)
            .padding(.top, 15)
    }
}

struct ExpandedTrailingView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedTrailingView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
