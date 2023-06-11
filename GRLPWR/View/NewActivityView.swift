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
            ScrollView{
                VStack(alignment: .leading, spacing: 30){
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
        //                DatePicker(selection: $dateNow, in: ...Date.now, displayedComponents: .date)
                        DatePicker(selection: $dateNow, in: ...Date.now, displayedComponents: .date) {
                            Text("Set date")
                        }
                        Button("Set tag") {
                            addTag.toggle()
                        }
                        .sheet(isPresented: $addTag) {
                            ViewTag(addTag: $addTag)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    VStack {
                        Text("Guidelines")
                            .font(.system(.title3))
                            .fontWeight(.bold)
                        List {
//                            NavigationLink
                        }
                    }
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

struct GuidelinesView: View {
    var body: some View {
        NavigationView {
            VStack {
//                ForEach
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
            VStack(spacing: 50){
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
                        .padding(10)
//                        .border(.cyan)
                        .background(ttags[indexTag].isSelected ? Color.gray : Color.white)
                        .cornerRadius(50)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.gray, lineWidth: 2)
                        }
                        
                    }
                    
                }
            }
            
            HStack {
                Button("Edit tags") {
                    
                }
                Spacer()
                Button("New tag") {
                    
                }
            }
            .padding()
            
                //==========================================================================
//                ForEach(theTags, id: \.self) { theTag in //isinya theTag adalah Tag(name:isSelected:), bukan angka indexππ
//                    Button {
//                        theTag.isSelected = theTag.isSelected ? false : true
//                        ini errornya -> Cannot assign to property: 'theTag' is a 'let' constant
//                    } label: {
                        
//                    }

//                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        addTag.toggle()
                    }
                }
            }
            
            
        }
        .navigationTitle("Set tag")
        
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
