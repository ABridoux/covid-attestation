//
//  QRCodeService.swift
//  Attestation
//
//  Created by Alexis Bridoux on 03/11/2020.
//

import UIKit
import CoreImage.CIFilterBuiltins

enum QRCodeService {

    static let context = CIContext()
    static let filter = CIFilter.qrCodeGenerator()

    static func generate(from string: String) -> UIImage {
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
}
