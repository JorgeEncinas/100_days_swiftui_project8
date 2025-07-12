//
//  ContentView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/12/25.
//
import SwiftUI

// 1. Custom app colors
//      Colors can be done with an Asset Catalog,
//          or they can be done via code, through Swift Extensions.
//      Code makes it easy to track changes in a team.

//      Color conforms to a protocol called `ShapeStyle`
//          it's what lets us use colors, gradients, materials, and more
//          as if they were the same thing!

//      `ShapeStyle` is what the background() modifier uses.
//      so we want to extend Color in a way that all SwiftUI modifiers using
//      `ShapeStyle` work too.

//  Thus, we need a way to say: Add functionality to `ShapeStyle`,
//  but ONLY when it's being used as a color!

extension ShapeStyle where Self == Color {
    
    // 2. Force our app to have a dark theme.
    static var darkBackground : Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }

    static var lightBackground : Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}


struct ContentView: View {
    var body: some View {
        //GridLayoutView3()
        //DecodableJSONView()
        DecodableJSONGenericView()
    }
}

#Preview {
    ContentView()
}
