//
//  BlankVieew.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/06/16.
//

import SwiftUI
    


struct BlankVieew: View {
    // MARK: - PROPERTY
    
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BlankVieew_Previews: PreviewProvider {
    static var previews: some View {
        BlankVieew(backgroundColor: Color.blue, backgroundOpacity: 0.3)
            .background(BackgroundImageView())
            .background(BackgroundGradient.ignoresSafeArea(.all))
    }
}
