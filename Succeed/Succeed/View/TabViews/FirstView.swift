//
//  FirstView.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/07/06.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 200, height: 200)
                .foregroundColor(.pink)
            Text("\(1)")
                .foregroundColor(.white)
                .font(.system(size: 60, weight: .bold))
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
