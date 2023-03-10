//
//  MainPage.swift
//  BeaconIdentification
//
//  Created by Derrick Ding on 3/8/23.
//

import SwiftUI

struct MainPage: View {
    @ObservedObject var beaconIdentificationManager: BeaconIdentificationManager
    
    var body: some View {
        VStack(alignment: .leading) {
            MainHeader()
            
            List {
                ForEach(Array(beaconIdentificationManager.identifiedDemoBeacons.keys), id: \.self) { beaconUUID in
                    BeaconInfoView(toiletBeacon: beaconIdentificationManager.identifiedDemoBeacons[beaconUUID]!)
                }
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        let beaconIdentificationManager = BeaconIdentificationManager(forPreview: "")
        
        MainPage(beaconIdentificationManager: beaconIdentificationManager)
    }
}
