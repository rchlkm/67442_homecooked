//
//  SearchView.swift
//  HomeCooked
//
//  Created by Albert Yuan on 10/30/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

struct SearchView: View {
  @State private var city: String = ""
  
  var body: some View {
    NavigationView {
      ScrollView {
        Spacer()
        
      }.navigationBarTitle("Search", displayMode: .large)
    }
  }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
