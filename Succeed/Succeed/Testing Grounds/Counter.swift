//
//  Counter.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/09/07.
//

import SwiftUI

struct Counter: View {
    @State var Count = 0
    var body: some View {
       
        VStack(alignment: .leading) {
            HStack {
            Button {
                Count += 1
                print("\(Count)")
            } label: {
                Text("Press me to add")
            }
            Text("Count is \(Count)")
            }
            
            Button(action: {
                Count -= 1
            }, label: {
                Text("Press me to minus")
            })
        }
        .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
}



struct Counter_Previews: PreviewProvider {
    static var previews: some View {
        Counter()
    }
}
