//
//  AboutPage.swift
//  BeaconIdentification
//
//  Created by Derrick Ding on 3/8/23.
//

import SwiftUI

struct AboutPage: View {
    var body: some View {
        VStack(spacing: 80) {
            VStack {
                Text("day FM.")
                    .font(.system(size: 36, weight: .regular))
                
                Text("B L U N A V I")
                    .font(.system(size: 24, weight: .regular))
            }
            
            VStack {
                Text("D E S I G N E D  &  E N G I N E E R E D  B Y")
                    .font(.system(size: 12, weight: .ultraLight))
                
                HStack(spacing: 2) {
                    HStack(spacing: 0.5) {
                        Text("D")
                            .font(.system(size: 10, weight: .bold))
                        Text("errick Ding | ")
                            .font(.system(size: 10, weight: .ultraLight))
                    }
                    
                    HStack(spacing: 0.5) {
                        Text("A")
                            .font(.system(size: 10, weight: .bold))
                        Text("lan Zhang | ")
                            .font(.system(size: 10, weight: .ultraLight))
                    }
                    
                    HStack(spacing: 0.5) {
                        Text("Y")
                            .font(.system(size: 10, weight: .bold))
                        Text("uang Tong | ")
                            .font(.system(size: 10, weight: .ultraLight))
                    }
                    
                    HStack(spacing: 0.5) {
                        Text("F")
                            .font(.system(size: 10, weight: .bold))
                        Text("engzhen Cui | ")
                            .font(.system(size: 10, weight: .ultraLight))
                    }
                    
                    HStack(spacing: 0.5) {
                        Text("Evie ")
                            .font(.system(size: 10, weight: .ultraLight))
                        Text("M")
                            .font(.system(size: 10, weight: .bold))
                        Text("o")
                            .font(.system(size: 10, weight: .ultraLight))
                    }
                }
            }
        }
        
        
    }
}

struct AboutPage_Previews: PreviewProvider {
    static var previews: some View {
        AboutPage()
    }
}
