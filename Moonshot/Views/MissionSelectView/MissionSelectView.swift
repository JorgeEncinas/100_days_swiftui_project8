//
//  MissionSelectView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
import SwiftUI

struct MissionSelectView : View {
    let mission : Mission
    let astronauts : [String : Astronaut]
    
    var body : some View {
        NavigationLink {
            //Text("Detail view")
            MissionView(mission: mission, astronauts: astronauts)
        } label: {
            VStack {
                MissionBadgeView(mission : mission)
                MissionTitleView(mission : mission)
            }
            .clipShape(
                .rect(cornerRadius: 10)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.lightBackground)
            )
        }
    }
}

#Preview {
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    VStack {
        MissionSelectView(
            mission: Mission.init(
                id: 1,
                launchDate: Date(),
                crew: [],
                description: "Test Description"
            ),
            astronauts: astronauts
        )
    }
    .padding(.horizontal)
}
