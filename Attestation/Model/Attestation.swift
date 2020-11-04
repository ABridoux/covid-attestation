//
//  Attestation.swift
//  Attestation
//
//  Created by Alexis Bridoux on 03/11/2020.
//

import SwiftUI
import CoreData

final class Attestation: ObservableObject {

    typealias Entity = AttestationEntity

    var entity: AttestationEntity?

    @Published var date = Date()
    @Published var exitReason: String?

    @Published var wasGenerated = false

    var qrDateString: String {
        DateFormatter.qrDay.string(from: date) + " à " + DateFormatter.qrHour.string(from: date)
    }

    var label: String {
        DateFormatter.label.string(from: date) + " à " + DateFormatter.qrHour.string(from: date)
    }

    private init(entity: AttestationEntity, wasGenerated: Bool = true) {
        self.entity = entity
        if let date = entity.exitDate {
            self.date = date
        }
        exitReason = entity.exitReason
        self.wasGenerated = wasGenerated
    }

    init(reason: String, wasGenerated: Bool = true) {
        exitReason = reason
        self.wasGenerated = wasGenerated
    }

    static func fetch(in context: NSManagedObjectContext) -> Attestation {
        let request: NSFetchRequest<Entity> = Entity.fetchRequest()

        var foundEntity: Entity?
        do {
            let results = try context.fetch(request)
            foundEntity = results.first
        } catch {
            print("Unable to fetch the context")
        }

        if let entity = foundEntity {
            return Attestation(entity: entity)
        } else {
            let entity = Entity(context: context)
            return Attestation(entity: entity, wasGenerated: false)
        }
    }

    func save() throws {

        entity?.exitDate = date
        entity?.exitReason = exitReason

        do {
            try entity?.managedObjectContext?.save()
            wasGenerated = true
        } catch {
            print("An error occured while saving the context. \(error), \(error.localizedDescription)")
        }
    }
}
