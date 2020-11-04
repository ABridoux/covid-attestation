//
//  ValidationError.swift
//  Attestation
//
//  Created by Alexis Bridoux on 01/11/2020.
//

import Foundation

enum ValidationError: LocalizedError {

    case dataValidation(description: String)

    var errorDescription: String? {
        switch self {
        case .dataValidation(let description): return description
        }
    }
}
