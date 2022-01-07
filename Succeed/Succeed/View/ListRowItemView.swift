//
//  ListRowItemView.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/06/16.
//

import SwiftUI

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    
    
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.yellow : Color.primary)
                .strikethrough(item.completion).bold()
                .padding(.vertical, 12)
                .animation(.default)
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange, perform: { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        })
    }
}



struct ListRowTomorrowItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var tomorrowitems: TomorrowItems
    
    var body: some View {
        Toggle(isOn: $tomorrowitems.completion) {
            Text(tomorrowitems.task ?? "")
                .font(.system(.title, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(tomorrowitems.completion ? Color.yellow : Color.primary)
                .strikethrough(tomorrowitems.completion, color: Color.black)
                .padding(.vertical, 12)
                .animation(.default)
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(tomorrowitems.objectWillChange, perform: { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        })
    }
}


