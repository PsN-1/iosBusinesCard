//
//  TestColoPickerView.swift
//  BusinessCard
//
//  Created by Pedro Neto on 10/10/20.
//  Copyright © 2020 Pedro Neto. All rights reserved.
//

import SwiftUI

struct TestColoPickerView: View {
    
    @State private var bgColor = Color.green

    
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            
            if #available(iOS 14.0, *) {
                ColorPicker("Choose the background color", selection: $bgColor, supportsOpacity: true)
            } else {
                // Fallback on earlier versions
            }
            
        }
    }
}

struct TestColoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TestColoPickerView()
    }
}
