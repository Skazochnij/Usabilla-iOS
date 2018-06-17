//
//  FeedbackManagedObject+CoreDataProperties.swift
//  
//
//  Created by Aleksey Kornienko on 17/06/2018.
//
//

import Foundation
import CoreData


extension FeedbackManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FeedbackManagedObject> {
        return NSFetchRequest<FeedbackManagedObject>(entityName: "FeedbackManagedObject")
    }

    @NSManaged public var comment: String?
    @NSManaged public var computedLocation: String?
    @NSManaged public var creationDate: NSDate?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var labels: [String]?
    @NSManaged public var rating: NSNumber?
    @NSManaged public var siteId: String?
    @NSManaged public var starred: Bool
    @NSManaged public var status: String?
    @NSManaged public var computedBrowser: ComputedBrowserManagedObject?
    @NSManaged public var geo: GeoManagedObject?
    @NSManaged public var images: ImagesManagedObject?

}
