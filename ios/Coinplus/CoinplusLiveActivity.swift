//
//  CoinplusLiveActivity.swift
//  Coinplus
//
//  Created by Hayk on 10/19/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct CoinplusAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct CoinplusLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CoinplusAttributes.self) { context in
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

extension CoinplusAttributes {
    fileprivate static var preview: CoinplusAttributes {
        CoinplusAttributes(name: "World")
    }
}

extension CoinplusAttributes.ContentState {
    fileprivate static var smiley: CoinplusAttributes.ContentState {
        CoinplusAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: CoinplusAttributes.ContentState {
         CoinplusAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: CoinplusAttributes.preview) {
   CoinplusLiveActivity()
} contentStates: {
    CoinplusAttributes.ContentState.smiley
    CoinplusAttributes.ContentState.starEyes
}
