//
//  ProfileFormView.swift
//  Attestation
//
//  Created by Alexis Bridoux on 01/11/2020.
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

struct BirthSection: View {

    @EnvironmentObject var profile: Profile

    var body: some View {
        Section(header: Text("Naissance")) {
            DatePicker("Date", selection: $profile.birthDate, displayedComponents: .date)
            TextField("Lieu", text: $profile.birthCity)
        }
    }
}

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

struct ProfileFormView: View {

    @State private var alertMessage = ""
    @State private var showAlert = false
    @Binding private(set) var isPresented: Bool
    @EnvironmentObject var profile: Profile

    var body: some View {
        Form {
            NameSection()
            BirthSection()
            AddressSection()
        }
        .navigationBarTitle("Profil")
        .navigationBarItems(
            leading: Button("Annuler", action: {
                isPresented.toggle()
            })
            .font(.callout),
            trailing: Button("OK", action: {
                do {
                    try profile.save()
                } catch {
                    alertMessage = error.localizedDescription
                    showAlert.toggle()
                    return
                }
                isPresented.toggle()
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Erreur dans le formulaire"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            })
        )
    }
}

struct ProfileFormView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileFormView(isPresented: .constant(true))
                .environmentObject(Profile(firstName: "Tom", lastName: "Jedusor"))
        }
    }
}
