//
//  DecodableView.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/12/25.
//
import SwiftUI

import SwiftUI

// Hierarchical `Codable` data
//      With the `Codable` protocol its easy to
//      decode "flat" data.
//  If you're decoding a SINGLE INSTANCE of a type
//      or an array, or dictionary of those instances

// But we'll work on slightly more complex JSON
//  there will be an array inside another array, using different data types.

// The key is to create SEPARATE TYPES for EACH LEVEL
//  As long as the data matches the hierarchy, `Codable`
//  can decode everything, no issue.

struct DecodableView : View {
    var body : some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Thomas Anderson",
                "address": {
                    "street": "555 Neo Avenue",
                    "city": "New York"
                }
            }
            """
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

struct User : Codable {
    let name : String
    let address : Address
}

struct Address : Codable {
    let street : String
    let city : String
}

#Preview {
    DecodableView()
}
