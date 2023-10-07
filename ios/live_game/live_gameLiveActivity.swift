//
//  live_gameLiveActivity.swift
//  live_game
//
//  Created by Daniel Suárez García  on 7/10/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct live_gameAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct live_gameLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: live_gameAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension live_gameAttributes {
    fileprivate static var preview: live_gameAttributes {
        live_gameAttributes(name: "World")
    }
}

extension live_gameAttributes.ContentState {
    fileprivate static var smiley: live_gameAttributes.ContentState {
        live_gameAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: live_gameAttributes.ContentState {
         live_gameAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: live_gameAttributes.preview) {
   live_gameLiveActivity()
} contentStates: {
    live_gameAttributes.ContentState.smiley
    live_gameAttributes.ContentState.starEyes
}
