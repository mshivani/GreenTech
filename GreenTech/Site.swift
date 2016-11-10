//
//  Site.swift
//  GreenTech
//
//  Created by Jeremy Ake on 10/26/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//

import Foundation
import Firebase

struct Site {
    
    let key: String
    let title: String
    let lat: Double
    var long: Double
    let ref: FIRDatabaseReference?
    
    
    init(title: String, lat: Double, long: Double, key: String = "") {
        self.key = key
        self.title = title
        self.lat = lat
        self.long = long
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        lat = snapshotValue["lat"] as! Double
        long = snapshotValue["long"] as! Double
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "title": title,
            "lat": lat,
            "long": long
        ]
    }
    
}
