import Foundation
import ActivityKit

// DOCU
// https://betterprogramming.pub/explore-the-dynamic-island-activitykit-tutorial-a7b8e3f9e234
// https://developer.apple.com/documentation/activitykit
// https://developer.apple.com/documentation/activitykit/displaying-live-data-with-live-activities

class ContentViewModel {
    private var activity: Activity<GeekAttributes>?
    
    func displayPnj() {
        let attr = GeekAttributes(pnjName: "Mario")
        let initialState = GeekAttributes.GeekState(mood: .happy, pnjDescription: "Our beloved plumber <3")
        
        do {
            activity = try Activity<GeekAttributes>.request(attributes: attr, contentState: initialState)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func updateState() async {
        await activity?.update(using: GeekAttributes.GeekState(mood: .sad, pnjDescription: "Sad Mario..."))
    }
    
    func stop() async {
        await activity?.end()
    }
}
