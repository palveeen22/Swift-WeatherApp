//
//  ContentView.swift
//  WeatherApp
//
//  Created by Alvin Putra Pratama on 21/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
           WelcomeView()
                .environmentObject(locationManager)
        }
        .background(Color(hue: 1.0, saturation: 0.043, brightness: 0.337))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
