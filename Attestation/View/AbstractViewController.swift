//
//  File.swift
//  Attestation
//
//  Created by Alexis Bridoux on 01/11/2020.
//

import Combine
import UIKit

class AbstractViewController: UIViewController {

    // MARK: - Properties

    var subscriptions = Set<AnyCancellable>()

    // MARK: - Life cycle

    override func viewDidLoad() {
        setupViews()
        setupLayout()
        setupSubscriptions()
    }

    func setupViews() {
        // to be overriden by subclasses
    }

    func setupLayout() {
        // to be overriden by subclasses
    }

    func setupSubscriptions() {
        // to be overriden by subclasses
    }
}
