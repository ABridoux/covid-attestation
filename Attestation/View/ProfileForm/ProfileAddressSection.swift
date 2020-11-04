//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import SwiftUI

struct AddressSection: View {

    @EnvironmentObject var profile: Profile

    var body: some View {
        Section(header: Text("Adresse")) {
            TextField("Rue", text: $profile.street)
            TextField("Ville", text: $profile.city)
            TextField("Code postal", text: $profile.zipCode)
                .keyboardType(.numberPad)
        }
    }
}
