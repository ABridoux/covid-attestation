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
            Image(uiImage: QRCodeService.generate(from: profile, attestation: attestation))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
            Spacer()
                .frame(width: 0, height: 20)
            Text(QRCodeService.qrLabel(from: profile, attestation: attestation))
                .foregroundColor(.white)
                .frame(width: 350, height: 200)
        }
        .frame(width: 2000, height: 2000)
        .background(Color.black)
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
            .environmentObject(Profile.stub1)
            .environmentObject(Attestation(reason: "Travail"))
    }
}
