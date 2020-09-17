//
//  DataEntryView.swift
//  BusinessCard
//
//  Created by Pedro Neto on 14/09/20.
//  Copyright © 2020 Pedro Neto. All rights reserved.
//

import SwiftUI



struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            
            .padding(.all)
            .font(Font.system(size: 15, weight: .medium, design: .serif))
            .foregroundColor(Color.black)
            .background(RoundedRectangle(cornerRadius: 25))
            .foregroundColor(Color.white)
            .padding(.horizontal)
            .multilineTextAlignment(TextAlignment.center)
    }
}
