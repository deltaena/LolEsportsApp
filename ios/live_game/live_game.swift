//
//  live_game.swift
//  live_game
//
//  Created by Daniel Suárez García  on 7/10/23.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), flutterData: nil)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), flutterData: nil)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        let sharedDefaults = UserDefaults.init(suiteName: "group.deltaena")
        var flutterData: FlutterData? = nil

        if(sharedDefaults != nil) {
            do {
              let shared = sharedDefaults?.string(forKey: "event_data")
              if(shared != nil){
                let decoder = JSONDecoder()
                flutterData = try decoder.decode(FlutterData.self, from: shared!.data(using: .utf8)!)
              }
            } catch {
              print(error)
            }
        }

        let currentDate = Date()
        let entryDate = Calendar.current.date(byAdding: .hour, value: 24, to: currentDate)!
        let entry = SimpleEntry(date: entryDate, flutterData: flutterData)
        entries.append(entry)

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct FlutterData: Decodable, Hashable {
    let text: String
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let flutterData: FlutterData?
}

struct live_gameEntryView : View {
    var entry: Provider.Entry
    
    private var FlutterDataView: some View {
      Text(entry.flutterData!.text)
    }
    
    private var NoDataView: some View {
      Text("No Data found! Go to the Flutter App")
    }
    
    var body: some View {
      if(entry.flutterData == nil) {
        NoDataView
      } else {
        FlutterDataView
      }
    }
}

struct live_game: Widget {
    let kind: String = "live_game"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            live_gameEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}


extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    live_game()
} timeline: {
    SimpleEntry(date: .now, flutterData: nil)
    SimpleEntry(date: .now, flutterData: nil)
}
