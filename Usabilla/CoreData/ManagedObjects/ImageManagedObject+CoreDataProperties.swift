//
//  ImageManagedObject+CoreDataProperties.swift
//  
//
//  Created by Aleksey Kornienko on 17/06/2018.
//
//

import Foundation
import CoreData


extension ImageManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageManagedObject> {
        return NSFetchRequest<ImageManagedObject>(entityName: "ImageManagedObject")
    }

    @NSManaged public var height: NSNumber?
    @NSManaged public var uri: String?
    @NSManaged public var url: String?
    @NSManaged public var width: NSNumber?
    @NSManaged public var cropped: NSSet?
    @NSManaged public var detail: NSSet?
    @NSManaged public var grid: NSSet?
    @NSManaged public var list: NSSet?
    @NSManaged public var screenshot: NSSet?
    @NSManaged public var thumbnail: NSSet?

}

// MARK: Generated accessors for cropped
extension ImageManagedObject {

    @objc(addCroppedObject:)
    @NSManaged public func addToCropped(_ value: ImagesManagedObject)

    @objc(removeCroppedObject:)
    @NSManaged public func removeFromCropped(_ value: ImagesManagedObject)

    @objc(addCropped:)
    @NSManaged public func addToCropped(_ values: NSSet)

    @objc(removeCropped:)
    @NSManaged public func removeFromCropped(_ values: NSSet)

}

// MARK: Generated accessors for detail
extension ImageManagedObject {

    @objc(addDetailObject:)
    @NSManaged public func addToDetail(_ value: ImagesManagedObject)

    @objc(removeDetailObject:)
    @NSManaged public func removeFromDetail(_ value: ImagesManagedObject)

    @objc(addDetail:)
    @NSManaged public func addToDetail(_ values: NSSet)

    @objc(removeDetail:)
    @NSManaged public func removeFromDetail(_ values: NSSet)

}

// MARK: Generated accessors for grid
extension ImageManagedObject {

    @objc(addGridObject:)
    @NSManaged public func addToGrid(_ value: ImagesManagedObject)

    @objc(removeGridObject:)
    @NSManaged public func removeFromGrid(_ value: ImagesManagedObject)

    @objc(addGrid:)
    @NSManaged public func addToGrid(_ values: NSSet)

    @objc(removeGrid:)
    @NSManaged public func removeFromGrid(_ values: NSSet)

}

// MARK: Generated accessors for list
extension ImageManagedObject {

    @objc(addListObject:)
    @NSManaged public func addToList(_ value: ImagesManagedObject)

    @objc(removeListObject:)
    @NSManaged public func removeFromList(_ value: ImagesManagedObject)

    @objc(addList:)
    @NSManaged public func addToList(_ values: NSSet)

    @objc(removeList:)
    @NSManaged public func removeFromList(_ values: NSSet)

}

// MARK: Generated accessors for screenshot
extension ImageManagedObject {

    @objc(addScreenshotObject:)
    @NSManaged public func addToScreenshot(_ value: ImagesManagedObject)

    @objc(removeScreenshotObject:)
    @NSManaged public func removeFromScreenshot(_ value: ImagesManagedObject)

    @objc(addScreenshot:)
    @NSManaged public func addToScreenshot(_ values: NSSet)

    @objc(removeScreenshot:)
    @NSManaged public func removeFromScreenshot(_ values: NSSet)

}

// MARK: Generated accessors for thumbnail
extension ImageManagedObject {

    @objc(addThumbnailObject:)
    @NSManaged public func addToThumbnail(_ value: ImagesManagedObject)

    @objc(removeThumbnailObject:)
    @NSManaged public func removeFromThumbnail(_ value: ImagesManagedObject)

    @objc(addThumbnail:)
    @NSManaged public func addToThumbnail(_ values: NSSet)

    @objc(removeThumbnail:)
    @NSManaged public func removeFromThumbnail(_ values: NSSet)

}
