//
//  WeatherRow.swift
//  WeatherAppUsingSwiftUI
//
//  Created by Sahana  Rao on 09/01/23.
//

import SwiftUI

struct WeatherRow: View {
    var logo : String
    var value : String
    var name : String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.system(.title))
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50.0)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(name)
                    .font(.body)
                Text(value)
                    .bold()
                    .font(.system(.title))
              }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", value: "8°", name: "Feels like")
    }
}
