//
//  ThirdView.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/07/06.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 200, height: 200)
                .foregroundColor(.orange)
            Text("\(3)")
                .foregroundColor(.white)
                .font(.system(size: 60, weight: .bold))
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
