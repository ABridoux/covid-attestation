//
//  QRCodeView.swift
//  Attestation
//
//  Created by Alexis Bridoux on 04/11/2020.
//

import SwiftUI

struct QRCodeView: View {

    @EnvironmentObject var profile: Profile
    @EnvironmentObject var attestation: Attestation

    var body: some View {
        VStack {
            Image(uiImage: QRCodeService.generate(from: qrString))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
            Spacer()
                .frame(width: 0, height: 20)
            Text(label)
                .foregroundColor(.white)
                .frame(width: 350, height: 200)
        }
        .frame(width: 2000, height: 2000)
        .background(Color.black)
    }

    var label: String {
        """
        Créé le: \(attestation.qrDateString)
        Nom: \(profile.lastName)
        Prénom: \(profile.firstName)
        Naissance: \(DateFormatter.label.string(from: profile.birthDate)) à \(profile.birthCity)
        Adresse: \(profile.street) \(profile.zipCode) \(profile.city)
        Sortie: \(attestation.qrDateString)
        Motifs: \(attestation.exitReason!.lowercased())
        """
    }

    var qrString: String {
        """
        Cree le: \(attestation.qrDateString);
        Nom: \(profile.lastName);
        Prenom: \(profile.firstName);
        Naissance: \(DateFormatter.qrDay.string(from: profile.birthDate)) a \(profile.birthCity);
        Adresse: \(profile.street) \(profile.zipCode) \(profile.city);
        Sortie: \(attestation.qrDateString);
        Motifs: \(attestation.exitReason!.lowercased())
        """
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
            .environmentObject(Profile(firstName: "Alexis", lastName: "Bridoux"))
            .environmentObject(Attestation(reason: "Travail"))
    }
}
