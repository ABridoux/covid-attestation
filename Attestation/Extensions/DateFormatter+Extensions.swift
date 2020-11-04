//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import Foundation

extension Locale {
    static let france = Self(identifier: "fr_FR")
}

extension DateFormatter {

    static let french: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd MMMM - HH:mm"
        formatter.locale = .france
        return formatter
    }()

    static let qrDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyy"
        formatter.locale = .france
        return formatter
    }()

    static let qrHour: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = .france
        return formatter
    }()

    static let label: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        formatter.locale = .france
        return formatter
    }()
}
