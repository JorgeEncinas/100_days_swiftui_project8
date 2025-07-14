//
//  CrewMemberView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
import SwiftUI

struct CrewMemberView : View {
    let crewMember : CrewMember
    let isLast : Bool
    
    var body : some View {
        NavigationLink {
            AstronautView(astronaut: crewMember.astronaut)
        } label: {
            HStack {
                Image(crewMember.astronaut.id)
                    .resizable()
                    .frame(width: 104, height: 72)
                    .clipShape(.capsule)
                    .overlay(
                        Capsule()
                            .strokeBorder(.white, lineWidth: 0.7)
                    )
                
                VStack(alignment: .leading) {
                    Text(crewMember.astronaut.name)
                        .foregroundStyle(.white)
                        .font(.headline)
                    Text(crewMember.role)
                        .foregroundStyle(.white.opacity(0.5))
                }
                if(!isLast) {
                    Rectangle()
                        .frame(width: 2)
                        .padding(.leading, 20)
                        .containerRelativeFrame(.vertical) { height, axis in
                            height * 0.85
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}
