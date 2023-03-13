//
//  MyButton.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/3/5.
//

import SwiftUI

struct MyButton: View {
    let label: String
    let disabled: Bool
    let action: () -> Void


    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Color("secondary").opacity(disabled ? 0.5 : 1))
                .clipShape(Capsule())
        }.disabled(disabled)
    }
}

extension MyButton {
    init(label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
        self.disabled = false
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        MyButton(label: "Start navigation") {}
    }
}
