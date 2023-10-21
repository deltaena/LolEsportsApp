//
//  live_game.swift
//  live_game
//
//  Created by Daniel Suárez García  on 7/10/23.
//

import WidgetKit
import SwiftUI
import URLImage

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), flutterData: nil)
    }

    func snapshot(for configuration: WidgetIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), flutterData: nil)
    }
    
    func timeline(for configuration: WidgetIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        let sharedDefaults = UserDefaults.init(suiteName: "group.deltaena")
        var flutterData: FlutterData? = nil
        
        if(sharedDefaults != nil) {
            let teams = sharedDefaults?.dictionary(forKey: "event_data")
            
            let blueTeamDic = teams!["blueTeam"] as? Dictionary<String, Any>
            let blueTeam: Team = Team(json: blueTeamDic!)
                
            let redTeamDic = teams!["redTeam"] as? Dictionary<String, Any>
            let redTeam: Team = Team(json: redTeamDic!)
                
            flutterData = FlutterData(blueTeam: blueTeam, redTeam: redTeam)
        }

        let currentDate = Date()
        let entryDate = Calendar.current.date(byAdding: .hour, value: 24, to: currentDate)!
        let entry = SimpleEntry(date: entryDate, flutterData: flutterData)
        entries.append(entry)

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct FlutterData: Hashable {
    let blueTeam: Team
    let redTeam: Team
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let flutterData: FlutterData?
}

struct live_gameEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        if (entry.flutterData != nil){
            VStack{
                HStack{
                    VStack{
                        NetworkImageView(url: URL(string: entry.flutterData!.blueTeam.image)!).aspectRatio(contentMode: .fit)
                        Text(entry.flutterData!.blueTeam.code)
                    }
                    Text("VS")
                    VStack{
                        NetworkImageView(url: URL(string: entry.flutterData!.redTeam.image)!).aspectRatio(contentMode: .fit)
                        Text(entry.flutterData!.redTeam.code)
                    }
                }
            }
        }
        else {
            Text("unexpected error")
        }
    }
}

struct NetworkImageView: View {
    let url: URL
    
    var body: some View {
        if let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            Image(systemName: "person")
        }
    }
}

struct live_game: Widget {
    let kind: String = "live_game"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: WidgetIntent.self, provider: Provider()) { entry in
            live_gameEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}


#Preview(as: .systemSmall) {
    live_game()
} timeline: {
    SimpleEntry(date: .now, flutterData: nil)
    SimpleEntry(date: .now, flutterData: nil)
}
