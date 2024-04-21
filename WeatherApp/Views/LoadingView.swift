//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Alvin Putra Pratama on 21/04/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
