//
//  ProfileViewModdel.swift
//  Attestation
//
//  Created by Alexis Bridoux on 01/11/2020.
//

import SwiftUI
import CoreData

final class Profile: ObservableObject {

    // MARK: - Constants

    typealias Entity = ProfileEntity

    // MARK: - Properties

    @Context static var context
    var entity: ProfileEntity?

    @Published var firstName = ""
    @Published var lastName = ""
    @Published var birthDate = Date()
    @Published var birthCity = ""
    @Published var street = ""
    @Published var city = ""
    @Published var zipCode = ""

    var fullName: String {
        if firstName.isEmpty {
            return "Ajouter un profil"
        }

        return firstName + " " + lastName
    }

    // MARK: - Initialisation

    init() {}

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    private init(entity: ProfileEntity) {
        self.entity = entity
        firstName = entity.firstName ?? ""
        lastName = entity.lastName ?? ""
        birthDate = entity.birthDate ?? .now
        birthCity = entity.birthCity ?? ""
        street = entity.street ?? ""
        city = entity.city ?? ""
        zipCode = entity.zipCode == 0 ? "" : entity.zipCode.description
    }

    static func fetch(in context: NSManagedObjectContext = context) -> Profile {
        let request: NSFetchRequest<ProfileEntity> = ProfileEntity.fetchRequest()

        var foundEntity: ProfileEntity?
        do {
            let results = try context.fetch(request)
            foundEntity = results.first
        } catch {
            print("Unable to fetch the context")
        }

        if let entity = foundEntity {
            return Profile(entity: entity)
        } else {
            let entity = Entity(context: context)
            return Profile(entity: entity)
        }
    }

    // MARK: - Functions (CoreDataCandy 🤍)

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

    func save() throws {
        try validate()

        entity?.firstName = firstName
        entity?.lastName = lastName
        entity?.birthDate = birthDate
        entity?.birthCity = birthCity
        entity?.street = street
        entity?.city = city
        entity?.zipCode = Int32(zipCode) !! "The profile validation did not catch an empty zip code"

        do {
            try entity?.managedObjectContext?.save()
        } catch {
            print("An error occured while saving the context. \(error), \(error.localizedDescription)")
        }
    }
}
