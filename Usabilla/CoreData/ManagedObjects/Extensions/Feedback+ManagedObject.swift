//
//  Feedback+ManagedObject.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 15/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import CoreData

extension Feedback: ManagedObjectConvertible {
    typealias ManagedObject = FeedbackManagedObject
    
    func toManagedObject(in context: NSManagedObjectContext) -> FeedbackManagedObject? {
        guard let entity = NSEntityDescription.entity(forEntityName: "FeedbackManagedObject", in: context) else {
            return nil
        }
        
        let managedObject = FeedbackManagedObject(entity: entity, insertInto: context)
        
        managedObject.id = self.id
        managedObject.siteId = self.siteId
        managedObject.status = self.status
        managedObject.rating = self.rating as NSNumber?
        managedObject.email = self.email
        managedObject.computedLocation = self.computedLocation
        managedObject.comment = self.comment
        managedObject.labels = self.labels
        managedObject.creationDate = self.creationDate as NSDate?
        
        managedObject.geo = self.geo?.toManagedObject(in: context)
        managedObject.images = self.images?.toManagedObject(in: context)
        managedObject.computedBrowser = self.computedBrowser?.toManagedObject(in: context)
        
        managedObject.geo?.addToFeedback(managedObject)
        managedObject.images?.addToFeedback(managedObject)
        managedObject.computedBrowser?.addToFeedback(managedObject)
        
        return managedObject
    }
}

extension FeedbackManagedObject: ManagedObjectProtocol {
    typealias Entity = Feedback
    
    func toEntity() -> Feedback? {
        return Feedback(
            id: self.id,
            siteId: self.siteId,
            status: self.status,
            rating: self.rating as? Int,
            images: self.images?.toEntity(),
            geo: self.geo?.toEntity(),
            email: self.email,
            computedLocation: self.computedLocation,
            computedBrowser: self.computedBrowser?.toEntity(),
            comment: self.comment,
            labels: self.labels,
            creationDate: self.creationDate as Date?
        )
    }
}
