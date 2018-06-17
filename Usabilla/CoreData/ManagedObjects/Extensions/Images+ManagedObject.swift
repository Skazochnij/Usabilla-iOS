//
//  Images+ManagedObject.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 16/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import CoreData

extension Images: ManagedObjectConvertible {
    typealias ManagedObject = ImagesManagedObject
    
    func toManagedObject(in context: NSManagedObjectContext) -> ImagesManagedObject? {
        guard let entity = NSEntityDescription.entity(forEntityName: "ImagesManagedObject", in: context) else {
            return nil
        }
        
        let managedObject = ImagesManagedObject(entity: entity, insertInto: context)
    
        managedObject.screenshot = self.screenshot?.toManagedObject(in: context)
        managedObject.thumbnail = self.thumbnail?.toManagedObject(in: context)
        managedObject.cropped = self.cropped?.toManagedObject(in: context)
        managedObject.grid = self.grid?.toManagedObject(in: context)
        managedObject.list = self.list?.toManagedObject(in: context)
        managedObject.detail = self.detail?.toManagedObject(in: context)
        
        managedObject.grid?.addToGrid(managedObject)
        managedObject.list?.addToList(managedObject)
        managedObject.detail?.addToDetail(managedObject)
        managedObject.cropped?.addToCropped(managedObject)
        managedObject.thumbnail?.addToThumbnail(managedObject)
        managedObject.screenshot?.addToScreenshot(managedObject)
        
        return managedObject
    }
}

extension ImagesManagedObject: ManagedObjectProtocol {
    typealias Entity = Images
    
    func toEntity() -> Images? {
        return Images(
            screenshot: self.screenshot?.toEntity(),
            thumbnail: self.thumbnail?.toEntity(),
            cropped: self.cropped?.toEntity(),
            grid: self.grid?.toEntity(),
            list: self.list?.toEntity(),
            detail: self.detail?.toEntity()
        )
    }
}
