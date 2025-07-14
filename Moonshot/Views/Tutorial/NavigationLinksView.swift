//
//  NavigationLinksView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/12/25.
//
import SwiftUI

// Sheets are different from the View Stack system
//      The View Stack System is the most fundamental form of iOS navigation
//      You can see it in Settings
//      or in Messages when you tap someone's name

// The way they're presented, they make the user think about it differently.

// Both `sheet()` and `NavigationLink` allos us to show a NEW VIEW
// from the current one,
// BUT, the way they do it is different,
// and you should choose them carefully.

// NavigationLink
//  is for showing details about a user's selection, like digging deeper into
//  a topic
// sheet()
//  is for showing unrelated content
//  such as Settings or a Compose window.

// The most COMMON place to see `NavigationLink`
//  is with a List

struct NavigationLinksView : View {
    var body : some View {
        NavigationStack {
            VStack {
                NavigationLink("Tap Me") {
                    Text("Detail View")
                }
                NavigationLink {
                    Text("Detail View 2")
                } label : {
                    VStack {
                        Text("This is the label")
                        Text("So is this")
                        Image(systemName: "face.smiling")
                    }
                    .font(.largeTitle)
                }
            }
            
            .navigationTitle("Swift UI")
        }
    }
}

struct NavigationLinksView2 : View {
    var body : some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI2")
        }
    }
}

#Preview {
    VStack {
        NavigationLinksView()
        NavigationLinksView2()
    }
}
