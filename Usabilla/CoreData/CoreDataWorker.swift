//
//  CoreDataWorkerProtocol.swift
//  ArWall
//
//  Created by Aleksey Kornienko on 10/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import CoreData

protocol CoreDataWorkerProtocol {
    func get<Entity: ManagedObjectConvertible>(with predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, fetchLimit: Int?, completion: @escaping ([Entity]) -> Void)
    func upsert<Entity: ManagedObjectConvertible>(entities: [Entity], completion: @escaping (Error?) -> Void)
}

extension CoreDataWorkerProtocol {
    func get<Entity: ManagedObjectConvertible>(with predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil, fetchLimit: Int? = nil, completion: @escaping ([Entity]) -> Void) {
        get(with: predicate, sortDescriptors: sortDescriptors, fetchLimit: fetchLimit, completion: completion)
    }
}

class CoreDataWorker<ManagedEntity, Entity>: CoreDataWorkerProtocol where
    ManagedEntity: NSManagedObject,
    ManagedEntity: ManagedObjectProtocol,
    Entity: ManagedObjectConvertible {
    
    private let service: CoreDataServiceProtocol
    
    init(_ service: CoreDataServiceProtocol = CoreDataService.shared) {
        self.service = service
    }
    
    func get<Entity: ManagedObjectConvertible>(with predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, fetchLimit: Int?, completion: @escaping ([Entity]) -> Void) {
        service.performBackgroundTask { context in
            do {
                let fetchRequest: NSFetchRequest<NSFetchRequestResult>
                if #available(iOS 10.0, OSX 10.12, *) {
                    fetchRequest = ManagedEntity.fetchRequest()
                } else {
                    fetchRequest = NSFetchRequest(entityName: ManagedEntity.name)
                }
                fetchRequest.predicate = predicate
                fetchRequest.sortDescriptors = sortDescriptors
                if let fetchLimit = fetchLimit {
                    fetchRequest.fetchLimit = fetchLimit
                }
                let results = try context.fetch(fetchRequest) as? [ManagedEntity]
                let items: [Entity] = results?.compactMap { $0.toEntity() as? Entity } ?? []
                
                completion(items)
            } catch {
                print("Cannot fetch error: \(error)")
                completion([])
            }
        }
    }
    
    func upsert<Entity: ManagedObjectConvertible>(entities: [Entity], completion: @escaping (Error?) -> Void) {
        service.performBackgroundTask { context in
            _ = entities.compactMap({ (entity) -> Entity.ManagedObject? in
                return entity.toManagedObject(in: context)
            })
            
            do {
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
}
