//
//  Astronaut.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/13/25.
//
import SwiftUI

// Loading some Codable Data
struct Astronaut: Codable, Identifiable {
    let id : String
    let name : String
    let description : String
}
