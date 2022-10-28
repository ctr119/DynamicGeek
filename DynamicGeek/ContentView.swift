import SwiftUI

struct ContentView: View {
    private let viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Button("Happy") {
                viewModel.displayPnj()
            }
            
            Button("Sad") {
                Task {
                    await viewModel.updateState()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
