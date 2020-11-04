//
//  ProfilePicker.swift
//  Attestation
//
//  Created by Alexis Bridoux on 02/11/2020.
//

import SwiftUI

struct ProfileRow: View {

    @State private var presentProfileEdit = false
    @EnvironmentObject var profile: Profile

    var body: some View {
        Button(action: {
            presentProfileEdit.toggle()
        }, label: {
            HStack {
                Text(profile.fullName)
                Spacer()
                Image(systemName: "person.fill")
            }
        })
        .foregroundColor(.label)
        .sheet(isPresented: $presentProfileEdit, content: {
            NavigationView {
                ProfileFormView(isPresented: $presentProfileEdit)
                    .environmentObject(profile)
            }
        })
    }
}

struct ProfilePicker_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileRow()
                .environmentObject(Profile(firstName: "Lulu", lastName: "Trintignan"))
                .padding(20)
            ProfileRow()
                .environmentObject(Profile(firstName: "Lulu", lastName: "Trintignan"))
                .padding(20)
                .preferredColorScheme(.dark)
                .background(Color.systemBackground)
        }
    }
}
