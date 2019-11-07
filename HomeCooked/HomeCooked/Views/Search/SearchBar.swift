//
//  SearchBar.swift
//  HomeCooked
//
//  Created by Rachel Kim on 11/7/19.
//  Copyright © 2019 67442. All rights reserved.
//

import SwiftUI

//https://stackoverflow.com/questions/56608996/swiftui-search-in-list-headers
struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar,
                      context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct SearchView2: View {
    
    @State private var searchQuery: String = ""
    
    var body: some View {
        List {
            Section(header: SearchBar(text: self.$searchQuery)) {
                ForEach(Array(1...100).filter {
                    self.searchQuery.isEmpty ?
                        true :
                        "\($0)".contains(self.searchQuery)
                }, id: \.self) { item in
                    Text("\(item)")
                }
            }
        }
    }
}
//
//https://medium.com/rosberryapps/swiftui-hackathon-1dff2fec5732
//
//struct SearchBarView: View {
//    @State var text: String
//    @State var isActiveBar: Bool
//    var body: some View {
//        HStack(alignment: VerticalAlignment.center, spacing: 0, content: {
//            ContainerView(text: $text, isActiveField: $isActiveBar)
//
//            Button(action: {
//                self.isActiveBar = false
//                self.text = ""
//            }) {
//                Text("Search")
//            }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: isActiveBar ? 16 : -52))
//        })//.animation(.basic)
//    }
//}
//
//
//struct ContainerView: View {
//    @State var text: String
//    @State var isActiveField: Bool
//    var body: some View {
//        ZStack {
//            HStack {
//                Image(systemName: "magnifyingglass")
//                TextField($text, placeholder: Text("Search photos"), onEditingChanged: { isActive in
//                    self.isActiveField == isActive
//                })
//                if !text.isEmpty {
//                    Button(action: {
//                        self.text = ""
//                    }) {
//                        Image(systemName: "multiply.circle")
//                    }
//                }
//            }
//        }
//    }
//}
//

struct SearchView2_Previews: PreviewProvider {
    static var previews: some View {
                SearchView2()
//        SearchBarView()
    }
}
