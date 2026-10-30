import SwiftUI
import UIKit

/// Creates the NightGram panel for presentation from the host app's settings navigation.
public func makeNightGramPanelController() -> UIViewController {
    return UIHostingController(rootView: NightGramPanel())
}
