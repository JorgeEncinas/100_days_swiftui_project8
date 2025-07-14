//
//  MissionView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
import SwiftUI

struct MissionView : View {
    let mission : Mission
    
    static var sampleMission : Mission {
        let launchDate = "2000-05-05"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: launchDate)
        
        let mission : Mission = Mission(
            id: 1,
            launchDate: date,
            crew: [
                Mission.CrewRole(
                    name: "Thomas",
                    role: "Captain"
                )
            ],
            description: "A fictional commander for visualization purposes"
        )
        return mission
    }
    
    var body : some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    Text("Mission highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    return MissionView(mission: missions[0])
        .preferredColorScheme(.dark)
    
    //return MissionView(mission: MissionView.sampleMission)
    //    .preferredColorScheme(.dark)
}
