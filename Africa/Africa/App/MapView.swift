//
//  MapView.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/10.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        var mapCordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
        var mapRegion = MKCoordinateRegion(center: mapCordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocationModel] = Bundle.main.decode("locations.json")
    
    // MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            
            // static 방식으로 표시, old style로 deprecated된 방식
            // MapPin(coordinate: item.location, tint: .accentColor)
            
            // MapMarker 기본 방식
            // MapMarker(coordinate: item.location, tint: .accentColor)
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotaionView(location: item)
            }
        }
        .overlay(alignment: .top) {
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()

                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()

                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
            .background(
                Color
                    .black
                    .opacity(0.6)
                    .cornerRadius(8)
            )
            .padding(16)
        }
    }
}

// MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
