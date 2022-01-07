//
//  BackgroundImageView.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/06/16.
//

import SwiftUI



struct BackgroundImageView: View {
    private var change = false
    var body: some View {
        Image("RocketOff")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
            .offset(x: -200, y: 5)
        
  
        
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
