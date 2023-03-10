//
//  BeaconInfoView.swift
//  BeaconIdentification
//
//  Created by Derrick Ding on 3/9/23.
//

import SwiftUI

struct BeaconInfoView: View {
    var toiletBeacon: ToiletBeacon
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            VStack(alignment: .leading) {
                Text(toiletBeacon.beaconName)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(width: 334, height: 29, alignment: .leading)
                
                Text(String(toiletBeacon.beaconUUID.uuidString))
                    .font(.system(size: 8, weight: .ultraLight))
            }
            
            Spacer()
            
            HStack {
                Text("RSSI")
                    .font(.system(size: 24, weight: .semibold))
                Text(String(toiletBeacon.rssi))
                    .font(.system(size: 24, weight: .ultraLight))
                    .frame(width: 50, alignment: .leading)
                
                Text("EST. DIST.")
                    .font(.system(size: 24, weight: .semibold))
                Text(String(format: "%.2f", toiletBeacon.estDistance) + " m")
                    .font(.system(size: 24, weight: .ultraLight))
                    .frame(width: 95, alignment: .leading)
            }
            .frame(width: 334, height: 30, alignment: .leading)
            
            Spacer()
        }
        .frame(width: 360, height: 100)
        .background(Color(hex: "#787880").opacity(0.2))
        .cornerRadius(15)
    }
}

struct BeaconInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let simulatedToiletBeacon = ToiletBeacon(
            beaconName: "Toilet Paper Beacon",
            beaconUUID: UUID(uuidString: "EAFA9100-196A-4C73-B3AE-4AD987D7C6B0")!,
            rssi: -65, estDistance: 1.5)
        
        BeaconInfoView(toiletBeacon: simulatedToiletBeacon)
    }
}
