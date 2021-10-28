//
//  MyOrder.swift
//  MyOrder
//
//  Created by Danae Davelaar on 28/10/2021.
//

import WidgetKit
import SwiftUI

struct OrderEntry: TimelineEntry {
    let date = Date()
    let order: Order
}

struct Provider: TimelineProvider {
    
    @AppStorage("order", store :UserDefaults(suiteName: "group.clinton.CoffeeBrewAssessmentSwiftUi"))
    var orderData: Data = Data()
    
    func getSnapshot(in context: Context, completion: @escaping (OrderEntry) -> Void) {
        guard let order = try? JSONDecoder().decode(Order.self, from: orderData) else { return }
        let entry =  OrderEntry(order: order)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<OrderEntry>) -> Void) {
        guard let order = try? JSONDecoder().decode(Order.self, from: orderData) else { return }
        
        let entry =  OrderEntry(order: order)
        let timeline = Timeline(entries: [entry], policy: .atEnd )
        completion(timeline)
    }
    
    func placeholder(in context: Context) -> OrderEntry {
        OrderEntry(order: Order(id: "2", cofName: "N/A", size: "N/A", milk: "N/A", sugar: "N/A"))
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct MyOrderEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family
    
    
    @ViewBuilder
    var body: some View {
        
        switch family {
        case .systemSmall:
            SmallWidget(entry: entry)
        case .systemMedium:
            MediumWidget(entry: entry)
        default:
            LargeWidget(entry: entry)
        }
        
        
    }
}

struct LargeWidget: View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            HStack {
                Image("lungo")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:120, height: 120)
                    .clipped()
                Spacer()
                Text(entry.order.cofName)
                    .bold()
                    .font(.system(size: 24))
            }.padding(.bottom, 25)
            Text("Your last order was a \(entry.order.cofName) \(entry.order.size), with \(entry.order.sugar) sugar, and \(entry.order.milk) milk")
            Spacer()
                
        }.padding(25)
        
    }
}

struct MediumWidget: View {
    var entry: Provider.Entry
    
    var body: some View {
        HStack {
            Image("lungo")
                .resizable()
                .clipShape(Circle())
                .frame(width:80, height: 80)
                .clipped()
            Text(entry.order.cofName)
                .bold()
                .padding(.leading, 30)
            Spacer()
                
        }.padding(.horizontal, 20)
    }
}

struct SmallWidget: View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            Image("lungo")
                .resizable()
                .clipShape(Circle())
                .frame(width:60, height: 60)
                .clipped()
            Text(entry.order.cofName)
                
        }
    }
}

@main
struct MyOrder: Widget {
    let kind: String = "MyOrder"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MyOrderEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}


