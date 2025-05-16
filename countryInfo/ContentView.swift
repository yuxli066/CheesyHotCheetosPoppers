//
//  ContentView.swift
//  countryInfo
//
//  Created by Leo Li on 5/15/25.
//

import SwiftUI

struct ContentView: View {
    
    // using state decorator here so this struct holds value
    @State private var isNight:Bool = false;
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(CityName: "Leos City, CA")
                MainWeatherView(
                    iconString: isNight ? "moon.stars.fill" : "cloud.sun.fill",
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
                    isNight.toggle()
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
    
    // this means this variable is bound, mem referenced from outside of this struct.
    // not needed here, but good to have for TWO WAY DATA BINDING
    @Binding var isNight: Bool;
    
    var body: some View {
        
        let gradientColor: Gradient = isNight ? Gradient(colors: [Color.black, Color.gray]) :
            Gradient(colors: [Color.blue, Color(.lightBlue)])
        
        LinearGradient(gradient: gradientColor, startPoint: .topLeading, endPoint: .bottomTrailing)
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
