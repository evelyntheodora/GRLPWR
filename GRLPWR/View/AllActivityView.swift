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
//                VStack {
//                    Image("orange-guy-all-activity")
//                    Text("Your Activity is empty")
//                        .foregroundColor(Color.theme.emptyGray)
//                }
//                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                VStack{
                //                        ForEach untuk activity
                    ForEach(0..<activityData.count, id: \.self) { index in
                        if !activityData[index].isTodayActivity {
                            ActivityCardView(activity: activityData[index])
                        }
                    }
                    .padding(.bottom)
                }
            }
            .padding()
        }
        .navigationBarTitle("All Activity")
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

extension Color {
    static let theme = AppColor()
}

struct AppColor {
    let bgCol = Color("bg")
    let emptyGray = Color("empty-gray")
}

struct AllActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AllActivityView()
//            .colorScheme(.dark)
    }
}
