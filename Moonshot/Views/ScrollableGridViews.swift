//
//  Untitled.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/12/25.
//
import SwiftUI

// Laying out Views in a scrolling grid.

//  Sometimes you want not just rows, but also Columns
//      which makes a `Grid`!

//  This is accomplished with 2 views:
//      1) `LazyHGrid`
//              for showing horizontal data
//      2) `LazyVGrid`
//              for showing vertical data

//  Just like with lazy stacks, here we also delay loading the views until needed.
// That means we can display more data without using important resources!

// 2 STEPS
//      1) Define the rows OR columns we want
//          we only define ONE OF THE TWO
//          depending on which kind of grid we want.

//          Here, look at a Vertically Scrolling Grid
//          then we want our data laid out in three columns, exactly 80 points wide

//      2) Once you define your layout,
//          then place your grid inside a ScrollView along with as many items as you want.
//      Each item you create inside the grid is AUTOMATICALLY ASIGNED A COLUMN
//          in the same way that rows inside a list automatically
//          get placed inside their parent.

struct GridLayoutView : View {
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    var body : some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

// This works, but the best part about grids
//  is their ability to work across a variety of screen sizes.

//  This can be done with a different column layout,
//      using ADAPTIVE SIZES

struct GridLayoutView2 : View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)) //Fit in as many cols as possible.,
        //As long as they are at least 80 points in width.
        // AND, additionally it has a maximum range
        //  for even more control
        
        // Adaptive layouts allow grids that make maximum use
        //  of available screen space.
    ]
    
    var body : some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct GridLayoutView3 : View { // This will be horizontal
    let layout = [
        GridItem(.adaptive(minimum: 50, maximum: 100))
    ]
    
    var body : some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows : layout) { //Notice that it's now `rows` here.
                ForEach(0..<1000) {
                    Text("Item \($0)")
                        .background($0 % 2 == 0 ? Color.red : Color.blue)
                }
            }.frame(minHeight: 100, maxHeight: .infinity)
        }
    }
}

#Preview {
    VStack {
        GridLayoutView2()
        GridLayoutView3()
    }
}
