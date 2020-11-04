//
//  ProfileBirthSection.swift
//  Attestation
//
//  Created by Alexis Bridoux on 04/11/2020.
//

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
