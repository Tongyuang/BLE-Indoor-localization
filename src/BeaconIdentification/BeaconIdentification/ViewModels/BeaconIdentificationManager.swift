//
//  BeaconIdentificationManager.swift
//  BeaconIdentification
//
//  Created by Derrick Ding on 3/8/23.
//

import Foundation
import CoreLocation

class BeaconIdentificationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    // TODO: For now we only filter beacons for demo use.
    let demoBeaconUUIDs = [
        UUID(uuidString: "69043C8E-1B9F-4E57-9631-DF5600D412B5"),
        UUID(uuidString: "9BEB772E-C041-47DD-A829-425570ED07E3"),
        UUID(uuidString: "EAFA9100-196A-4C73-B3AE-4AD987D7C6B0"),
    ]
    
    let demoBeaconUUIDToNames: [UUID: String] = [
        UUID(uuidString: "69043C8E-1B9F-4E57-9631-DF5600D412B5")!: "Toilet Paper",
        UUID(uuidString: "9BEB772E-C041-47DD-A829-425570ED07E3")!: "Toilet",
        UUID(uuidString: "EAFA9100-196A-4C73-B3AE-4AD987D7C6B0")!: "Lock",
    ]
    
    @Published var identifiedDemoBeacons: [UUID: ToiletBeacon] = [:]
    
    var locationManager = CLLocationManager()
    
    func preparePublishedBeacons() {
        for demoBeaconUUID in demoBeaconUUIDs {
            identifiedDemoBeacons[demoBeaconUUID!] = ToiletBeacon(
                beaconName: "",
                beaconUUID: demoBeaconUUID!,
                rssi: 0,
                estDistance: 0.0
            )
        }
    }
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        
        preparePublishedBeacons()
    }
    
    // For preview usage
    init(forPreview preview: String) {
        super.init()
        
        identifiedDemoBeacons[UUID(uuidString: "69043C8E-1B9F-4E57-9631-DF5600D412B5")!] = ToiletBeacon(
            beaconName: "Test Toilet Paper",
            beaconUUID: UUID(uuidString: "69043C8E-1B9F-4E57-9631-DF5600D412B5")!,
            rssi: -31,
            estDistance: 3.0
        )
        
        identifiedDemoBeacons[UUID(uuidString: "69043C8E-1B9F-4E57-9631-DF5600D412B5")!] = ToiletBeacon(
            beaconName: "Test Lock",
            beaconUUID: UUID(uuidString: "69043C8E-1B9F-4E57-9631-DF5600D412B5")!,
            rssi: -17,
            estDistance: 3.0
        )
        
        identifiedDemoBeacons[UUID(uuidString: "69043C8E-1B9F-4E57-9631-DF5600D412B5")!] = ToiletBeacon(
            beaconName: "Test Hand Cleaner",
            beaconUUID: UUID(uuidString: "69043C8E-1B9F-4E57-9631-DF5600D412B5")!,
            rssi: -66,
            estDistance: 3.0
        )
    }
    
    func calcEstDistance(fromProximity proximity: CLProximity) -> Double {
        switch proximity {
        case .far:
            return Double.random(in: 5.0 ..< 8.0)
        case .unknown:
            return 99.99
        case .immediate:
            return Double.random(in: 0.0 ..< 2.0)
        case .near:
            return Double.random(in: 2.0 ..< 5.0)
        @unknown default:
            return 0.0
        }
    }
    
    func startSearchingBeacons() {
        locationManager.requestWhenInUseAuthorization()
        
        let beacon1_constraint = CLBeaconIdentityConstraint(uuid: demoBeaconUUIDs[0]!)
        let beacon2_constraint = CLBeaconIdentityConstraint(uuid: demoBeaconUUIDs[1]!)
        let beacon3_constraint = CLBeaconIdentityConstraint(uuid: demoBeaconUUIDs[2]!)
        
        let beacon1_region = CLBeaconRegion(
            beaconIdentityConstraint: beacon1_constraint,
            identifier: demoBeaconUUIDs[0]!.uuidString
        )
        let beacon2_region = CLBeaconRegion(
            beaconIdentityConstraint: beacon2_constraint,
            identifier: demoBeaconUUIDs[1]!.uuidString
        )
        let beacon3_region = CLBeaconRegion(
            beaconIdentityConstraint: beacon3_constraint,
            identifier: demoBeaconUUIDs[2]!.uuidString
        )
        
        self.locationManager.startMonitoring(for: beacon1_region)
        self.locationManager.startMonitoring(for: beacon2_region)
        self.locationManager.startMonitoring(for: beacon3_region)
        
        
    }
    
    // MARK: - Location Manager Delegate
    /// - Tag: didDetermineState
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        let beaconRegion = region as? CLBeaconRegion
        if state == .inside {
            // Start ranging when inside a region.
            manager.startRangingBeacons(satisfying: beaconRegion!.beaconIdentityConstraint)
        } else {
            // Stop ranging when not inside a region.
            manager.stopRangingBeacons(satisfying: beaconRegion!.beaconIdentityConstraint)
        }
    }
    
    /// - Tag: didRange
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        
        if !beacons.isEmpty {
            print(beacons[0].accuracy)
        }
        
        // Update identified beacons
        for beacon in beacons {
            let identifiedBeacon = ToiletBeacon(
                beaconName: self.demoBeaconUUIDToNames[beacon.uuid]!,
                beaconUUID: beacon.uuid,
                rssi: beacon.rssi,
                estDistance: calcEstDistance(fromProximity: beacon.proximity)
            )
            
            self.identifiedDemoBeacons[beacon.uuid] = identifiedBeacon
        }
    }
}
