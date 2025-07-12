//
//  DecodableJSONGenericView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/12/25.
//
import SwiftUI

// GENERICS
struct Mission : Codable, Identifiable {
    struct CrewRole : Codable { //Nested struct!
        let name : String
        let role : String
    }
    // Keeps code organized, and namespace is Mission.CrewRole
    
    let id : Int
    let launchDate : String?
    let crew: [CrewRole]
    let description: String
}

// One more thing:
//      `Codable` behind the scenes is an ALIAS for TWO SEPARATE PROTOCOLS
//      1) `Encodable`
//      2) `Decodable`
// Whichever you choose is down to you and your requirements.

struct DecodableJSONGenericView : View {
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    var body : some View {
        VStack {
            Text(String(astronauts.count))
        }
    }
}
