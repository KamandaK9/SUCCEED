//
//  CheckboxStyle.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/06/16.
//

import SwiftUI

class CompletedListCount: ObservableObject {
    @Published var CompletedCount = 0
}

struct CheckboxStyle: ToggleStyle {
    @StateObject var CompCount = CompletedListCount()
    func makeBody(configuration: Configuration) -> some View {
        
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .yellow : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    feedback.notificationOccurred(.success)
                    if configuration.isOn {
                        playSound(sound: "sound-rise", type: "mp3")
                    } else {
                        playSound(sound: "sound-tap", type: "mp3")
                    }
   
                }
            
            configuration.label
                
        } //: HSTACK
    }
}

struct CheckboxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Placeholder label", isOn: .constant(false))
            .toggleStyle(CheckboxStyle())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
