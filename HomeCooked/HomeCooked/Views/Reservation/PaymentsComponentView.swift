//
//  PaymentsComponentView.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/4/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct PaymentsComponentView: View {
    let reservation: Reservation
    init(reservation: Reservation) {
        self.reservation = reservation
    }
    var body: some View {
        VStack(alignment: .leading) {
            SectionTitle("Payments")
            Text("Confirmation code: \(reservation.id)")
            Text("Card: \(reservation.payment_info)")
//            Text("Total: \(reservation.total)")
        }
    }
}

struct PaymentsComponentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsComponentView(reservation: reservation1)
    }
}
