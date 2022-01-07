//
//  ContentView.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/06/16.
//

import SwiftUI
import CoreData

class isToday: ObservableObject {
    @Published var isTrue = false {
        willSet {
            objectWillChange.send()
        }
    }
}



struct ContentView: View {
    // MARK: - PROPERTY
    
    @StateObject var Today = isToday()
    @AppStorage("isDarkMode") private var isDarkkMode: Bool = false
    @State var task: String = ""
    @State private var showNewTaskItem: Bool = false
    @State private var SectionTitle: String = ""
    @State var Daytype = 0
    @State private var selectedTab = "message"
    
    
    
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .yellow
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance().backgroundColor = .black
        
        UINavigationBar.appearance().barTintColor = .clear
        
    }
    
    
    
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(fetchRequest: getItems)
    private var items: FetchedResults<Item>
    
    
    // FETCHING TOMORROWITEMSDATA
    /* @FetchRequest(
     sortDescriptors: [NSSortDescriptor(keyPath: \TomorrowItems.timestamp, ascending: true)],
     animation: .default)
     private var tomorrowItems: FetchedResults<TomorrowItems> */
    
    @FetchRequest(fetchRequest: getTomorrow)
    private var tomorrowItems: FetchedResults<TomorrowItems>
    
    
    
    
    
    
    // MARK: - FUNCTIONS
    
    static var getItems: NSFetchRequest<Item> {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.sortDescriptors = [.init(keyPath: \Item.timestamp, ascending: true), .init(keyPath: \Item.userOrder, ascending: true)]
        return request
    }
    
    static var getTomorrow: NSFetchRequest<TomorrowItems> {
        let request: NSFetchRequest<TomorrowItems> = TomorrowItems.fetchRequest()
        request.sortDescriptors = [.init(keyPath: \TomorrowItems.timestamp, ascending: true)]
        return request
    }
    
    
    
    private func onMove(indexSet: IndexSet, destination: Int) {
        let source = indexSet.first!
        
        if source < destination {
            var startindex = source + 1
            let endindex = destination - 1
            var startorder = items[source].userOrder
            while startindex <= endindex {
                items[startindex].userOrder = startorder
                startorder = startorder + 1
                startindex = startindex + 1
                
            }
            items[source].userOrder = startorder
            
        } else if destination < source {
            var startindex = destination
            let endindex = source - 1
            var startorder = items[destination].userOrder + 1
            let newOrder = items[destination].userOrder
            while startindex <= endindex {
                items[startindex].userOrder = startorder
                startorder = startorder + 1
                startindex = startindex + 1
                
            }
            
            items[destination].userOrder =  newOrder
        }
        
        saveItems()
        
        
    }
    
    func Moveitems(from source: IndexSet, to destination: Int) {
        if source.first! > destination {
            items[source.first!].userOrder = items[destination].userOrder - 1
            for i in destination...items.count - 1 {
                items[i].userOrder = items[i].userOrder + 1
            }
        }
        if source.first! < destination {
            items[source.first!].userOrder = items[destination-1].userOrder
            for i in 0...destination - 1{
                items[i].userOrder = items[i].userOrder - 1
            }
        }
        saveItems()
    }
    
    func saveItems() {
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
        
        
        private func deleteItems(offsets: IndexSet) {
            withAnimation {
                offsets.map { items[$0] }.forEach(viewContext.delete)
                
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
        
        private func deletetomorrowItems(offsets: IndexSet) {
            withAnimation {
                offsets.map { tomorrowItems[$0] }.forEach(viewContext.delete)
                
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
        
        
        
        
        
        
        
        private func Todayday() {
            if Daytype == 0 {
                Today.isTrue = true
                
            } else if Daytype == 1 {
                Today.isTrue = false
                
            }
            
        }
        
        
        
        
        
        
        // MARK: - BODY
        
        var body: some View {
            NavigationView {
                ZStack {
                    // MARK: - MAINVIEW
                    VStack {
                        // MARK: - HEADER
                        
                        HStack(spacing: 10) {
                            // TITLE
                            Text("Succeed")
                                .font(.system(.largeTitle, design: .rounded))
                                .fontWeight(.heavy)
                                .padding(.leading, 4)
                            
                            Spacer()
                            // EDIT BUTTON
                            EditButton()
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .padding(.horizontal, 10)
                                .frame(minWidth: 70, minHeight: 24)
                                .background(
                                    Capsule().stroke(Color.white, lineWidth: 4)
                                )
                            
                            // APPEARANCE BUTTON
                            Button(action: {
                                //TOGGLE APPEARANCE
                                isDarkkMode.toggle()
                                playSound(sound: "sound-tap", type: "mp3")
                                feedback.notificationOccurred(.success)
                            }, label: {
                                Image(systemName: isDarkkMode ? "moon.circle.fill" : "moon.circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .font(.system(.title, design: .rounded))
                                
                            })
                            
                        } //: HStACK
                        .padding()
                        .foregroundColor(.white)
                        
                        // MARK: - NEW TASK BUTTON
                        
                        HStack() {
                            Button(action: {
                                showNewTaskItem = true
                                playSound(sound: "sound-ding", type: "mp3")
                                feedback.notificationOccurred(.success)
                            }, label: {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                            })
                        }
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 15)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing)
                                .clipShape(Capsule())
                        )
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
                        .frame(height: 60, alignment: .leading)
                        
                    
                        
                        
                        Spacer(minLength: 25)
                        //MARK: - SEGMENTED VIEW
                        
                        VStack {
                            
                            
                            Spacer()
                            
                            Picker(selection: $Daytype, label: Text("")) {
                                Text("Today").tag(0)
                                Text("Tomorrow").tag(1)
                                
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(10)
                            
                            
                            
                            if Daytype == 0 {
                                VStack {
                                    List {
                                        Section(header: Text("Todays Tasks: \(items.count)")) {
                                            ForEach(items) { item in
                                                ListRowItemView(item: item)
                                       
                                            }
                                            .onDelete(perform: deleteItems)
                                            .onMove(perform: Moveitems)
                                            
                                        }
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color.white)
                                        .padding(.horizontal, 5)
                                        
                                    } // END OF LIST
                                    .onAppear(perform: Todayday)
                                    .listStyle(InsetGroupedListStyle())
                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                                    .padding(.vertical, 0)
                                    .frame(maxWidth: 640)
                                    .environmentObject(Today)
                                    
                                    
                                    
                                    
                                } // END OF VSTACK
                          
                            
                            
                                
                                
                            } else if Daytype == 1 {
                                VStack {
                                    List {
                                        Section(header: Text("Tomorrows Tasks: \(tomorrowItems.count)")) {
                                            ForEach(tomorrowItems) { item in
                                                ListRowTomorrowItemView(tomorrowitems: item)
                                            }
                                            .onDelete(perform: deletetomorrowItems)
                                        }
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color.white)
                                        .padding(.horizontal, 5)
                                        
                                    } // END OF LIST
                                    .onAppear(perform: Todayday)
                                    .listStyle(InsetGroupedListStyle())
                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                                    .padding(.vertical, 0)
                                    .frame(maxWidth: 640)
                                    .environmentObject(Today)
                                    
                                } // END OF VSTACK
                                
                            }
                        }
                        
                        
                        Spacer(minLength: 10)
                        
                        
                        
                        // MARK: - TASKS
                        /*   List {
                         Section(header: Text(SectionTitle)) {
                         ForEach(items) { item in
                         ListRowItemView(item: item)
                         
                         }
                         
                         .onDelete(perform: deleteItems)
                         } //: LIST
                         .font(.system(size: 20, weight: .semibold, design: .rounded))
                         .foregroundColor(Color.white)
                         .padding(.horizontal, 5)
                         
                         
                         
                         
                         }
                         .listStyle(InsetGroupedListStyle())
                         .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                         .padding(.vertical, 0)
                         .frame(maxWidth: 640)
                         */
                        
                        
                    } //: VSTACK
                    .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
                    .transition(.move(edge: .bottom))
                    .animation(.easeOut(duration: 0.5))
                    
                    
                    // MARK: NEW TASK ITEM
                    
                    if showNewTaskItem {
                        BlankVieew(backgroundColor: isDarkkMode ? Color.black : Color.gray,
                                   backgroundOpacity: isDarkkMode ? 0.3 : 0.5)
                            .onTapGesture {
                                withAnimation() {
                                    showNewTaskItem = false
                                }
                            }
                        NewTaskItemView(isShowing: $showNewTaskItem).environmentObject(Today)
                    }
                    
                    
                    
                } //: ZSTACK
                .onAppear() {
                    UITableView.appearance().backgroundColor = UIColor.clear
                }
                .navigationBarTitle("Daily Tasks", displayMode: .large)
                .navigationBarHidden(true)
                .background(
                    BackgroundImageView()
                        .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
                )
                .background(
                    BackgroundGradient.ignoresSafeArea(.all)
                )
            } //: NAVIGATION
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
        
        
        
        
        
        
    }
    // MARK: - PREVIEW
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            
        }
    }
