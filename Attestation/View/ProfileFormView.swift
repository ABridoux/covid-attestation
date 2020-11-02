//
//  ProfileFormView.swift
//  Attestation
//
//  Created by Alexis Bridoux on 01/11/2020.
//

import SwiftUI

struct ProfileFormView: View {

    @ObservedObject var profile = Profile()

    var body: some View {

        Form {
            Section(header: Text("Nom")) {
                TextField("Prénom", text: $profile.firstName)
                TextField("Nom", text: $profile.lastName)
            }

            Section(header: Text("Naissance")) {
                DatePicker("Date", selection: $profile.birthDate, displayedComponents: .date)
                TextField("Lieu", text: $profile.birthCity)
            }

            Section(header: Text("Adresse")) {
                TextField("Rue", text: $profile.street)
                TextField("Ville", text: $profile.city)
                TextField("Code postal", text: $profile.zipCode)
                    .keyboardType(.numberPad)
            }
        }
    }
}

struct ProfileFormView_Previews: PreviewProvider {
    static var previews: some View {
        let profile = Profile()
        ProfileFormView(profile: profile)
    }
}
