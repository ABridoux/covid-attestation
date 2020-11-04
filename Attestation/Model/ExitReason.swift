//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

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
