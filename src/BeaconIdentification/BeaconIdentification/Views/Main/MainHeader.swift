//
//  MainHeader.swift
//  BeaconIdentification
//
//  Created by Derrick Ding on 3/8/23.
//

import SwiftUI

struct MainHeader: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 30)
            
            VStack(alignment: .leading) {
                Text("PROTOTYPE")
                    .font(.system(size: 36, weight: .bold))
                Text("USING RAW DATA")
                    .font(.system(size: 24, weight: .ultraLight))
                Text("FROM BEACONS")
                    .font(.system(size: 24, weight: .ultraLight))
            }
            .frame(width: 219, height: 89)
            
            Spacer()
        }
    }
}

struct MainHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainHeader()
    }
}
