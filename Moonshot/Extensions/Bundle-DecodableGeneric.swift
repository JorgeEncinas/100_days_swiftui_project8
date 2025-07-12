//
//  Bundle-DecodableGeneric.swift
//  Moonshot
//
//  Created by Jorge Encinas on 7/12/25.
//
import SwiftUI

// Now let's use `Generics` instead of just tweaking our Bundle extension.

extension Bundle {
    // The angle brackets <T> is the placeholder for certain types.
    func decode<T : Codable>(_ file : String) -> T {
        guard let url = self.url(
            forResource: file,
            withExtension: nil
        ) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        // Set the decoder to parse dates. However, you must tell it which fields are dates!
        // Do so in the `struct` that defines your variables and their respective types.
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key: '\(key.stringValue)' - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
    // We could have used anything instead of `T`, LIKE `Type`, or `TypeOfThing`
    // but `T` is convention, shorthand for `type`
    
    // INSIDE the method, we can now use `T` everywhere we wouls use [String : Astronaut]
    
    // Note that there is a BIG difference between `T` and `[T]`
    // We also impose a CONSTRAINT in <T : Codable> so that
    //  devs can ONLY use this method with a type that conforms to `Codable`.
    
}
