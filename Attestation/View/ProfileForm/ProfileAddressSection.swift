//
//  ProfileFormSection.swift
//  Attestation
//
//  Created by Alexis Bridoux on 04/11/2020.
//

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
