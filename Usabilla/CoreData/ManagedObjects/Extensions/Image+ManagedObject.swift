//
//  Image+ManagedObject.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 16/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import CoreData

extension Image: ManagedObjectConvertible {
    typealias ManagedObject = ImageManagedObject
    
    func toManagedObject(in context: NSManagedObjectContext) -> ImageManagedObject? {
        guard let entity = NSEntityDescription.entity(forEntityName: "ImageManagedObject", in: context) else {
            return nil
        }
        
        let managedObject = ImageManagedObject(entity: entity, insertInto: context)
        
        managedObject.uri = self.uri
        managedObject.width = self.width as NSNumber?
        managedObject.height = self.height as NSNumber?
        managedObject.url = self.url
        
        return managedObject
    }
}

extension ImageManagedObject: ManagedObjectProtocol {
    typealias Entity = Image
    
    func toEntity() -> Image? {
        return Image(
            uri: self.uri,
            width: self.width?.intValue,
            height: self.height?.intValue,
            url: self.url
        )
    }
}
