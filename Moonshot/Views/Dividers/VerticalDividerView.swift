//
//  VerticalDividerView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
import SwiftUI

struct VerticalDividerView : View {
    var body : some View {
        Rectangle()
            .frame(width: 2)
            .padding(.leading, 20)
            .containerRelativeFrame(.vertical) { height, axis in
                height * 0.85
            }
    }
}
