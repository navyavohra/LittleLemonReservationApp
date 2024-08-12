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
            
            Button(action: validateForm) {
                Text("Confirm Reservation")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            //Alert Handling
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .navigationTitle(location.name)
    }
    
    func validateForm() {
        alertMessage = ""
        
        if name.count < 3 {
            alertMessage += "Names can only contain letters and must have at least 3 characters.\n"
        }
        
        if phone.isEmpty {
            alertMessage += "The phone number cannot be blank.\n"
        }
        
        if !isValidEmail(email) {
            alertMessage += "The e-mail is invalid and cannot be blank.\n"
        }
        
        if !alertMessage.isEmpty {
            showAlert = true
        } else {
            // Process the reservation (this part can be customized as needed)
            showAlert = true
            alertMessage = "Reservation confirmed!"
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}

struct ReservationFormView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationFormView(location: Location(name: "Las Vegas", area: "Downtown", phone: "(702) 555-9898"))
    }
}
