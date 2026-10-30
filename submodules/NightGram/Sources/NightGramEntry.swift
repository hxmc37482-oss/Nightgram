import SwiftUI
import UIKit
import Display
import AsyncDisplayKit

/// A Telegram-native controller that hosts the NightGram SwiftUI panel.
private final class NightGramPanelController: ViewController {
    private var hostingController: UIHostingController<NightGramPanel>?

    init() {
        super.init(navigationBarPresentationData: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func loadDisplayNode() {
        super.loadDisplayNode()

        let hostingController = UIHostingController(rootView: NightGramPanel())
        self.hostingController = hostingController
        self.addChild(hostingController)
        hostingController.view.backgroundColor = .clear
        hostingController.view.frame = self.displayNode.view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.displayNode.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}

/// Creates the NightGram panel for presentation from Telegram's settings navigation.
public func makeNightGramPanelController() -> ViewController {
    return NightGramPanelController()
}
