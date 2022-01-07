//
//  Scroll.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/06/17.
//

import SwiftUI
import CoreData



struct Scroll: View {
    
    @State var isHidden = false
    @State var ColorOrange = [LinearGradient(gradient: Gradient(colors: [Color.orange, Color.pink]), startPoint: .leading, endPoint: .trailing)]
    @State var ColorRed = [LinearGradient(gradient: Gradient(colors: [Color.red, Color.pink]), startPoint: .leading, endPoint: .trailing)]
    @State var ColorBlue = [LinearGradient(gradient: Gradient(colors: [Color.blue, Color.pink]), startPoint: .leading, endPoint: .trailing)]
    
    
    // FETCHING DATA
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                
                List {
                    Section(header: Text("TODAYS TASKS")) {
                    ForEach(items) { item in
                        ListRowItemView(item: item)
                        
                    }
                    
                    
                    } //: LIST
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 5)
                    
                    
                    
                    
                }
                .listStyle(InsetGroupedListStyle())
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                .padding(.vertical, 0)
                .opacity(isHidden ? 0 : 1)
                .frame(maxWidth: 640)
            }
        } //: VSTACK
        
        Button("Toggle") {isHidden.toggle()}
            .frame(width: 100, height: 100)
        
        }
      
        
        }
    
    
    
    


struct Scroll_Previews: PreviewProvider {
    static var previews: some View {
        Scroll().environment(\.managedObjectContext,PersistenceController.preview.container.viewContext)
            
    }
}
