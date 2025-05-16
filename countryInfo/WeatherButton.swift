//
//  WeatherButton.swift
//  countryInfo
//
//  Created by Leo Li on 5/16/25.
//

import SwiftUI

struct WeatherButton: View {
    var text: String
    var foregroundColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text("\(text)")
            .frame(width: 280, height: 50)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
