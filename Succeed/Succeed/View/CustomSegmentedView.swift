//
//  CustomSegmentedView.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/07/06.
//

import SwiftUI

struct CustomSegmentedView: View {
    @State private var Daytype = 0
    
  
        

    var body: some View {

                VStack {
                    
                    Spacer()
                    
                    Picker(selection: $Daytype, label: Text("")) {
                        Text("Today").tag(0)
                        Text("Tomorrow").tag(1)
                        Text("Completed").tag(2)
                               
                    }
                            .pickerStyle(SegmentedPickerStyle())

                    if Daytype == 0 {
                        VStack {
                            HStack {
                            Image(systemName: "crown.fill")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            Text("List to conquer today")
                                
                            }
                            .padding()
                            
                        List {
                            Text("Beep")
                            Text("\(Daytype)")
                            
                           }
                        } // END OF VSTACK
                    
                            
                    } else if Daytype == 1 {
                        List {
                            Text("Beep")
                            Text("\(Daytype)")
                        }
                        
                    } else {
                        List {
                            Text("Boop")
                            Text("\(Daytype)")
                        }
                    }
                }
            }
}
         


struct CustomSegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedView()
    }
}
