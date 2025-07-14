//
//  MissionBadgeView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
import SwiftUI

struct MissionBadgeView : View {
    let mission : Mission
    
    var body : some View {
        Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .padding()
        VStack {
            Text(mission.formattedLaunchDate)
                .font(.subheadline)
        }
    }
}
