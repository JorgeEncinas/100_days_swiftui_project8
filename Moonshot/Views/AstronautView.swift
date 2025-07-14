//
//  AstronautView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
import SwiftUI

struct AstronautView : View {
    let astronaut : Astronaut
    
    var body : some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                
                Text(astronaut.description)
                    .padding()
            }.padding(.vertical)
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
    if let astronaut = astronauts["aldrin"] {
        AstronautView(astronaut: astronaut)
            .preferredColorScheme(.dark)
    }
}
