//
//  AppIntent.swift
//  live_game
//
//  Created by Daniel Suárez García  on 7/10/23.
//

import WidgetKit
import AppIntents

struct WidgetIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Event", default: "T1 VS DRX")
    var event: String
}
