//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Chan, Teki on 05/07/2022.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String
    @NSManaged public var director: String
    @NSManaged public var year: Int16

}

extension Movie : Identifiable {

}
