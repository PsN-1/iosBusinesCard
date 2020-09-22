//
//  DataEntryView.swift
//  BusinessCard
//
//  Created by Pedro Neto on 14/09/20.
//  Copyright © 2020 Pedro Neto. All rights reserved.
//

import SwiftUI


struct PrimaryLabel: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    let label: String
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(height: 50)
                .overlay(
                    HStack {
                        Text(label)
                            .italic()
                            .padding(.horizontal)
                        if text.isEmpty { placeholder }
                        TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                    })
                .padding(.horizontal)
        }
    }
}


//
//struct PrimaryLabel: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//
//            .padding(.all)
//            .font(Font.system(size: 15, weight: .medium, design: .serif))
//            .foregroundColor(Color.black)
//            .background(RoundedRectangle(cornerRadius: 25))
//            .foregroundColor(Color.white)
//            .padding(.horizontal)
//            .multilineTextAlignment(TextAlignment.center)
//    }
//}
