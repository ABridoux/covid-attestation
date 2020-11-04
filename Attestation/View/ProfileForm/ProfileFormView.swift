//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import SwiftUI

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
