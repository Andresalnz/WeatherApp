//
//  GeneralView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 11/1/24.
//

import SwiftUI

struct GeneralView<Content: View>: View where Content: View  {
    
    let content: Content
    
    var body: some View {
        VStack {
            content
        }
        .padding(.vertical)
    }
}

#Preview {
    GeneralView(content: Text(""))
}
