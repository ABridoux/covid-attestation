//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import Foundation

extension URL {

    static let exitReasons: URL = {
        guard let url = Bundle.main.url(forResource: "form-data", withExtension: "json") else {
            preconditionFailure("No form data file")
        }
        return url
    }()
}
