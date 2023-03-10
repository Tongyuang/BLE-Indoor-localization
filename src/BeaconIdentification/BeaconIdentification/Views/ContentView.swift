//
//  ContentView.swift
//  BeaconIdentification
//
//  Created by Derrick Ding on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @ObservedObject var beaconIdentificationManager: BeaconIdentificationManager
    
    var body: some View {
        TabView(selection: $selection) {
            MainPage(beaconIdentificationManager: beaconIdentificationManager)
                .tag(0)
                .tabItem {
                    VStack {
                        Image(systemName: "badge.plus.radiowaves.right")
                        Text("Identification")
                    }
                }
                .onAppear() {
                    beaconIdentificationManager.startSearchingBeacons()
                }
            
            AboutPage()
                .tag(1)
                .tabItem {
                    VStack {
                        Image(systemName: "radio")
                        Text("About")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let beaconIdentificationManager = BeaconIdentificationManager(forPreview: "")
        
        ContentView(beaconIdentificationManager: beaconIdentificationManager)
    }
}
