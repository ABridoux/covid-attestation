//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import SwiftUI

struct BirthSection: View {

    @EnvironmentObject var profile: Profile

    var body: some View {
        Section(header: Text("Naissance")) {
            DatePicker("Date", selection: $profile.birthDate, displayedComponents: .date)
            TextField("Lieu", text: $profile.birthCity)
        }
    }
}
