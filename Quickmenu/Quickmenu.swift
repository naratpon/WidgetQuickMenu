//
//  Quickmenu.swift
//  Quickmenu
//
//  Created by Naratpon Buakhaw on 13/3/2567 BE.
//

import WidgetKit
import SwiftUI

struct Quickmenu: Widget {
    private let kind: String = "Quickmenu"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView()
        }
        .configurationDisplayName("Quickmenu")
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> DataEntry {
        DataEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (DataEntry) -> ()) {
        let entry = DataEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [DataEntry] = [DataEntry(date: Date())]
        
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct DataEntry: TimelineEntry {
    let date: Date
}

struct WidgetView: View {
    var body: some View {
        VStack {
            Text("Quick Menu")
                .font(
                    .system(size: 22)
                    .weight(.heavy)
                )
                .foregroundColor(.black)
            Spacer()
            HStack {
                QuickMenu(source: "Home")
                    .frame(minWidth: 0, maxWidth: .infinity)
                QuickMenu(source: "Balance")
                    .frame(minWidth: 0, maxWidth: .infinity)
                QuickMenu(source: "Transfer")
                    .frame(minWidth: 0, maxWidth: .infinity)
                QuickMenu(source: "Scan")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
}

struct QuickMenu: View {
    var source: String
    
    var body: some View {
        if let url = URL(string: "widgetquickmenu://\(source)") {
            Link(destination: url) {
                VStack {
                    Image(source)
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text(source)
                        .font(
                            .system(size: 8)
                            .weight(.heavy)
                        )
                        .foregroundColor(.black)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(
                    Rectangle()
                        .cornerRadius(8)
                        .foregroundColor(Color.white)
                        .shadow(
                            color: Color.black.opacity(0.1),
                            radius: 5,
                            x: 0,
                            y: 0
                        )
                )
            }
        }
    }
}

