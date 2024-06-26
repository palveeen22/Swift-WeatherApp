//
//  ContentView.swift
//  WeatherApp
//
//  Created by Alvin Putra Pratama on 21/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView().task {
                        do {
                            weather = try await weatherManager
                                .getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                        } catch {
                            print("Error getting weather : \(error)")
                        }
                    }
                }
//                Text("Your Cordinate are : \(location.longitude),\(location.latitude)")
            } else {
                if locationManager.isLoading{
                    LoadingView()
                } else {
                    WelcomeView()
                         .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 1.0, saturation: 0.043, brightness: 0.337))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
