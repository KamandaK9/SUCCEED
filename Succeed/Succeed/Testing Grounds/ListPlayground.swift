//
//  ListPlayground.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/09/21.
//

import SwiftUI
import CoreData

struct ListPlayground: View {
    
    // Fetching Data using func getItems FetchRequest
    @FetchRequest(fetchRequest: getItems)
    private var items: FetchedResults<Item>
    
    // Assigning managed object to viewcontect
    @Environment(\.managedObjectContext) private var viewContext
    
    // Func getItems handles the fetch request as well as descriptors when fetching data
    static var getItems: NSFetchRequest<Item> {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.sortDescriptors = [.init(keyPath: \Item.timestamp, ascending: true),.init(keyPath: \Item.userOrder, ascending: true)]
        return request
    }
    
    
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(items) { item in
                        ListRowItemView(item: item)
                    }
                }
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                foregroundColor(Color.white)
                    .padding(.horizontal, 5)
            }
            .listStyle(InsetGroupedListStyle())
            .frame(maxWidth: 640)
        }
    }
}

struct ListPlayground_Previews: PreviewProvider {
    static var previews: some View {
        ListPlayground()
    }
}
