//
//  FeedbacksRepository.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

class FeedbacksRepository: Storable {
    typealias T = Feedback
    
    var worker: CoreDataWorker<FeedbackManagedObject, Feedback>
    
    init(with worker: CoreDataWorker<FeedbackManagedObject, Feedback>) {
        self.worker = worker
    }
    
    func upsert(entity: [Feedback]) {
        worker.upsert(entities: entity) { (error) in
            if let error = error {
                print("Feedbacks didn't saved. Error: \(error)")
            } else {
                print("Feedbacks saved successfully")
            }
        }
    }
    
    func get(completion: @escaping ([Feedback]) -> Void) {
        let sort = [
            NSSortDescriptor(key: "creationDate", ascending: false),
            NSSortDescriptor(key: "rating", ascending: true)
        ]
        
        worker.get(sortDescriptors: sort, completion: { (feedbacks: [Feedback]) in
            completion(feedbacks)
        })
    }
}
