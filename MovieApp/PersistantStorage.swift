//
//  PersistantStorage.swift
//  MovieApp
//
//  Created by Muhammad Haroon Iqbal on 05/01/2025.
//

import Foundation
import CoreData

final class PersistantStorage {
    
    private init() {}
    
    static let shared = PersistantStorage()
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MovieApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            print("Database PATH")
            print(storeDescription.url)
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
