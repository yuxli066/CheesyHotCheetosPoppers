//
//  ContentView.swift
//  countryInfo
//
//  Created by Leo Li on 5/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: Color.blue, bottomColor:Color(.lightBlue))
            VStack {
                CityTextView(CityName: "Leos City, CA")
                MainWeatherView(
                    iconString: "cloud.sun.fill",
                    temp: 80
                )
                
                HStack(spacing: 10) {
                    DateView(day: "MON", imageName: "cloud.sun.fill", temp: 60)
                    DateView(day: "TUE", imageName: "cloud.sun.fill", temp: 60)
                    DateView(day: "WED", imageName: "cloud.sun.fill", temp: 60)
                    DateView(day: "THU", imageName: "cloud.sun.fill", temp: 60)
                    DateView(day: "FRI", imageName: "cloud.sun.fill", temp: 60)
                }
                Spacer()
                
                Button {
                    print("hi")
                } label: {
                    WeatherButton(
                        text: "Change Date Time",
                        foregroundColor: Color.blue,
                        backgroundColor: Color.white
                    )
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct DateView: View {
    
    var day: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 1) {
            Text("\(day)")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding(.top)
            Image(systemName: "\(imageName)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            Text("\(temp)°")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var CityName: String
    var body: some View {
        Text("\(CityName)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

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

struct MainWeatherView: View {
    
    var iconString: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "\(iconString)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
