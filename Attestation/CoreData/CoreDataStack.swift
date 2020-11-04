//
// covid-attestation
// Copyright (c) Alexis Bridoux & contributors 2020
// GPL license, see LICENSE file for details

import Foundation
import CoreData

/// Holds the NSManagedContext and other relevant instances
private struct CoreDataStack {
    private let modelName: String

    fileprivate init(modelName: String) {
        self.modelName = modelName
    }

    fileprivate lazy var storeContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: modelName)

        container.loadPersistentStores { (_, error) in
            // https://www.hackingwithswift.com/read/38/6/how-to-make-a-core-data-attribute-unique-using-constraints
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            if let error = error as NSError? {
                print("Unresolved error \(error) while instantiating the sore container. \(error.userInfo)")
            }
        }
        return container
    }()

    fileprivate lazy var managedContext: NSManagedObjectContext = { storeContainer.viewContext }()
}

private var skyTStack = CoreDataStack(modelName: "Attestation")

@propertyWrapper
struct Context {

    /// To be used for mocking purposes in tests
    var mockContext: NSManagedObjectContext?

    var wrappedValue: NSManagedObjectContext { mockContext ?? skyTStack.managedContext }

    var projectedValue: Context { self }
}
