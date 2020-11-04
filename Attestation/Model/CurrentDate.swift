//
//  CurrentDate.swift
//  Attestation
//
//  Created by Alexis Bridoux on 04/11/2020.
//

import SwiftUI

/// Used to inject the current date in the Attestation form each time the app enters the foreground
final class CurrentDate: ObservableObject {
    @Published var current = Date()
}
