//
//  ComputedBrowser+CoreData.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 15/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import CoreData

extension ComputedBrowser: ManagedObjectConvertible {
    typealias ManagedObject = ComputedBrowserManagedObject
    
    func toManagedObject(in context: NSManagedObjectContext) -> ComputedBrowserManagedObject? {
        guard let entity = NSEntityDescription.entity(forEntityName: "ComputedBrowserManagedObject", in: context) else {
            return nil
        }
        let managedObject = ComputedBrowserManagedObject(entity: entity, insertInto: context)
        
        managedObject.browser = self.browser
        managedObject.version = self.version
        managedObject.platform = self.platform
        managedObject.fullBrowser = self.fullBrowser
        
        return managedObject
    }
}

extension ComputedBrowserManagedObject: ManagedObjectProtocol {
    typealias Entity = ComputedBrowser
    
    func toEntity() -> ComputedBrowser? {
        return ComputedBrowser(
            browser: self.browser,
            version: self.version,
            platform: self.platform,
            fullBrowser: self.fullBrowser
        )
    }
}
