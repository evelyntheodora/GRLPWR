//
//  ActivityCardView.swift
//  GRLPWR
//
//  Created by Evelyn Theodora Siswanto on 01/06/23.
//

import SwiftUI

struct TagView: View {
    var tagName: String
//    @Binding var selectedTag: Bool
    var body: some View {
        HStack {
            Image(systemName: "tag.fill")
                .foregroundColor(.black)
            Text(tagName)
                .foregroundColor(.black)
//                .background()
        }
        .padding(5)
        .background(Color.white)
        .cornerRadius(50)
    }
}

struct ActivityCardView: View {
    var activity: Activity //tipe data struct
    
    var body: some View {
        HStack (alignment: .top, spacing: 0) {
            if Calendar.current.isDate(activity.activityDate, inSameDayAs: Date()) {
                Rectangle()
                    .cornerRadius(15)
                    .frame(width: 66, height: 66)
                    .padding(.trailing)
            }
            
            VStack (alignment: .leading, spacing: 8) {
                VStack(alignment: .leading){
                    HStack {
                        Text(activity.judul)
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .font(.title2)
                    
                    Text(activity.deskripsi)
                        .lineLimit(2)
                        .font(.footnote)
                }
                .foregroundColor(.white)
                
                
                HStack {
                    ForEach(0..<1) { index in
                        TagView(tagName: activity.tags[index])
                    }
                    
                    if activity.tags.count > 1 {
                        Text("\(activity.tags.count-1)+")
                    }
                }
                .font(.caption)
                
                if !Calendar.current.isDate(activity.activityDate, inSameDayAs: Date()) {
//                    Rectangle()
//                        .cornerRadius(15)
//                        .frame(minWidth: 134, maxWidth: .infinity, minHeight: 132, maxHeight: 133)
                    
                    Image("geoBig")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: Calendar.current.isDate(activity.activityDate, inSameDayAs: Date()) ? 130 : 265)
        .padding()
        .background(Color(Calendar.current.isDate(activity.activityDate, inSameDayAs: Date()) ? "blue2" : "blue3"))
        .cornerRadius(12)
    }
}

struct ActivityCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCardView(activity: Activity (judul: "Matrix", deskripsi: "ini adalah deskripsi dari aktivitas yang akan dilakukan agar jadi pintar matrix kok ga panjang lagi", image: "", tags: ["Ulangan Harian","Ujian Akhir", "Tag1", "Tag2"], activityDate: Date()))
//        TagView(tagName: "Ulangan Harian").colorScheme(.dark)
    }
}