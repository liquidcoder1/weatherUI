//
//  ContentView.swift
//  WeatherAppLC
//
//  Created by John Kulimushi on 22/09/2019.
//  Copyright © 2019 John Kulimushi. All rights reserved.
//

import SwiftUI

struct WeatherApp: View {
    @State private var selected = 0
    @State private var weather =  Weather(id: 1, day: "Monday", weatherIcon: "sun.max", currentTemp: "50", minTemp:"52", maxTemp: "69", color: "mainCard")
    @State private var showDetails = false
    @State private var sampleData = Weather.sampleData
    private var detailSize = CGSize(width: 0, height: UIScreen.main.bounds.height)

    var body: some View {
        
        VStack {
            NavBarView(country: "Bahamas")
            Picker("", selection: $selected){
                Text("Today").tag(0)
                Text("Tomorrow").tag(1)
            }.pickerStyle(SegmentedPickerStyle() )
                .padding(.horizontal)
            
            
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    MainCardView(weather: $weather)
                        .cornerRadius(CGFloat(20))
                        .padding()
                        .shadow(color: Color(self.weather.color)
                            .opacity(0.4), radius: 20, x: 0, y: 20)
                    
                    Text("Next 7 days").foregroundColor(Color("text"))
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(Weather.sampleData, id: \.id) { weather in
                                SmallCard(weather: weather).onTapGesture {
                                    withAnimation(.spring()) {
                                        self.showDetails.toggle()
                                        self.weather = weather
                                    }
                                }
                            }
                        }.frame( height: 340)
                            .padding(.horizontal)
                    }.frame( height: 350, alignment: .top)
                }
                
                DetailView(weather: self.$weather,showDetails: self.$showDetails)
                .offset( self.showDetails ? CGSize.zero : detailSize)
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct NavBarView: View {
    
    var country = "France"
    
    var body: some View{
        HStack {
            Image(systemName: "ellipsis.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
            Spacer()
            Text(country).font(.title)
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 25, height: 25)
            
        }.padding()
    }
}


struct ContentView_Previews:
PreviewProvider {
    static var previews: some View {
        WeatherApp()
    }
}
