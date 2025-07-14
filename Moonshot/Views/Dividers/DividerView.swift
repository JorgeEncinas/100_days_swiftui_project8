//
//  Divider.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
import SwiftUI

struct DividerView : View {
    var body : some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
            .containerRelativeFrame(.horizontal) { width, axis in
                width * 0.85
            }
    }
}
