//
//  DashboardHome.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 03/06/23.
//

import SwiftUI

struct Home: View {
    @State private var selectedView: Int = 0
    
    var body: some View {
        TabView(selection: $selectedView) {
            Dashboard()
                .tabItem {
                    Image(systemName: "text.book.closed")
                    Text("Activity")
                }
                .tag(0)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
                .tag(1)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}