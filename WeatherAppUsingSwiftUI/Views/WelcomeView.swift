//
//  WelcomeView.swift
//  WeatherAppUsingSwiftUI
//
//  Created by Sahana  Rao on 07/01/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationMangager : LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing : 20) {
                Text("Welcome to the Weather app")
                    .bold().font(.title)
                Text("Please share your location to get the weather updates")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationMangager.requestLocation()
            }
            .cornerRadius(8.0)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity )
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
