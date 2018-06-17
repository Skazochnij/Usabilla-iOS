//
//  GeoManagedObject+CoreDataProperties.swift
//  
//
//  Created by Aleksey Kornienko on 17/06/2018.
//
//

import Foundation
import CoreData


extension GeoManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeoManagedObject> {
        return NSFetchRequest<GeoManagedObject>(entityName: "GeoManagedObject")
    }

    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var lat: NSNumber?
    @NSManaged public var lon: NSNumber?
    @NSManaged public var region: String?
    @NSManaged public var feedback: NSSet?

}

// MARK: Generated accessors for feedback
extension GeoManagedObject {

    @objc(addFeedbackObject:)
    @NSManaged public func addToFeedback(_ value: FeedbackManagedObject)

    @objc(removeFeedbackObject:)
    @NSManaged public func removeFromFeedback(_ value: FeedbackManagedObject)

    @objc(addFeedback:)
    @NSManaged public func addToFeedback(_ values: NSSet)

    @objc(removeFeedback:)
    @NSManaged public func removeFromFeedback(_ values: NSSet)

}
