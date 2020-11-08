//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import Foundation

extension Locale {
    static let france = Self(identifier: "fr_FR")
}

final class FrenchDateFormater: DateFormatter {

    override init() {
        super.init()

        dateFormat = "EEEE dd MMMM"
        locale = .france
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func string(from date: Date) -> String {
        let calendar = Calendar.current
        let result = calendar.compare(date, to: .now, toGranularity: .day)
        switch result {
        case .orderedSame:
            return "Aujourd'hui"

        case .orderedAscending:
            if calendar.dateComponents([.day], from: calendar.startOfDay(for: date), to: calendar.startOfDay(for: .now)).day == 1 {
                return "Hier"
            } else {
                fallthrough
            }

        default: return super.string(from: date).capitalized
        }
    }
}

extension DateFormatter {

    static let frenchDay: DateFormatter = { FrenchDateFormater() }()

    static let frenchHour: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
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
