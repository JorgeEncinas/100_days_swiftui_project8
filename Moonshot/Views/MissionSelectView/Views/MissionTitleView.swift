//
//  MissionTitleView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
import SwiftUI

struct MissionTitleView : View {
    let mission : Mission
    
    var body : some View {
        VStack {
            Text(mission.displayName)
                .font(.headline)
                .foregroundStyle(.white)
            Text(mission.formattedLaunchDate)
                .font(.caption)
                .foregroundStyle(.white)
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(.lightBackground)
    }
}
