//
//  FeedbackChartRepository.swift
//  Usabilla
//
//  Created by Aleksey Kornienko on 17/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

class FeedbackChartRepository {
    private static let desktopsTitle = "Desktops"
    private static let mobilesTitle = "Mobiles"
    
    private static let desktops = ["win", "mac"]
    private static let mobiles = ["ios", "android"]
    
    private let worker: CoreDataWorker<FeedbackManagedObject, Feedback>
    
    init(with worker: CoreDataWorker<FeedbackManagedObject, Feedback>) {
        self.worker = worker
    }
    
    func info(for state: FeedbackState, completion: @escaping (_ value: Double?, _ from: String?) -> Void) {
        let predicate: NSPredicate = NSPredicate(format: "rating \(state == .positive ? ">=" : "<") %d", 3)
        worker.get(with:predicate, completion: { (feedbacks: [Feedback]) in
            var platforms: [String:Int] = [:]
            
            _ = feedbacks
                .map({ $0.computedBrowser?.platform })
                .compactMap{ $0 }
                .reduce(into: [:]) { counts, word in
                    let lowercased = word.lowercased()
                    if (FeedbackChartRepository.desktops.contains(where: lowercased.contains)) {
                        platforms[FeedbackChartRepository.desktopsTitle, default: 0] += 1
                    } else if (FeedbackChartRepository.mobiles.contains(where: lowercased.contains)) {
                        platforms[FeedbackChartRepository.mobilesTitle, default: 0] += 1
                    }
                }
            
            let max = platforms.max { a, b in a.value < b.value }
            guard let entry = max else {
                completion(nil, nil)
                return
            }
            let value = (Double(entry.value) / Double(platforms.values.reduce(0,+)) * 100)
            
            completion(value.roundToPlaces(places: 1), entry.key)
        })
    }
}
