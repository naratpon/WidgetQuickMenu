//
//  WidgetQuickMenuApp.swift
//  WidgetQuickMenu
//
//  Created by Naratpon Buakhaw on 13/3/2567 BE.
//

import SwiftUI

@main
struct WidgetQuickMenuApp: App {
    @StateObject private var deepLinkCoordinator = DeeplinkCoordinator()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(deepLinkCoordinator)
                .onOpenURL(perform: { url in
                    deepLinkCoordinator.handleDeeplink(url)
                })
        }
    }
}
