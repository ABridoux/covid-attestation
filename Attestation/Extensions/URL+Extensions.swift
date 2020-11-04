//
//  URL+Extensions.swift
//  Attestation
//
//  Created by Alexis Bridoux on 03/11/2020.
//

import Foundation

extension URL {

    static let exitReasons: URL = {
        guard let url = Bundle.main.url(forResource: "form-data", withExtension: "json") else {
            preconditionFailure("No form data file")
        }
        return url
    }()
}
