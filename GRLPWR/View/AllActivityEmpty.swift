//
//  AllActivityEmpty.swift
//  GRLPWR
//
//  Created by Raja Monica on 04/06/23.
//

import SwiftUI

struct AllActivityEmpty: View {
    @State var searchText = ""
    
    var body: some View {
        ZStack{
            Color(red: 240/255, green: 240/255, blue: 240/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                VStack{
                    Image("allactivityimage")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                
                .padding()
                
                Spacer()
                
                VStack{
//                    ZStack{
//                        SearchBar(searchText: $searchText)
//                        Text("Find Your Activity \(searchText)")
//                            .foregroundColor(.gray)
//                            .padding(.trailing, 170)
//
//                         Image(systemName: "line.3.horizontal.decrease.circle.fill")
//                             .foregroundColor(.gray)
//                             .padding(.leading, 320)
//                    }
                    ZStack{
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .padding(.trailing)
                            TextField("Find Your Activity", text: $searchText)
                            
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .foregroundColor(.gray)
                               
                                
                        }
                        .frame(width: 360)
                        .padding(5)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding()
                    }
                }
                
                VStack{
                    HStack{
                        Text("0 Activity")
                            .font(.system(size: 25,weight: .semibold))
                        Spacer()
                        
                        DropDownView()
                            
                    }
                    
                    .padding(.all)
                    Spacer()
                }
                
                VStack{
                    Image(systemName: "doc.text.magnifyingglass")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray).opacity(0.5)
                    Text("Your Activity is Empty")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(.gray).opacity(0.7)
                        
                }
                .padding(.bottom,220)
                Spacer()
                
            }
            
        }
    }
    
    struct DropDownView: View{
        
        @State var isSelected = false
        @State var selectionTitle = ""
        @State var selectedRowId = 0
        
        var body: some View{
            VStack{
                HStack{
                    
                    Text(selectionTitle)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                    
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(.system(size: 15, weight: .semibold))
                        .rotationEffect(.degrees(isSelected ? -180 : 0))
                }
                .padding(.horizontal)
                .foregroundColor(.black)
                
                if isSelected {
                    Divider()
                        .background(.white)
                        .padding(.horizontal)
                    
                    VStack(spacing: 8){
                        DropDownMenuItem(isSelected: $isSelected, selectionTitle: $selectionTitle, selectionId: $selectedRowId, item: .init(id: 1, title: "Upcoming", onSelect: {}))
                        Divider()
                            .background(.white)
                            .padding(.horizontal)
                        DropDownMenuItem(isSelected: $isSelected, selectionTitle: $selectionTitle, selectionId: $selectedRowId, item: .init(id: 2, title: "Recent", onSelect: {}))
                        Divider()
                            .background(.white)
                            .padding(.horizontal)
                        DropDownMenuItem(isSelected: $isSelected, selectionTitle: $selectionTitle, selectionId: $selectedRowId, item: .init(id: 3, title: "Done", onSelect: {}))
                    }
                }
                
            }
            
            .frame(width: 150)
            .padding(12)
            
            .cornerRadius(12)
            .onTapGesture {
                isSelected.toggle()
            }
            .onAppear{
                selectedRowId = 1
                selectionTitle = "Upcoming"
                
            }
           
        }
    }
}
struct DropDownItem: Identifiable{
    let id: Int
    let title: String
    let onSelect: () -> Void
}

struct DropDownMenuItem: View{
    @Binding var isSelected: Bool
    @Binding var selectionTitle: String
    @Binding var selectionId: Int
    let item: DropDownItem
    
    var body: some View{
        
        Button(action: {
            isSelected  = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                selectionId = item.id
            }
            selectionTitle = item.title
            item.onSelect()
        }){
            HStack{
                Image(systemName: "checkmark")
                    .font(.system(size: 14, weight: .bold))
                    .opacity(selectionId == item.id ? 1 : 0)
                Text(item.title)
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                Spacer()
                //kalo ada image
               // item.iconImage
              
            }
            
            .padding(.horizontal)
            .foregroundColor(.black)
        }
    }
}

struct AllActivityEmpty_Previews: PreviewProvider {
    static var previews: some View {
        AllActivityEmpty()
    }
}
