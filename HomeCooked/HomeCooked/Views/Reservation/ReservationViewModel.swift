//
//  ReservationViewModel.swift
//  HomeCooked
//
//  Created by Jeremy on 11/7/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation

import FirebaseCore
import FirebaseFirestore

class ReservationViewModel {
  let reservation: Reservation

  init(reservation: Reservation) {
    self.reservation = reservation
  }
  
  func postReservation(reservation: Reservation)
}
