//
//  CertificateViewController.swift
//  Attestation
//
//  Created by Alexis Bridoux on 02/11/2020.
//

import UIKit
import SnapKit

final class CertificateViewController: AbstractViewController {

    let label = UILabel()

    override func setupViews() {
        super.setupViews()

        view.backgroundColor = .systemBackground

        label.text = "New certificate"
        view.addSubview(label)
    }

    override func setupLayout() {
        super.setupLayout()
        label.snp.makeConstraints { $0.centerX.centerY.equalToSuperview()  }
    }
}
