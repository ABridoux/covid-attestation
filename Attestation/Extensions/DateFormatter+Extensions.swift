//
//  DateFormatter+Extensions.swift
//  Attestation
//
//  Created by Alexis Bridoux on 04/11/2020.
//

import Foundation

extension DateFormatter {

    static let french: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM - HH:mm"
        return formatter
    }()

    static let qrDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyy"
        return formatter
    }()

    static let qrHour: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()

    static let label: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        return formatter
    }()
}
