//
//  NewActivityView.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 03/06/23.
//

import SwiftUI

struct NewActivityView: View {
    @State var activityTitle: String = ""
    @State var dateNow = Date.now
    @State var selectedTag: [String] = ["Ulangan"]
    @State var addTag: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Activity Title")
                    .font(.title3)
                    .fontWeight(.bold)
                TextField("Add your activity title", text: $activityTitle)
                    .textFieldStyle(.roundedBorder)
                Text("Activity Objective")
                    .font(.title3)
                    .fontWeight(.bold)
                TextField("Add your activity title", text: $activityTitle)
                    .textFieldStyle(.roundedBorder)
                DatePicker(selection: $dateNow, in: ...Date.now, displayedComponents: .date) {}
                Button("Set tag") {
                    
                }
                .sheet(isPresented: $addTag) {
                    ViewTag(addTag: $addTag)
                }
            }
        }
        .padding()
        .navigationTitle("Your Activity")
        .toolbar {
            Button("Done") {
                
            }
        }
    }
}

struct ViewTag: View {
//    @State var selectedTag: Bool
    @State var ttags = theTags
    @Binding var addTag: Bool
//    @State var isSelected: Bool = false
    
    let column: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        //        TagView(tagName: activityData[index].tags)
        NavigationView {
//            VStack {
            LazyVGrid(columns: column) {
                ForEach(ttags.indices, id: \.self) { indexTag in  //theTags.indices akan menghasilkan index dr array theTags dalam bentuk integer. sehingga indexTag berisi angka 0, 1,..
                    Button {
//                        toggleSelection(index: indexTag)
                        ttags[indexTag].isSelected.toggle()
                        print(ttags[indexTag].isSelected)
                    } label: {
                        HStack {
                            Image(systemName: "tag.fill")
                                .foregroundColor(.black)
                            Text(ttags[indexTag].name)
                                .foregroundColor(.black)
                        }
                        .frame(height: 15)
                        .padding(5)
                        .background(ttags[indexTag].isSelected ? Color.gray : Color.white)
                        .cornerRadius(50)
                    }
                    
                }
            }
            .navigationTitle("Set tag")
            
            
                
                ForEach(theTags, id: \.self) { theTag in //isinya theTag adalah Tag(name:isSelected:), bukan angka indexππ
                    Button {
//                        theTag.isSelected = theTag.isSelected ? false : true
//                        ini errornya -> Cannot assign to property: 'theTag' is a 'let' constant
                    } label: {
                        
                    }

                }
//            }
            
            
            
        }
        
    }
    
    func toggleSelection(index: Int) {
        theTags[index].isSelected.toggle()
    }
}

//struct NewActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewActivityView(addTag: false)
////        ViewTag(selectedTag: true)
//
//    }
//}
