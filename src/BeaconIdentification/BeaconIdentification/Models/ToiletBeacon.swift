//
//  Beacon.swift
//  BeaconIdentification
//
//  Created by Derrick Ding on 3/8/23.
//

import Foundation
import CoreLocation

class ToiletBeacon {
    var beaconName: String  // For example, the lock beacon, the toilet paper beacon etc.
    var beaconUUID: UUID
    var rssi: Int
    var estDistance: Double
    
    init(beaconName: String, beaconUUID: UUID, rssi: Int, estDistance: Double) {
        self.beaconName = beaconName
        self.beaconUUID = beaconUUID
        self.rssi = rssi
        self.estDistance = estDistance
    }
}
