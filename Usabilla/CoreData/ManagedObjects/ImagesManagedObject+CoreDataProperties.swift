//
//  ImagesManagedObject+CoreDataProperties.swift
//  
//
//  Created by Aleksey Kornienko on 17/06/2018.
//
//

import Foundation
import CoreData


extension ImagesManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImagesManagedObject> {
        return NSFetchRequest<ImagesManagedObject>(entityName: "ImagesManagedObject")
    }

    @NSManaged public var cropped: ImageManagedObject?
    @NSManaged public var detail: ImageManagedObject?
    @NSManaged public var feedback: NSSet?
    @NSManaged public var grid: ImageManagedObject?
    @NSManaged public var list: ImageManagedObject?
    @NSManaged public var screenshot: ImageManagedObject?
    @NSManaged public var thumbnail: ImageManagedObject?

}

// MARK: Generated accessors for feedback
extension ImagesManagedObject {

    @objc(addFeedbackObject:)
    @NSManaged public func addToFeedback(_ value: FeedbackManagedObject)

    @objc(removeFeedbackObject:)
    @NSManaged public func removeFromFeedback(_ value: FeedbackManagedObject)

    @objc(addFeedback:)
    @NSManaged public func addToFeedback(_ values: NSSet)

    @objc(removeFeedback:)
    @NSManaged public func removeFromFeedback(_ values: NSSet)

}
