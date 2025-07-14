//
//  LazyScrollView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/12/25.
//
import SwiftUI


struct CustomText : View { //Adding views to a scroll, they get created IMMEDIATELY
    //This can hinder performance when you got thousands of them
    //So SwiftUI has what I presume is virtualization with
    // `LazyVStack` and `LazyHStack`
    let text : String
    
    var body : some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct FullWidthScrollView : View {
    var body : some View {
        ScrollView {
            VStack(spacing : 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

//Lazy Stacks always take up as much room as is available in our layouts
// whereas normal stacks take up ONLY AS MUCH SPACE AS NEEDED

// This is because it stops lazy stacks having to adjust their size if a new view
// is loaded that wants more space.

// You can make horizontal scrollviews by passing .horizontal as a parameter
// in your ScrollView
// Make sure to change VStack to HStack (or LazyVStack to LazyHStack)

struct HorizontalScrollView : View {
    var body : some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<100) {
                    CustomText("Entry \($0)")
                        .font(.title)
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct VerticalScrollView : View {
    var body : some View {
        ScrollView {
            LazyVStack(spacing : 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    VStack {
        HorizontalScrollView()
        VerticalScrollView()
    }
}
