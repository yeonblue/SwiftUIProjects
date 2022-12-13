//
//  LocationModel.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/13.
//

import Foundation
import MapKit

struct NationalParkLocationModel: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
