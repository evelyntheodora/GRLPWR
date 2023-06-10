//
//  ReflectionView2.swift
//  GRLPWR
//
//  Created by Raja Monica on 03/06/23.
//

import SwiftUI

struct ReflectionView2: View {
    @State var selectedReflection2 = true
    var body: some View {
        NavigationView{
            ZStack{
                Color("yellow")
                    .edgesIgnoringSafeArea(.all)
                
            VStack{
                VStack{
                    Image("reflection")
                    
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding()
                }
                VStack{
                    Text("How would you rate")
                    Text("the output of this student?")
                    
                }
                //.padding()
                .fontWeight(.bold)
                .font(.title2)
                VStack{
                    RadioButtonTest2()
                }
                
                VStack{
                    HStack{
                        Circle()
                            .frame(width: 12,height: 12)
                            .foregroundColor(.gray).opacity(0.5)
                        Circle()
                            .frame(width: 12,height: 12)
                            .foregroundColor(.gray)
                        Circle()
                            .frame(width: 12,height: 12)
                            .foregroundColor(.gray).opacity(0.5)
                        Circle()
                            .frame(width: 12,height: 12)
                            .foregroundColor(.gray).opacity(0.5)
                        
                        
                    }
                    .padding()
                    
                }
                // Spacer()
                .padding()
                VStack{
                    //                    Button(action: {
                    //                    }, label: {
                    //                        Text("Next")
                    //                            .font(.headline)
                    //                            .fontWeight(.semibold)
                    //                            .foregroundColor(.white)
                    //                            .padding()
                    //                            .padding(.horizontal,145)
                    //                            .background(Color.gray
                    //                                .cornerRadius(12))
                    //                    })
                    NavigationLink(
                        destination:
                            ReflectionView3()
                            .navigationTitle("Reflection")
                        ,
                        label: {
                            Text("Next")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.horizontal,145)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color(red: 235/255, green: 130/255, blue: 91/255)))
                        })
                    
                }
                
                
                
            }
        }
        }
    }
}

struct RadioButton2<Tag, CircleButton, Label>: View
where Tag: Hashable, CircleButton : View, Label : View {
    
    let tag: Tag
    @Binding var selection: Tag?
    @ViewBuilder let button: (Bool) -> CircleButton
    @ViewBuilder let label:() -> Label
    
    var body: some View{
        Button {
            selection = tag
        } label: {
            HStack{
                button(selection == tag)
                label()
                    
            }
            
           
        }
        .padding()
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      //  .padding()
        
              .background(.white)
              .cornerRadius(12)
        Spacer()
    }
       
}


struct RadioButtonGroup2<Tag, CircleButton, Label>: View
where Tag : Hashable, CircleButton : View, Label : View {
  @Binding var selection: Tag?
  let orientation: Orientation
  let tags: [Tag]
  @ViewBuilder let button: (Bool) -> CircleButton
  @ViewBuilder let label: (Tag) -> Label

  var body: some View {
    if orientation == .horizonal {
      HStack(alignment: .top) {
        radioButtons
      }
    } else {
      VStack(alignment: .leading) {
        radioButtons
      }
    }
          
  }
       
  @ViewBuilder private var radioButtons: some View {
    ForEach(tags, id: \.self) { tag in
      RadioButton2(tag: tag, selection: $selection, button: button) {
        label(tag)
      }
    }
  }

  enum Orientation {
    case horizonal, vertical
  }
}

struct RadioButtonTest2: View {
  @State private var selection: Option?

  var body: some View {
    VStack {
      RadioButtonGroup2(selection: $selection,
                       orientation: .vertical,
                       tags: Option.allCases,
                       button: { isSelected in
        ZStack {
          Circle()
                .foregroundColor(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.black,lineWidth:1.5))
            .frame(width: 20, height: 20)
            
          if isSelected {
            Circle()
              .foregroundColor(Color.black)
              .frame(width: 14, height: 14)
          }
        }
      },
                       label: { tag in
        Text("\(tag.description)")
          
      })
      
      
//      Text("The selection is: \(selection?.description ?? "None")")
//        .frame(maxWidth: .infinity)
      .padding()
      
        
    }
    
    
  }
        
  enum Option: CaseIterable, CustomStringConvertible {
    case first, second, third

    var description: String {
      switch self {
      case .first:
        return "Very well, students were able to reach the objective of this activity that were set in the beginning of the class"
      case .second:
        return "Good, students were able to gain some knowledge from this activity but didn't reach the goal completely"
      case .third:
        return "Poor, most of the students weren't able to reach the objective of this activity"
      }
    }
          
  }
}



struct ReflectionView2_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionView2()
    }
}

