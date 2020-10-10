//
//  CreateCardView.swift
//  BusinessCard
//
//  Created by Pedro Neto on 14/09/20.
//  Copyright © 2020 Pedro Neto. All rights reserved.
//

//MARK: - TODO
/*
 TODO:
 Add alert if any field is left blank
 Add Image Picker from library or camera - Done!
 Add tap to copy email or phone to clipboard - Done!
 Change button appearence - Done!
 Option to Change background color
 Add share button
 Add QR Code func
 Fix keyboard Overlay
 */




import SwiftUI

struct CreateCardView: View {
    @State public var name: String = ""
    @State private var job: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    //MARK: - TODO
    /*
     TODO:
     Add alert if any field is left blank
     Add Image Picker from library or camera - Done!
     Add tap to copy email or phone to clipboard - Done!
     Change button appearence - Done!
     Option to Change background color
     Add share button
     Add QR Code func
     Fix keyboard Overlay
     */
    

    @State var navigationBar = false
    @State private var bgColor = Color(red: 0.09, green: 0.63, blue: 0.52, opacity: 1.0)
    
    var body: some View {
        
        ZStack {
            bgColor
//            Color(red: 0.09, green: 0.63, blue: 0.52, opacity: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    
                    if image != nil {
                        image?
                            .resizable()
                            .modifier(ImageLabel())
                    } else {
                        Image(systemName: "person.badge.plus")
                            .resizable()
                            .modifier(ImageLabel())
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                
                PrimaryLabel(text: $name, label: "Name: ")
                PrimaryLabel(text: $job, label: "Job: ")
                PrimaryLabel(text: $phone, label: "Phone: ")
                PrimaryLabel(text: $email, label: "E-mail: ")
                
                if #available(iOS 14.0, *) {
                    ColorPicker("Choose the background color", selection: $bgColor, supportsOpacity: false)
                } else {
                    // Fallback on earlier versions
                }
                
                NavigationLink(destination: FinalCardView(name: name, job: job, phone: phone, email: email, image: image, bgColor: bgColor) ){
                    Text("Submit")
                        .foregroundColor(.black)
                        .padding(.all)
                }
                .background(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(Color.gray)
                .navigationBarHidden(navigationBar)
                
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            
        }
//        .onTapGesture(perform: {
//            self.navigationBar.toggle()
//        })
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
}

struct ImageLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            
//                        .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .foregroundColor(.white)
            .padding(.all)
            .clipShape(Rectangle())
            .overlay(
                Rectangle().stroke(Color.white, lineWidth: 5)
            )
    }
}

struct CreateCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCardView()
    }
}


//TextField("Name", text: $name)
//    .modifier(PrimaryLabel())

//CustomTextField(
//                            placeholder: Text("placeholder").foregroundColor(.red),
//                            text: $email
//                        )
//----------------------
//
//struct CustomTextField: View {
//    var placeholder: Text
//    @Binding var text: String
//    var editingChanged: (Bool)->() = { _ in }
//    var commit: ()->() = { }
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//            if text.isEmpty { placeholder }
//            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
//
//        }
//    }
//}
