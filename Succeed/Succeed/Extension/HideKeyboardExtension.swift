//
//  HideKeyboardExtension.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/06/16.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
