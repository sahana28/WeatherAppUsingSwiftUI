//
//  ContentView.swift
//  WeatherAppUsingSwiftUI
//
//  Created by Sahana  Rao on 06/01/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherservice = WeatherAPIService()
    @State var weather : ResponseBody?
    @State private var isNight = false
    var body: some View {

        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                }
                else {
                    LoadingView()
                        .task {
                            do {
                             weather = try await weatherservice.getWeatherForecast(latitude: location.latitude, longitude: location.longitude)
                            }
                            catch {
                                print("Error fetching weather :\(error)")
                            }
                        }
                }
            }
            else {
                if locationManager.isLoading {
                    LoadingView()
                }
                else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
            
        }
        .background(Color(hue: 0.656, saturation:0.787, brightness: 0.584))
        .preferredColorScheme(.dark)
        
    }
}

//struct WeatherView: View {
//    @State var temperature : Int
//    @State var dayOfTheWeek : String
//    @State var cloudImageString : String
//    var body: some View {
//        VStack(spacing:8) {
//            Text("\(temperature)°")
//                .font(.system(size: 20,weight: .medium))
//                .foregroundColor(.white)
//            Image(systemName: cloudImageString)
//                .renderingMode(.original)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 50,height: 50,alignment: .center)
//            Text(dayOfTheWeek)
//                .font(.system(size: 20,weight: .medium))
//                .foregroundColor(.white)
//            
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    @Binding var isNight : Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ?.black : .blue ,isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView : View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CityWeatherStatusView : View {
    @Binding var isNight : Bool
    var body: some View {
            VStack(spacing:10) {
                Image(systemName: isNight ? "cloud.moon.fill" : "cloud.sun.fill" )
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180,height: 180,alignment: .center)
                Text(isNight ? "25°" : "76°")
                    .font(.system(size: 70,weight: .medium ,design: .monospaced))
                    .foregroundColor(.white)
            }
            .padding(.bottom,80)
    }
}


//        ZStack {
//
//            BackgroundView(isNight: $isNight)
//
//            VStack {
//                CityTextView(cityName: "Cupertino, CA")
//
//                CityWeatherStatusView(isNight: $isNight)
//
//
//                HStack(spacing:15) {
//                    WeatherView(temperature: 34, dayOfTheWeek: "MON", cloudImageString: "cloud.sun.fill")
//                    WeatherView(temperature: 37, dayOfTheWeek: "TUE", cloudImageString: "cloud.sun.rain.fill")
//                    WeatherView(temperature: 34, dayOfTheWeek: "WED", cloudImageString: "cloud.sun.fill")
//                    WeatherView(temperature: 37, dayOfTheWeek: "THU", cloudImageString: "cloud.sun.rain.fill")
//                    WeatherView(temperature: 34, dayOfTheWeek: "FRI", cloudImageString: "cloud.sun.fill")
//
//                }
//                .padding(.bottom, 80)
//
//                Button {
//                    isNight.toggle()
//                } label: {
//                    WeatherButton(title: "Change Day Time", backgroundColor: .white, textColor: .blue)
//                }
//
//
//            }
//        }
