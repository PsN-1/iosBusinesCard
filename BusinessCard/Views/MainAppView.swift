//
//  ContentView.swift
//  BusinessCard
//
//  Created by Pedro Neto on 14/09/20.
//  Copyright © 2020 Pedro Neto. All rights reserved.
//

import SwiftUI

struct MainAppView: View {
    var body: some View {
        NavigationView {
            
            ZStack {
                Color(red: 0.09, green: 0.63, blue: 0.52, opacity: 1.0)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Image("PedroNeto")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 5)
                    )
                    Text("Pedro Neto")
                        .font(Font.custom("Pacifico-Regular", size: 40))
                        .bold()
                        .foregroundColor(.white)
                    Text("IOS Developer")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                    Divider()
                    InfoView(text: "+55 (12) 9 9661-3271", imageName: "phone.fill")
                    InfoView(text: "Pedro.santosnt@hotmail.com", imageName: "envelope.fill")
                    NavigationLink(destination: CreateCardView()) {
                        Text("Create Your Own Card")
                            .foregroundColor(.black)
                            .padding(.all)
                        
                    }
                    .background(RoundedRectangle(cornerRadius: 25))
                    .foregroundColor(.green)
                    .navigationBarHidden(true)
                }
                
            }
            .navigationBarTitle("My Card", displayMode: .inline)
            
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}


