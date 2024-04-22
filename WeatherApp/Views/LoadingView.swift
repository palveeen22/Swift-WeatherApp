//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Alvin Putra Pratama on 21/04/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black) // Menambahkan latar belakang hitam
            .foregroundColor(.white) // Mengatur warna teks menjadi putih
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
