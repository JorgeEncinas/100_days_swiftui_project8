//
//  Mission.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
// GENERICS
import SwiftUI

struct Mission : Codable, Identifiable {
    
    struct CrewRole : Codable { //Nested struct!
        let name : String
        let role : String
    }
    // Keeps code organized, and namespace is Mission.CrewRole
    
    let id : Int
    let launchDate : Date? //Changed from `String?` to `Date?` so that it is parsed appropriately
    // Text(mission.launchDate ?? "N/A") This breaks this line!
    let crew: [CrewRole]
    let description: String
    
    var displayName : String {
        "Apollo \(id)"
    }
    
    var image : String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate : String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}


