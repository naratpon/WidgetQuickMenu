//
//  MainView.swift
//  WidgetQuickMenu
//
//  Created by Naratpon Buakhaw on 13/3/2567 BE.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var deeplinkCoordinator: DeeplinkCoordinator
    
    var body: some View {
        TabView(selection: $deeplinkCoordinator.selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(TabName.Home.tabIndex)
            BalanceView()
                .tabItem {
                    Label("Balance", systemImage: "folder.fill")
                }
                .tag(TabName.Balance.tabIndex)
            TransferView()
                .tabItem {
                    Label("Transfer", systemImage: "paperplane.fill")
                }
                .tag(TabName.Transfer.tabIndex)
            ScanView()
                .tabItem {
                    Label("Scan", systemImage: "qrcode")
                }
                .tag(TabName.Scan.tabIndex)
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }

    }
}

#Preview {
    MainView()
}
