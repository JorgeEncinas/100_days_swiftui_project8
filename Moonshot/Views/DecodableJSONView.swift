//
//  DecodableJSONView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/12/25.
//
import SwiftUI



// To convert the JSON `astronauts.json` into a DICTIONARY of Astronaut instances
// we need to use `Bundle` to:
//  1) Find the path to the file
//  2) Load that into an instance of `Data`
//  3) Pass the instance through a JSONDecoder()

// A better way is to write an Extension on `Bundle`, so that it's done
//  all in one place!

struct DecodableJSONView : View {
    let astronauts = Bundle.main.decodeAstronauts("astronauts.json")
    
    var body : some View {
        VStack {
            Text(String(astronauts.count))
        }
    }
}
