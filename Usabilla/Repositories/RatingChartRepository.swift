//
//  File.swift
//  Usabilla
//
//  Created by Aleksey Kornienko on 17/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

class RatingChartRepository {
    private let worker: CoreDataWorker<FeedbackManagedObject, Feedback>
    
    init(with worker: CoreDataWorker<FeedbackManagedObject, Feedback>) {
        self.worker = worker
    }
    
    func ratings(completion: @escaping (_ values: [Double]) -> Void) {
        worker.get(completion: { (feedbacks: [Feedback]) in
            let count = feedbacks
                .map({ $0.rating })
                .compactMap{ $0 }
                .reduce(into: [:]) { counts, rating in
                    counts[rating, default: 0] += 1.0
            }

            completion(count.values.sorted())
        })
    }
}
