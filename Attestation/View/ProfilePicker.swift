//
//  ProfilePicker.swift
//  Attestation
//
//  Created by Alexis Bridoux on 02/11/2020.
//

import SwiftUI

struct ProfilePicker: View {

    @EnvironmentObject var profile: Profile

    var body: some View {
        HStack {
            Text(profile.fullName)
            Spacer()
            Image(systemName: "person.fill")
        }
    }
}

struct ProfilePicker_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfilePicker()
            ProfilePicker()
                .padding(20)
                .preferredColorScheme(.dark)
                .background(Color.systemBackground)
        }
    }
}
