//
//  DinoStorm_Widget.swift
//  DinoStorm-Widget
//
//  Created by Alexis Orellano on 9/22/21.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), cityName: "", temp: "", configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), cityName: "", temp: "", configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let userDefaults = UserDefaults(suiteName: "group.dinostorm")
        let name = userDefaults?.value(forKey: "cityName") as? String ?? ""
        let temp = userDefaults?.value(forKey: "temp") as? String ?? ""
        print(temp)
        
        

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, cityName: name, temp: temp, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let cityName: String
    let temp: String
    let configuration: ConfigurationIntent
    
}

struct DinoStorm_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image("SunnyBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width,
                           height: geo.size.height,
                           alignment: .center
                    )
            }
            
            VStack {
                Text(entry.cityName)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                Image("Dino")
                    .resizable()
                    .frame(width: 60, height: 70)
                Text("\(entry.temp)"+"°")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
        }
    }
}

@main
struct DinoStorm_Widget: Widget {
    let kind: String = "DinoStorm_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            DinoStorm_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct DinoStorm_Widget_Previews: PreviewProvider {
    static var previews: some View {
        DinoStorm_WidgetEntryView(entry: SimpleEntry(date: Date(), cityName: "", temp: "", configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
