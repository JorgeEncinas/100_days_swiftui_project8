//
//  MissionView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
import SwiftUI

struct MissionView : View {
    let mission : Mission
    let crew : [CrewMember]
    
    init(mission : Mission, astronauts: [String : Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { (member : Mission.CrewRole) in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing '\(member.name)'")
            }
        }
    }
    
    static var mockMission : Mission {
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
                
                DividerView()
                            
                VStack(alignment: .leading) {
                    Text("Mission highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                }
                .padding(.horizontal)
                
                DividerView()
                
                Text("Crew")
                    .font(.title.bold())
                    .padding(.bottom, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Array(crew.enumerated()), id: \.element.role) { (index: Int, crewMember : CrewMember) in
                            CrewMemberView(
                                crewMember : crewMember,
                                isLast : index == crew.count - 1
                            )
                        }
                    }
                }
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
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
    
    //return MissionView(mission: MissionView.sampleMission)
    //    .preferredColorScheme(.dark)
}
