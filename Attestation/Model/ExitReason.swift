//
//  ExitTravel.swift
//  Attestation
//
//  Created by Alexis Bridoux on 03/11/2020.
//

import Foundation

struct ExitReason: Codable, Hashable {

    let code: String
    let label: String
}

extension Array where Element == ExitReason {

    /// Load the exit reasons from the provided JSON
    static func load(from url: URL = .exitReasons) -> Self {
        do {
            let data = try Data(contentsOf: url)
            return load(from: data)
        } catch {
            assertionFailure("Unable to load the exit reasons file at \(url.absoluteString)")
            return []
        }
    }

    static func load(from data: Data) -> Self {
        do {
            return try JSONDecoder().decode(Self.self, from: data)
        } catch {
            assertionFailure("Unable to decode the data as [ExitReason]")
            return []
        }
    }
}
