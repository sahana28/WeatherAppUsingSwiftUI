//
//  WeatherButton.swift
//  WeatherAppUsingSwiftUI
//
//  Created by Sahana  Rao on 06/01/23.
//

import SwiftUI

struct WeatherButton : View {
    var title : String
    var backgroundColor : Color
    var textColor : Color
    var body: some View {
        Text(title)
        .frame(width: 280,height: 60)
        .background(backgroundColor)
        .foregroundColor(textColor)
        .font(.system(size: 20,weight: .bold, design: .default))
        .cornerRadius(8.0)
    }
}
