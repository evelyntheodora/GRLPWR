//
//  testing.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 09/06/23.
//

import SwiftUI

struct testing: View {
    var activity: Activity
    var body: some View {
        Button("press"){
            ForEach(0..<activityData.count, id: \.self) { indexAct in
//                print(activity.tags[])
            }
            print(activity.tags[0])
        }
    }
}

struct testing_Previews: PreviewProvider {
    static var previews: some View {
        testing(activity: Activity (judul: "Matrix", deskripsi: "ini adalah deskripsi dari aktivitas yang akan dilakukan", image: "", tags: ["Ulangan Harian","Ujian Akhir", "Matematika", "Science"], isTodayActivity: true))
    }
}
