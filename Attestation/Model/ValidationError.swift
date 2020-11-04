//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import Foundation

enum ValidationError: LocalizedError {

    case dataValidation(description: String)

    var errorDescription: String? {
        switch self {
        case .dataValidation(let description): return description
        }
    }
}
