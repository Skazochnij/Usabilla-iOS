//
//  Storable.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

protocol Storable where T: ManagedObjectConvertible {
    associatedtype T
    
    var worker: CoreDataWorker<T.ManagedObject, T> { get }
    
    func upsert(entity: [T])
    func get(completion: @escaping([T]) -> Void)
}
