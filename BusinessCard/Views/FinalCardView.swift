//
//  FinalCardView.swift
//  BusinessCard
//
//  Created by Pedro Neto on 14/09/20.
//  Copyright © 2020 Pedro Neto. All rights reserved.
//

import SwiftUI
import MobileCoreServices

struct FinalCardView: View {
    var name: String
    var job: String
    var phone: String
    var email: String
    var image: Image?
    var bgColor: Color

    @State var navigationBar = false
    @State private var showingAlertEmail = false
    @State private var showingAlertPhone = false

    
    var body: some View {
        ZStack {
            bgColor
            .edgesIgnoringSafeArea(.all)
            VStack {
                image?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                )
                Text(name)
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text(job)
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: phone, imageName: "phone.fill")
                    .onTapGesture(count: 2) {
                        UIPasteboard.general.setValue(self.phone,
                            forPasteboardType: kUTTypePlainText as String)
                        self.showingAlertPhone = true
                    }
                    .alert(isPresented: $showingAlertPhone) {
                                Alert(title: Text("Copied!"), message: Text("Copied to Clipboard!"), dismissButton: .default(Text("Got it!")))
                            }
                
                InfoView(text: email, imageName: "envelope.fill")
                    .onTapGesture(count: 2) {
                        UIPasteboard.general.setValue(self.email,
                            forPasteboardType: kUTTypePlainText as String)
                        self.showingAlertEmail = true
                    }
                    .alert(isPresented: $showingAlertEmail) {
                                Alert(title: Text("Copied!"), message: Text("Copied to Clipboard!"), dismissButton: .default(Text("Got it!")))
                            }
                
                NavigationLink(destination: CreateCardView()) {
                    Text("")
                        .foregroundColor(.black)
                        .padding(.all)
                    
                }
                .background(RoundedRectangle(cornerRadius: 25))
                .foregroundColor(bgColor)
                .navigationBarHidden(true)
            }
            
        }
        .navigationBarHidden(navigationBar)
        .onTapGesture(perform: {
                self.navigationBar.toggle()
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FinalCardView(name: "Name", job: "Job", phone: "Phone Number", email: "Email@something.com", image: nil, bgColor: Color(red: 0.09, green: 0.63, blue: 0.52, opacity: 1.0))
    }
}


