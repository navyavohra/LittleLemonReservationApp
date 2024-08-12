//
//  ReservationFormView.swift
//  LittleLemonReservationApp
//
//  Created by Navya Vohra on 2024-08-13.
//

import SwiftUI

struct ReservationFormView: View {
    var location: Location
    
    @State private var partySize: Int = 1
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    @State private var specialRequest: String = ""
    @State private var reservationDate = Date()
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        Form {
            Section(header: Text(location.name)) {
                Text("\(location.area)  –  \(location.phone)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Section(header: Text("Party")) {
                Stepper(value: $partySize, in: 1...20) {
                    Text("\(partySize)")
                }
            }
            
            Section {
                DatePicker("Reservation Date", selection: $reservationDate, displayedComponents: [.date, .hourAndMinute])
            }
            
            Section(header: Text("Your Information")) {
                TextField("Name", text: $name)
                TextField("Phone", text: $phone)
                TextField("E-Mail", text: $email)
                TextField("Special Request", text: $specialRequest)
            }
        }
    }
}

struct ReservationFormView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationFormView(location: Location(name: "Las Vegas", area: "Downtown", phone: "(702) 555-9898"))
    }
}
