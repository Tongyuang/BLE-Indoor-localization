//
//  BeaconIdentificationApp.swift
//  BeaconIdentification
//
//  Created by Derrick Ding on 3/8/23.
//

import SwiftUI

@main
struct BeaconIdentificationApp: App {
    let beaconIdentificationManager: BeaconIdentificationManager
    
    init() {
        self.beaconIdentificationManager = BeaconIdentificationManager()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(beaconIdentificationManager: self.beaconIdentificationManager)
        }
    }
}
