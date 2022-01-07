//
//  Constant.swift
//  Succeed
//
//  Created by Daniel Senga on 2021/06/16.
//

import SwiftUI

// MARK: - FORMATTER

 let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI

var BackgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomLeading)
}

// MARK: - UX

let feedback = UINotificationFeedbackGenerator()
