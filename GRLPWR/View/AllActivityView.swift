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

struct AllActivityView2: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
//            HStack  {
//                Button {
//
//                }
//            label: {
//                Image(systemName: "chevron.left")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 15, height: 15)
//                    .padding()
//                }
//
//                Text ("All Activities")
//                    .padding(.leading, 100)
//
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
           
//            Image(systemName: "magnifyingglass.circle.fill")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 169, height: 190)
               
            ZStack {
                       SearchBar(searchText: $searchText)
                       Text("Find Your Activity \(searchText)")
//                           .foregroundColor(.gray)
//                           .padding(.trailing, 170)
                
//                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
//                            .foregroundColor(.gray)
//                            .padding(.leading, 320)
                   }
    
        }
        .padding()
    }
}

struct AllActivityView: View {
    @State private var searchText = ""
    @State var activityCount: Int = 0
//    @State private var selectedStatus: String
    enum Status: String, CaseIterable {
    case Upcoming, Recent, Done
//    case Recent
//    case Done
    }
   @State var selectedStatus: Status = .Upcoming

    var bg = Color("Background")
    var body: some View {
        
        NavigationView {
            VStack {
                HStack{
    //                forCountActivity(activityCount: $activityCount)
                    Text("\(activityCount) Activities")
                        .font(.system(size: 22, weight: .bold))
                    Spacer()
                    Picker("picker", selection: $selectedStatus) {
                        ForEach(Status.allCases, id: \.self) { status in
                            Text("\(status.rawValue)")
                        }
                    }
                }
                VStack {
                    Image("orange-guy-all-activity")
                    Text("Your Activity is empty")
                        .foregroundColor(AppColor.emptyGray)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
            
        }
        .searchable(text: $searchText, prompt: "Find your activity")
    }
}

struct forCountActivity: View {
    @Binding var activityCount: Int
    
    var body: some View {
        Button("Tambah activity") {
            activityCount += 1
        }
    }
    
    //setiap activity nambah satu di sini nambah juga
    
    
}

//extension Color {
//    let backgroundCol = Color
//}

struct AppColor {
    static let bgCol = Color("bg")
    static let emptyGray = Color("empty-gray")
}

struct AllActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AllActivityView()
    }
}
