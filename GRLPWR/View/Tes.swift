//
//  Tes.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 10/06/23.
//

import SwiftUI

struct Tes: View {
    @State var theTags: [Tag] = [
        Tag(name: "Math", isSelected: false),
        Tag(name: "English", isSelected: false),
        Tag(name: "Geography", isSelected: false),
        Tag(name: "Physics", isSelected: false)
    ]
    
    var body: some View {
        VStack {
            ForEach(theTags.indices, id: \.self) { index in
                Button(action: {
                    theTags[index].isSelected.toggle()
                }) {
                    Text(theTags[index].name)
                        .padding()
                        .background(theTags[index].isSelected ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(5)
            }
        }
    }
    
    func toggleSelection(index: Int) {
        theTags[index].isSelected.toggle()
    }
}



struct Tes_Previews: PreviewProvider {
    static var previews: some View {
        Tes()
    }
}
