//
//  Splitter.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/12.
//

import SwiftUI

struct Splitter: View {
    var body: some View {
        HStack(spacing: 0) {
            Color.gray.opacity(0.5).frame(height: 1)
            Text("Show Steps")
                .foregroundColor(Color("title2"))
                .font(.footnote)
                .fontWeight(.medium)
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .background {
                    RoundedRectangle(cornerRadius: 20).foregroundColor(.gray.opacity(0.2))
                }
            Color.gray.opacity(0.5).frame(height: 1)
        }
    }
}

struct Splitter_Previews: PreviewProvider {
    static var previews: some View {
        Splitter()
    }
}
