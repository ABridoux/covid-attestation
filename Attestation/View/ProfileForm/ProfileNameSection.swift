//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import SwiftUI

struct NameSection: View {

    @EnvironmentObject var profile: Profile

    var body: some View {
        Section(header: Text("Nom")) {
            TextField("Prénom", text: $profile.firstName)
            TextField("Nom", text: $profile.lastName)
        }
    }
}
