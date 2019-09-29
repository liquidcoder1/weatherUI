//
//  weather.swift
//  WeatherAppLC
//
//  Created by John Kulimushi on 22/09/2019.
//  Copyright © 2019 John Kulimushi. All rights reserved.
//

import Foundation
import Combine

struct Weather: Hashable, Identifiable {
    let id: Int
    let day: String
    let weatherIcon: String
    let currentTemp: String
    let minTemp: String
    let maxTemp: String
    let color: String
    
    static var sampleData: [Weather] {
        return [
            Weather(id: 1, day: "Monday", weatherIcon: "sun.max", currentTemp: "50", minTemp: "52", maxTemp: "69", color: "mainCard"),
            Weather(id: 2, day: "Tuesday", weatherIcon: "sun.dust", currentTemp: "33", minTemp: "52", maxTemp: "69", color: "tuesday"),
            Weather(id: 3, day: "Wednesday", weatherIcon: "cloud.sun.rain", currentTemp: "38", minTemp: "52", maxTemp: "59", color: "wednesday"),
            Weather(id: 4, day: "Thursday", weatherIcon: "cloud.sun.bolt", currentTemp: "33", minTemp: "52", maxTemp: "60", color: "thursday"),
            Weather(id: 5, day: "Friday", weatherIcon: "sun.haze", currentTemp: "40", minTemp: "52", maxTemp: "69", color: "friday"),
            Weather(id: 6, day: "Saturday", weatherIcon: "sun.dust", currentTemp: "50", minTemp: "52", maxTemp: "38", color: "saturday"),
            Weather(id: 7, day: "Sunday", weatherIcon: "sun.max", currentTemp: "50", minTemp: "52", maxTemp: "69", color: "sunday")
        ]
    }
}
