//
//  ManagedObjectConvertible.swift
//  ArWall
//
//  Created by Aleksey Kornienko on 08/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import CoreData

protocol ManagedObjectConvertible {
    associatedtype ManagedObject: NSManagedObject, ManagedObjectProtocol
    
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject?
}
