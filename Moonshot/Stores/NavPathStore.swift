//
//  NavPathStore.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

@Observable
class NavigationPathStore {
    var navPath : NavigationPath {
        didSet {
            save()
        }
    }
    private let savePath = URL.documentsDirectory.appending(path: "SavedNavPath")
    
    func save() {
        guard let navRepresentation = navPath.codable else {
            return
        }
        do {
            let data = try JSONEncoder().encode(navRepresentation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(
                NavigationPath.CodableRepresentation.self,
                from: data
            ) {
                navPath = NavigationPath(decoded)
                return
            }
        }
        navPath = NavigationPath()
    }
}
