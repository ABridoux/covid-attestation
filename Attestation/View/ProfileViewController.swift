//
//  ProfileViewController.swift
//  Attestation
//
//  Created by Alexis Bridoux on 01/11/2020.
//

import UIKit
import SnapKit
import SwiftUI
import CombineCocoa

class ProfileViewController: AbstractViewController {

    // MARK: - Properties

    @Context var context

    let profile = Profile()
    var formView: UIView?
    let saveButton = UIBarButtonItem(title: "Ajouter", style: .done, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)


    // MARK: - Life cycle

    override func setupViews() {
        super.setupViews()

        title = "Nouveau profil"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.leftBarButtonItem = cancelButton

        let formViewController = UIHostingController(rootView: ProfileFormView(profile: profile))
        addChild(formViewController)
        view.addSubview(formViewController.view)
        formView = formViewController.view
    }

    override func setupLayout() {
        formView?.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    override func setupSubscriptions() {

        saveButton.tapPublisher
            .sink { (_) in
                do {
                    try self.saveProfile()
                    self.dismiss(animated: true)
                } catch {
                    self.validationAlert(title: "Erreur dans le formulaire", message: error.localizedDescription)
                }
            }
            .store(in: &subscriptions)

        cancelButton.tapPublisher
            .sink { [unowned self] (_) in self.dismiss(animated: true) }
            .store(in: &subscriptions)
    }


    // MARK: - Functions

    func saveProfile() throws {
        try profile.createEntity(in: context)
        try context.save()
    }

    func validationAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
