//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import UIKit
import CoreImage.CIFilterBuiltins

enum QRCodeService {

    static let context = CIContext()
    static let filter = CIFilter.qrCodeGenerator()

    static func generate(from string: String) -> UIImage {
        // https://www.hackingwithswift.com/books/ios-swiftui/generating-and-scaling-up-a-qr-code
        let data = Data(string.utf8)

        filter.setValue(data, forKey: "inputMessage")

        guard
            let outputImage = filter.outputImage,
            let cgimg = context.createCGImage(outputImage, from: outputImage.extent)
        else {
            return UIImage(systemName: "xmark.circle") ?? UIImage()
        }

        return UIImage(cgImage: cgimg)
    }

    static func generate(from profile: Profile, attestation: Attestation) -> UIImage {
        let string = qrString(from: profile, attestation: attestation)
        return generate(from: string)
    }

    static func qrString(from profile: Profile, attestation: Attestation) -> String {
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

    static func qrLabel(from profile: Profile, attestation: Attestation) -> String {
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
}
