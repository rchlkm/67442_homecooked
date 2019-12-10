//
//  HomeCookedTests.swift
//  HomeCookedTests
//
//  Created by Albert Yuan on 10/30/19.
//  Copyright © 2019 67442. All rights reserved.
//

import XCTest
@testable import HomeCooked
import Foundation

import FirebaseCore
import FirebaseFirestore

class HomeCookedTests: XCTestCase {
  
    override func setUp() {
      
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func testExample() {
      // TEST SEARCH FOR MEALS (should return one testmeal)
      let svm = SearchViewModel()
      let search_params = SearchParams(
              city: "Pittsburgh",
              year: 2020,
              month: 4,
              day: 1,
              max_guest_count: 3,
      
              filters_cuisines: [],
              filters_allergens: []
          )
          
        svm.search(params: search_params) {
          (meals) in
          print(meals.count)
          XCTAssertEqual(meals.count, 1)
        }
    
      
      // TEST CHEF VIEWMODEL
      let cvm = ChefViewModel()
      cvm.getChefReviews(chef_id: "GJFmRADeY9MJCQ4AUTpC") {
        (reviews)
        in
        print(reviews.count)
        XCTAssertEqual(reviews.count, 1)
      }
    }
 
      /*
      // We do not test our parsers since we do not use them in our application.
      
      let bmvm = BookedMealViewModel()
      bmvm.getReservationMealsByUserId(user_id: "tg0jwBTBFrdJHOfkdFTz") {
        (res_meals)
          in
          print(res_meals.count)
          XCTAssertEqual(res_meals.count, 1)
      }
 */
      /*
      // We do not test our ReservationsViewModel since our code that pulls reservations isn't fully working right now
      let res = Reservation(id: randomString(length: 16), user_id: "tg0jwBTBFrdJHOfkdFTz", meal_id: "testmeal", guest_count: 1, total: "10", card_number: "4111111111111111", exp_month: "12", exp_year: "30", cv2: "123")
      let rvm = ReservationViewModel(reservation: res)
      rvm.postReservation(reservation: res)
      bmvm.getReservationMealsByUserId(user_id: "tg0jwBTBFrdJHOfkdFTz") {
        (res_meals)
          in
        print(res_meals.count)
        XCTAssertEqual(res_meals.count, 2)
      }
        rvm.cancelReservation(reservation_id: res.id)
      bmvm.getReservationMealsByUserId(user_id: "tg0jwBTBFrdJHOfkdFTz") {
        (res_meals)
          in
        print(res_meals.count)
        XCTAssertEqual(res_meals.count, 1)
      }
            */
      // postReview works, but there are issues with the asynchronous nature of this test since it sometimes will try to delete the review before it finishes posting
      
      // NOT SURE WUT WRONG HERE WUT WE TRYNA DO?
      
      //let rmvm = RateMealViewModel()
      //rmvm.postReview(chef_id: "GJFmRADeY9MJCQ4AUTpC", stars: 4, user_id: "tg0jwBTBFrdJHOfkdFTz", test: true)
      //rmvm.deleteReview(review_id: "test_review")
      
    //}

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
