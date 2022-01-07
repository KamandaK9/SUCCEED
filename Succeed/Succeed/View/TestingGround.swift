//
//  TestingGround.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/06/18.
//

import SwiftUI

struct TestingGround: View {
    
   @State private var change: Bool = false
   @State private var selection = 0
    private let items: [String] = ["M","T","W","T","F"]
    
    
    var body: some View {
        VStack {
            Picker(selection: $selection, label: Text("")) {
                ForEach(0..<items.count, id: \.self) { index in
                    Text(self.items[index]).tag(index)
                       
                }
        }
            .pickerStyle(SegmentedPickerStyle())
            
            
            
           
        }
     
}
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .blue
        
    }

struct TestingGround_Previews: PreviewProvider {
    static var previews: some View {
        TestingGround()
    }
}
}
