//
//  SecondView.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/07/06.
//

import SwiftUI

    struct SecondView: View {
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 200, height: 200)
                .foregroundColor(.green)
            Text("\(2)")
                .foregroundColor(.white)
                .font(.system(size: 60, weight: .bold))
            }
        }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
