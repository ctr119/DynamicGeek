import SwiftUI
import WidgetKit

struct ExpandedBottomView: View {
    var body: some View {
        Button {
            // Action
        } label: {
            Label {
                Text("Throw Pokeball!")
                    .font(.callout)
                    .fontWeight(.bold)
                    .fontDesign(.monospaced)
            } icon: {
                Image(systemName: "arrowtriangle.right")
            }
            .tint(.white)
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
}

struct ExpandedBottomView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedBottomView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
