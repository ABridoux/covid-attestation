//
//  ProfileNameSection.swift
//  Attestation
//
//  Created by Alexis Bridoux on 04/11/2020.
//

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
