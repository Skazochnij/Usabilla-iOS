//
//  ComputedBrowserManagedObject+CoreDataProperties.swift
//  
//
//  Created by Aleksey Kornienko on 17/06/2018.
//
//

import Foundation
import CoreData


extension ComputedBrowserManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ComputedBrowserManagedObject> {
        return NSFetchRequest<ComputedBrowserManagedObject>(entityName: "ComputedBrowserManagedObject")
    }

    @NSManaged public var browser: String?
    @NSManaged public var fullBrowser: String?
    @NSManaged public var platform: String?
    @NSManaged public var version: String?
    @NSManaged public var feedback: NSSet?

}

// MARK: Generated accessors for feedback
extension ComputedBrowserManagedObject {

    @objc(addFeedbackObject:)
    @NSManaged public func addToFeedback(_ value: FeedbackManagedObject)

    @objc(removeFeedbackObject:)
    @NSManaged public func removeFromFeedback(_ value: FeedbackManagedObject)

    @objc(addFeedback:)
    @NSManaged public func addToFeedback(_ values: NSSet)

    @objc(removeFeedback:)
    @NSManaged public func removeFromFeedback(_ values: NSSet)

}
