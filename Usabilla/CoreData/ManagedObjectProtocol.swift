//
//  ManagedObjectProtocol.swift
//  ArWall
//
//  Created by Aleksey Kornienko on 08/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import CoreData

protocol ManagedObjectProtocol {
    associatedtype Entity
    func toEntity() -> Entity?
}
