//
//  ActivityCardView.swift
//  GRLPWR
//
//  Created by Evelyn Theodora Siswanto on 01/06/23.
//

import SwiftUI

struct TagView: View {
    var tagName: String
    var body: some View {
        HStack {
            Image(systemName: "tag.fill")
            Text(tagName)
        }
        .padding(4)
        .background()
        .cornerRadius(5)
    }
}

struct ActivityCardView: View {
    var activity: Activity
    
    var body: some View {
        HStack (alignment: .top, spacing: 0) {
            if activity.isTodayActivity {
                Rectangle()
                    .cornerRadius(15)
                    .frame(width: 66, height: 66)
                    .padding(.trailing, 16)
            }
            
            VStack (alignment: .leading, spacing: 0) {
                HStack {
                    Text(activity.judul)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .font(.title2)
                .padding(.bottom, 4)
                
                Text(activity.deskripsi)
                    .lineLimit(2)
                    .font(.subheadline)
                    .padding(.bottom, 6)
                
                HStack {
                    ForEach(0..<2) { index in
                        TagView(tagName: activity.tags[index])
                    }
                    
                    if activity.tags.count > 2 {
                        Text("\(activity.tags.count-2)+")
                    }
                }
                .font(.caption)
                
                if !activity.isTodayActivity {
                    Rectangle()
                        .cornerRadius(15)
                        .frame(minWidth: 134, maxWidth: .infinity, minHeight: 132, maxHeight: 133)
                        .padding(.top, 16)
                }
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.gray)
        .cornerRadius(12)
    }
}

struct ActivityCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCardView(activity: Activity (judul: "Matrix", deskripsi: "ini adalah deskripsi dari aktivitas yang akan dilakukan agar jadi pintar matrix kok ga panjang lagi", image: "", tags: ["Ulangan Harian","Ujian Akhir", "Tag1", "Tag2"], isTodayActivity: false))
    }
}
