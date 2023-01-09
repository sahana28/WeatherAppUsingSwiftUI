//
//  WeatherView.swift
//  WeatherAppUsingSwiftUI
//
//  Created by Sahana  Rao on 08/01/23.
//

import SwiftUI

struct WeatherView: View {
    var weather : ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading,spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today is \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                
                .frame(maxWidth: .infinity,alignment: .leading)
                Spacer()
                VStack {
                    HStack {
                        VStack {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                                .font(.system(size: 20))
                            
                        }
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:350 )
                        
                    } placeholder: {
                       ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .bold()
                        .padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer.low", value: weather.main.tempMin.roundDouble() + "°", name: "Min Temp")
                        Spacer()
                        WeatherRow(logo: "thermometer.high", value: weather.main.tempMax.roundDouble() + "°", name: "Max Temp")
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", value: weather.wind.speed.roundDouble(), name: "Wind Speed")
                        Spacer()
                        WeatherRow(logo: "humidity", value: "\(weather.main.humidity.roundDouble())%", name: "Humidity")
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor(Color(hue: 0.656, saturation:0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20.0)
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation:0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}



