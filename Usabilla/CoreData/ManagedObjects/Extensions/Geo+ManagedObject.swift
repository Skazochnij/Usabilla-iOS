//
//  Geo+ManagedObject.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 16/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import CoreData

extension Geo: ManagedObjectConvertible {
    typealias ManagedObject = GeoManagedObject
    
    func toManagedObject(in context: NSManagedObjectContext) -> GeoManagedObject? {
        guard let entity = NSEntityDescription.entity(forEntityName: "GeoManagedObject", in: context) else {
            return nil
        }
        
        let managedObject = GeoManagedObject(entity: entity, insertInto: context)
        
        managedObject.country = self.country
        managedObject.region = self.region
        managedObject.city = self.city
        managedObject.lat = self.lat as NSNumber?
        managedObject.lon = self.lon as NSNumber?
        
        return managedObject
    }
}

extension GeoManagedObject: ManagedObjectProtocol {
    typealias Entity = Geo
    
    func toEntity() -> Geo? {
        return Geo(
            country: self.country,
            region: self.region,
            city: self.city,
            lat: self.lat as? Double,
            lon: self.lon as? Double
        )
    }
}
