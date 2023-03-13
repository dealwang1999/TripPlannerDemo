//
//  DetailsHideSteps.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/9.
//

import SwiftUI

struct DetailsStepsScreen: View {
    @Environment(\.dismiss) var dismiss
    @State var shopList: [ShopCardModel]

    var shouldShowShopList: [ShopCardModel] {
        shopList.filter(\.isCheck)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("group01").resizable().frame(height: 160).aspectRatio(contentMode: .fit)
                VStack(alignment: .leading, spacing: 8) {
                    renderInfo()
                    renderEdit()
                    Splitter()
                    VStack(spacing: 0) {
                        ForEach(Array(shouldShowShopList.enumerated()), id: \.element.id) { item in
                            renderItem(item.element, index: item.offset) {
                                print("")
                            }
                        }
                    }
                }.padding(.horizontal, 20)
            }
        }
        .safeAreaInset(edge: .bottom, content: startNavigationButton)
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

    private func startNavigationButton() -> some View {
        HStack {
            MyButton(label: "Start navigation") {
                print("")
            }
        }.padding(.horizontal, 20)
    }

    @ViewBuilder
    private func renderInfo() -> some View {
        Text("Food Story of Hong Kong")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top, 20)
            .foregroundColor(Color("title2"))
        HStack(spacing: 0) {
            Image("icWalkSmall")
                .resizable()
                .frame(width: 20, height: 20)
            Text("2 hours • 4 stops")
                .foregroundColor(Color("home.feature.description"))
                .font(.footnote)
        }
        Text("Grab a good meal before you take off at the Hong Kong International Airport with a plethora of local favors to beat. ")
            .foregroundColor(Color("home.feature.description"))
            .font(.footnote)
    }

    private func renderEdit() -> some View {
        HStack {
            Text("Tour Stops")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color("title2"))
            Spacer()
            NavigationLink(destination: {
                DetailsEditModeScreen(shopList: $shopList)
            }) {
                Image("edit_img").resizable().frame(width: 26, height: 36)
            }
        }
    }

    fileprivate func renderItem(_ item: ShopCardModel, index: Int, action: @escaping () -> Void) -> some View {
        HStack(spacing: 13) {
            VStack(spacing: 0) {
                Color.clear.frame(width: 1).overlay {
                    Rectangle().strokeBorder(style: .init(lineWidth: 1, dash: [2, 5])).foregroundColor(Color("primary"))
                }.hidden(index == 0)
                Text((index + 1).description)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 3)
                    .font(.footnote)
                    .frame(minWidth: 22)
                    .clipShape(Capsule())
                    .background {
                        RoundedRectangle(cornerRadius: 9999).foregroundColor(Color("primary"))
                    }
                Color.clear.frame(width: 1).overlay {
                    Rectangle().strokeBorder(style: .init(lineWidth: 1, dash: [2, 5])).foregroundColor(Color("primary"))
                }.hidden(index == shouldShowShopList.count - 1)
            }
            Button(action: action) {
                ShopCard(item).padding(.vertical, 10)
            }
        }
    }
}

extension DetailsStepsScreen {
    init() {
        self.init(shopList: ShopCardModel.examples)
    }
}

struct DetailsStepsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsStepsScreen()
    }
}
