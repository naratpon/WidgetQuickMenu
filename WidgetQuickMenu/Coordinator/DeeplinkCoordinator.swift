//
//  DeeplinkCoordinator.swift
//  WidgetQuickMenu
//
//  Created by Naratpon Buakhaw on 13/3/2567 BE.
//

import SwiftUI

enum TabName: String {
    case Home
    case Balance
    case Transfer
    case Scan
    
    var tabIndex: Int {
        switch self {
        case .Home:
            return 0
        case .Balance:
            return 1
        case .Transfer:
            return 2
        case .Scan:
            return 3
        }
    }
}

class DeeplinkCoordinator: ObservableObject {
    @Published var selectedTab: Int = 0
    
    func handleDeeplink(_ url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let host = components.host,
              let tab = TabName(rawValue: host)?.tabIndex else {
            return
        }
        selectedTab = tab
    }
}
