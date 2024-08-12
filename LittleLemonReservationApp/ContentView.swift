//
//  ContentView.swift
//  LittleLemonReservationApp
//
//  Created by Navya Vohra on 2024-08-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LocationsView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Locations")
                }
            
            Text("Reservation")
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Reservation")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
