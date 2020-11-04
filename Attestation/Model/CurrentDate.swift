//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import SwiftUI

/// Used to inject the current date in the Attestation form each time the app enters the foreground
final class CurrentDate: ObservableObject {
    @Published var current = Date()
}
