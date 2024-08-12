//
//  ReservationFormView.swift
//  LittleLemonReservationApp
//
//  Created by Navya Vohra on 2024-08-13.
//
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let area: String
    let phone: String
}

struct LocationsView: View {
    let locations = [
        Location(name: "Las Vegas", area: "Downtown", phone: "(702) 555-9898"),
        Location(name: "Los Angeles", area: "North Hollywood", phone: "(213) 555-1453"),
        Location(name: "Los Angeles", area: "Venice", phone: "(310) 555-1222"),
        Location(name: "Nevada", area: "Venice", phone: "(725) 555-5454"),
        Location(name: "San Francisco", area: "North Beach", phone: "(415) 555-1345"),
        Location(name: "San Francisco", area: "Union Square", phone: "(415) 555-9813")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Image("LittleLemonLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 150)
                            .padding()
                
                Text("Select a location")
                    .font(.headline)
                    .padding()
                
                List(locations) { location in
                    NavigationLink(destination: ReservationFormView(location: location)) {
                        VStack(alignment: .leading) {
                            Text(location.name)
                                .font(.headline)
                            Text("\(location.area)  –  \(location.phone)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Locations")
        }
    }
}

struct LogoView: View {
    var body: some View {
        Image("little_lemon_logo")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .padding()
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
