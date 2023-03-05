//
//  DetailsHideEditModeScreen.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/12.
//

import SwiftUI

struct DetailsEditModeScreen: View {
    @Environment(\.dismiss) var dismiss
    @Binding var shopList: [ShopCardModel]
    @State var checkList: Set<ShopCardModel.ID>

    var disabled: Bool {
        !(checkList.count > 0)
    }

    var body: some View {
        ScrollView {
            VStack {
                renderTopBar()
                Splitter().offset(y: 16)
                renderShopList()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 22)
        }
        .safeAreaInset(edge: .bottom, content: bottomButton)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("")
                } label: {
                    Image("tour_details_share_location")
                        .setNavigationIconStyle()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("")
                } label: {
                    Image("navigation_location")
                        .setNavigationIconStyle()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .goBackToolBar("Food Story of Hong Kong") {
            dismiss()
        }
    }

    func renderTopBar() -> some View {
        HStack {
            Text("Tour Stops")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color("title2"))
            Spacer()
            Button("CANCEL") {
                checkList = Set(shopList.filter(\.isCheck).map(\.id))
            }
            .font(.footnote)
            .foregroundColor(.black)
            .fontWeight(.medium)
        }
    }

    func renderShopList() -> some View {
        VStack {
            ForEach(shopList) { item in
                Button {
                    if checkList.contains(item.id) {
                        checkList.remove(item.id)
                    } else {
                        checkList.insert(item.id)
                    }
                } label: {
                    HStack(spacing: 14) {
                        CheckBox(isCheck: checkList.contains(item.id))
                        ShopCard(item)
                    }
                }
            }
        }.padding(.top, 40)
    }

    func bottomButton() -> some View {
        HStack {
            MyButton(label: "Done", disabled: disabled) {
                shopList = shopList.map { item in
                    var newItem = item
                    newItem.isCheck = checkList.contains(item.id)
                    return newItem
                }
                dismiss()
            }
        }
        .padding(.horizontal, 20)
    }
}

extension DetailsEditModeScreen {
    init(shopList: Binding<[ShopCardModel]>) {
        self.init(shopList: shopList, checkList: Set(shopList.wrappedValue.filter(\.isCheck).map(\.id)))
    }
}

struct DetailsEditModeScreen_Previews: PreviewProvider {
    @State static var shopList = ShopCardModel.examples
    static var previews: some View {
        DetailsEditModeScreen(shopList: $shopList)
    }
}
