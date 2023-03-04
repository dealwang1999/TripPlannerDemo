//
//  TabBar.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/6.
//

import SwiftUI

struct TabBar<Tag>: View where Tag: Hashable {
    var data: [TabBar.Item]
    @Binding var currentTag: Tag

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(data) { item in
                        Button(action: {
                            withAnimation {
                                currentTag = item.tag
                            }
                        }, label: {
                            VStack(spacing: 8) {
                                TextContent(item.title)
                                underline(item.tag == currentTag)
                            }
                            .padding(.top, 15)
                        })
                    }
                    Spacer()
                }
                .padding(.horizontal, 15)
            }
            .background(Color("primary"))
        }
    }

    func TextContent(_ name: String) -> some View {
        Text(name)
            .font(.subheadline)
            .foregroundColor(.white)
            .fontWeight(.bold)
    }

    func underline(_ isSelect: Bool) -> some View {
        Group {
            if isSelect {
                Color("tab.select.underline")
            } else {
                Color.clear
            }
        }.frame(height: 2.8)
    }
}

extension TabBar {
    struct Item: Identifiable {
        var title: String
        var tag: Tag
        var id: Tag { tag }
    }
}

struct TabBar_Previews: PreviewProvider {
    @State static var index = 0

    static var previews: some View {
        TabBar(data: [.init(title: "abc", tag: 0), .init(title: "Shop & Dine", tag: 1)], currentTag: $index)
    }
}
