//
//  CrewMemberSectionView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
import SwiftUI

struct CrewMemberSectionView : View {
    let crew : [CrewMember]
    
    var body : some View {
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
}
