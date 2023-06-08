//
//  ReflectionResult_Awesome.swift
//  GRLPWR
//
//  Created by Sha Nia Siahaan on 04/06/23.
//

import SwiftUI

struct ReflectionResult_Awesome: View {
    @State var reflection11: String = ""
    @State var reflection12: String = ""
    
    var body: some View {
        ZStack (alignment: .top) {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
            Image ("awesome")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    Text ("Awesome!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 56.0)
                        .padding()
                    
                    Text ("It seems like you had a great time with your students in this activity.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.trailing, 20.0)
                        .padding(.top, -20.0)
                        .padding()
                        .padding(.trailing, 40.0)
                    
                    Text ("Let’s share some more thoughts down here for future improvement.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, -24.0)
                        .padding()
                        .padding(.trailing, 40.0)
                }
                VStack {
                    Text("What went well in this activity?")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    TextField("Write your thought here", text: $reflection11, axis: .vertical)
                        .lineLimit(5...5)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .padding(.top, -20.0)
                }
                VStack {
                    Text("What can you do better next time?")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    TextField("Write your thought here", text: $reflection12, axis: .vertical)
                        .lineLimit(5...5)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .padding(.top, -20.0)
                }
                Spacer()
                
                Button {
                    
                }
            label: {
                Text ("Save")
                    .foregroundColor(.white)
                    .frame(maxWidth: 327, maxHeight: 45)
                    .background(Color("orange"))
                    .cornerRadius(10)
            }

            }
            
            }
        }
    }
//struct TextView: UIViewRepresentable {
//    @Binding var text: String
//    var placeholder: String
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func makeUIView(context: Context) -> UITextView {
//        let textView = UITextView()
//        textView.font = UIFont.preferredFont(forTextStyle: .body)
//        textView.delegate = context.coordinator
//        textView.layer.cornerRadius = 10
//        textView.clipsToBounds = true
//        textView.text = placeholder
//        textView.backgroundColor = UIColor.secondarySystemBackground // Change text background color to gray
//        textView.textColor = UIColor.black // Change text color to white
//
//        return textView
//    }
//
//    func updateUIView(_ uiView: UITextView, context: Context) {
//           if text.isEmpty {
//               uiView.text = placeholder
//               uiView.textColor = UIColor.placeholderText
//           } else {
//               uiView.text = text
//               uiView.textColor = UIColor.label
//           }
//       }
//
//    class Coordinator: NSObject, UITextViewDelegate {
//        var parent: TextView
//        var isEditing = true
//
//        init(_ parent: TextView) {
//            self.parent = parent
//        }
//
//        func textViewDidChange(_ textView: UITextView) {
//            parent.text = textView.text
//            textView.textColor = UIColor.label
//        }
//
//        func textViewDidBeginEditing(_ textView: UITextView) {
//            if isEditing {
//                isEditing = false
//                textView.text = ""
//                textView.textColor = UIColor.label
//            }
//        }
//
//        func textViewDidEndEditing(_ textView: UITextView) {
//            if textView.text.isEmpty {
//                isEditing = true
//                textView.text = parent.placeholder
//                textView.textColor = UIColor.placeholderText
//            }
//        }
//    }
//}
    

    
struct ReflectionResult_Awesome_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionResult_Awesome()
    }
}
