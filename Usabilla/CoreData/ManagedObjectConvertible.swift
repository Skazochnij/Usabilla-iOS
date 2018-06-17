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
//
//extension ManagedObjectConvertible {
//    func exist(in managedObjectContext: NSManagedObjectContext) -> ManagedObject? {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
//        if #available(iOS 10.0, OSX 10.12, *) {
//            fetchRequest = Self.ManagedObject.fetchRequest()
//        } else {
//            fetchRequest = NSFetchRequest(entityName: Self.ManagedObject.name)
//        }
//        var subPredicates : [NSPredicate] = []
//
//        let mirror = Mirror(reflecting: self)
//
//        for child in mirror.children {
//            guard let key = child.label else { continue }
//            let value = unwrap(child.value)
//            print("Label \(key) - \(value)")
//            subPredicates.append(NSPredicate(format: "\(key) == \(value)"))
//        }
//
//        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: subPredicates)
//
//        var results: [Self.ManagedObject] = []
//
//        do {
//            results = try managedObjectContext.fetch(fetchRequest) as! [Self.ManagedObject]
//        }
//        catch {
//            print("error executing fetch request: \(error)")
//        }
//        
//        return results.first
//    }
//
//    private func unwrap<T>(_ any: T) -> Any
//    {
//        let mirror = Mirror(reflecting: any)
//        guard mirror.displayStyle == .optional, let first = mirror.children.first else {
//            return any
//        }
//        return first.value
//    }
//}
