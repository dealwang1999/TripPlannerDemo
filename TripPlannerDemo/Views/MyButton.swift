//
//  MyButton.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/17.
//

import SwiftUI

struct MyButton: View {
    var action: () -> Void
    @State var disabled: Bool

    var body: some View {
        VStack {
//            Button(action: action) {
//                Text("\(disabled.description)")
//                    .font(.subheadline)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .padding(.vertical, 14)
//                    .background {
//                        RoundedRectangle(cornerRadius: 9999).foregroundColor(Color("secondary")).opacity(disabled ? 0.5 : 1)
//                    }
//            }.disabled(disabled)

            if disabled {
                Color.gray // true
            } else {
                Color.red // false
            }
        }
    }

    func disabled(_ disabled: Bool) -> some View {
        self.disabled = disabled
        return self
    }
}

extension MyButton {
    init(action: @escaping () -> Void) {
        self.action = action
        self._disabled = .init(wrappedValue: false)
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        MyButton {
            print("")
        }.disabled(true)
    }
}
