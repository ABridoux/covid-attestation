//
//  ProfileViewModdel.swift
//  Attestation
//
//  Created by Alexis Bridoux on 01/11/2020.
//

import SwiftUI
import CoreData

final class Profile: ObservableObject {

    // MARK: - Properties

    @Published var firstName = ""
    @Published var lastName = ""
    @Published var birthDate = Date()
    @Published var birthCity = ""
    @Published var street = ""
    @Published var city = ""
    @Published var zipCode = ""

    // MARK: - Functions

    func validate() throws {
        if firstName.isEmpty {
            throw ValidationError.dataValidation(description: "Le prénom ne peut être vide")
        }
        if lastName.isEmpty {
            throw ValidationError.dataValidation(description: "Le nom ne peut être vide")
        }
        if birthCity.isEmpty {
            throw ValidationError.dataValidation(description: "La ville de naissance doit être spécifiée")
        }
        if street.isEmpty {
            throw ValidationError.dataValidation(description: "La rue doit être spécifiée")
        }
        if city.isEmpty {
            throw ValidationError.dataValidation(description: "La ville doit être spécifiée")
        }
        if zipCode.count != 5 || Int32(zipCode) == nil {
            throw ValidationError.dataValidation(description: "Le code postal doit être spécifié avec 5 chiffres")
        }
    }

    @discardableResult
    func createEntity(in context: NSManagedObjectContext) throws -> ProfileEntity {
        try validate()
        let entity = ProfileEntity(context: context)
        entity.firstName = firstName
        entity.lastName = lastName
        entity.birthDate = birthDate
        entity.birthCity = birthCity
        entity.street = street
        entity.city = city
        entity.zipCode = Int32(zipCode) !! "The validation did not catch the non-numeric zip code"
        return entity
    }
}
