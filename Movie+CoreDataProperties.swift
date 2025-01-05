//
//  Movie+CoreDataProperties.swift
//  MovieApp
//
//  Created by Muhammad Haroon Iqbal on 05/01/2025.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: Double
    @NSManaged public var overview: String?
    @NSManaged public var photo: Data?
    @NSManaged public var date: Date?

}

extension Movie : Identifiable {

}
