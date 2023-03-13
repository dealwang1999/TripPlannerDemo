//
//  ShopCard.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/12.
//

import SwiftUI

struct ShopCard: View {
    var item: ShopCardModel

    var body: some View {
        HStack {
            Image(item.imageUrl).resizable().frame(width: 85, height: 90)
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .foregroundColor(Color("title2"))
                    .font(.subheadline)
                    .fontWeight(.bold)
                HStack(spacing: 0) {
                    Image("icWalkSmall")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("\(item.time) • ")
                        .foregroundColor(Color("home.feature.description"))
                        .font(.footnote)

                    Button("Open Now") {
                        print("")
                    }
                    .font(.footnote)
                    .foregroundColor(Color("open.new"))
                }
                Text(item.description)
                    .foregroundColor(Color("home.feature.description"))
                    .font(.footnote)
            }.padding(.leading, 5)
            Spacer()
        }
        .cornerRadius(8)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
                .shadow(color: Color("shadow"), radius: 8)
        }
    }
}

extension ShopCard {
    init(_ item: ShopCardModel) {
        self.item = item
    }
}

struct ShopCard_Previews: PreviewProvider {
    static var previews: some View {
        ShopCard(ShopCardModel.examples.first!)
    }
}
