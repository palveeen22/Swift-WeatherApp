//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Alvin Putra Pratama on 21/04/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    
    var body: some View {
        VStack {
            VStack(spacing: 20, content: {
                Text("Welcome To WeatherApp").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Please share your current location for acces me!")
            }
            ).multilineTextAlignment(.center).padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.reqLocation()
            }.cornerRadius(30).symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).foregroundColor(.white).padding()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
