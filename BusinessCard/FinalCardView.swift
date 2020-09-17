//
//  FinalCardView.swift
//  BusinessCard
//
//  Created by Pedro Neto on 14/09/20.
//  Copyright © 2020 Pedro Neto. All rights reserved.
//

import SwiftUI

struct FinalCardView: View {
    var name: String
    var job: String
    var phone: String
    var email: String
    var image: Image?

    
    
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52, opacity: 1.0)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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
                InfoView(text: email, imageName: "envelope.fill")
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FinalCardView(name: "Name", job: "Job", phone: "Phone Number", email: "Email@something.com", image: nil)
    }
}


