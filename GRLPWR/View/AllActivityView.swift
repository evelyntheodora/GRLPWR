//
//  AllActivityView.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 03/06/23.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var searchText: String

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var searchText: String

        init(searchText: Binding<String>) {
            _searchText = searchText
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.searchText = searchText
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(searchText: $searchText)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchText
    }
}

struct AllActivityView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack  {
            HStack  {
                Button {
                    
                }
            label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .padding()
                }
           
                Text ("All Activities")
                    .padding(.leading, 100)
        
            }
            .frame(maxWidth: .infinity, alignment: .leading)
           
            Image(systemName: "magnifyingglass.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 169, height: 190)
               
            ZStack {
                       SearchBar(searchText: $searchText)
                       Text("Find Your Activity \(searchText)")
                           .foregroundColor(.gray)
                           .padding(.trailing, 170)
                
                
                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.leading, 320)
                   }
            
            Spacer()
            
        
        }
    }
}

struct AllActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AllActivityView()
    }
}
