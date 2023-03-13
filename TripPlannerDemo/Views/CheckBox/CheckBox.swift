//
//  CheckBox.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/14.
//

import SwiftUI

struct CheckBox: View {
    var isCheck: Bool

    var body: some View {
        if isCheck {
            Image("radio_onclick").resizable().frame(width: 16, height: 16)
        } else {
            Image("radio_unclick").resizable().frame(width: 16, height: 16)
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    @State static var isCheck = true
    static var previews: some View {
        CheckBox(isCheck: isCheck)
    }
}
