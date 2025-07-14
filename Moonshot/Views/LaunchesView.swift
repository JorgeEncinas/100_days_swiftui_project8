//
//  DecodableJSONGenericView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/12/25.
//
import SwiftUI


// One more thing:
//      `Codable` behind the scenes is an ALIAS for TWO SEPARATE PROTOCOLS
//      1) `Encodable`
//      2) `Decodable`
// Whichever you choose is down to you and your requirements.

struct LaunchesView : View {
    @State private var showAsGrid : Bool = true
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body : some View {
        NavigationStack {
            ScrollView {
                if (showAsGrid) {
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { (mission : Mission) in
                            MissionSelectView(
                                mission : mission,
                                astronauts: astronauts
                            )
                        }
                    }
                    .padding([.horizontal, .bottom])
                } else {
                    LazyVStack {
                        ForEach(missions) { (mission : Mission) in
                            MissionSelectView(
                                mission : mission,
                                astronauts: astronauts
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showAsGrid.toggle()
                } label: {
                    Image(systemName: showAsGrid
                          ? "line.3.horizontal"
                          : "square.grid.2x2"
                    )
                }
            }
        }
    }
}

#Preview {
    LaunchesView()
}
