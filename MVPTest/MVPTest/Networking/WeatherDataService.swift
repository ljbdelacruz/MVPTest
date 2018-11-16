//
//  WeatherDataService.swift
//  MVPTest
//
//  Created by Lainel John Dela Cruz on 15/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Moya


//i cannot seem to make it work on api with parameters doing some more research
enum WeatherDataService{
    static private let apiKey = "12245dace437ebfa6c35ad749bab3633"
    case GetCity(city:String)
    case GetByLonLat(lon:Float, lat:Float)
}

extension WeatherDataService: TargetType{
    var baseURL: URL {
        return URL(string: "https://samples.openweathermap.org/data/2.5")!;
    }
    var path: String {
        switch self {
        case .GetByLonLat(let lon,let lat):
//            return "/weather?lon=\(lon)&lat=\(lat)&appid=\(WeatherDataService.apiKey)";
            return "/weather"
        case .GetCity(let city):
            return "weather?q=\(city)&appid=\(WeatherDataService.apiKey)";
        }
    }
    var method: Moya.Method {
        switch self{
        case .GetByLonLat(_,_), .GetCity(_):
            return .get;
        }
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        switch self {
        case .GetByLonLat(let lon, let lat):
//            return .requestParameters(parameters: ["":""], encoding: JSONEncoding.default);
            return .requestParameters(parameters: ["lat":lat, "lon":lon, "appid":WeatherDataService.apiKey], encoding: URLEncoding.default);
        case .GetCity(let city):
            return .requestParameters(parameters: ["q":city, "appid":WeatherDataService.apiKey], encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]? {
        switch self {
            case .GetByLonLat(_, _), .GetCity(_):
                return ["Content-Type":"application/json"];
        }
    }
    
    
}



