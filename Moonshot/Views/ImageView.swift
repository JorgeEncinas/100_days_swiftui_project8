//
//  ImageView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/12/25.
//
import SwiftUI

struct ImageView : View {
    var body : some View {
        Image("TucsonImage")
            .frame(width: 300, height: 300)
            .clipped()
    }
}

struct ImageView2 : View {
    var body : some View {
        Image("TucsonImage")
            .resizable()
            .frame(width: 300, height: 300)
    }
}

struct ImageView3 : View {
    var body : some View {
        Image("TucsonImage")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
    }
}

struct ImageView4 : View {
    var body : some View {
        Image("TucsonImage")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300)
    }
}

struct ImageView5 : View {
    var body : some View {
        Image("TucsonImage")
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                // `container` can be the whole screen, or part of the screen that this view's
                // IMMEDIATE PARENT occupies. For example, perhaps the image is inside a VStack.
                size * 0.8 // Fills 80% of the available screen width.
                
                // Inside this closure, the axis we want is `.horizontal`
                //      This matters when you create relative horizontal AND vertical sizes.
                // The `size` value will be the size of our container,
                //      which for this image is the full screen
                // We did not need to specify the HEIGHT because Swift is figuring it out
                //  based on our content mode (probably since we're indicating it must be proportional).
            }
    }
}

