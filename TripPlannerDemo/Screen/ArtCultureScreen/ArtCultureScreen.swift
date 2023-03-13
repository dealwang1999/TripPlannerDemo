//
//  ArtCultureScreen.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/8.
//

import SwiftUI

private struct FeatureTours: Identifiable {
    var iamgeUrl: String
    var title: String
    var description: String

    var id: String {
        title
    }

    static var examples = [
        FeatureTours(iamgeUrl: "group01", title: "Food Story of Hong Kong", description: "2 hours • 4 stops"),
        FeatureTours(iamgeUrl: "group02", title: "Hong Kong with Gusto ", description: "3 hours • 4 stops"),
    ]

    static func adapter(_ data: CommonModel.Welcome) -> [FeatureTours] {
        let formatDate = { startTimeInterval, endTimeInterval in
            let startData = Date(timeIntervalSince1970: TimeInterval(startTimeInterval / 1000))
            let endData = Date(timeIntervalSince1970: TimeInterval(endTimeInterval / 1000))
            return DataUtil.calculateTimeBetweenDates(startDate: startData, endDate: endData)
        }

        return data.tripTour.map { item in
            FeatureTours(iamgeUrl: item.image.fullName, title: item.langMap.first?.descr ?? "", description: "\(formatDate(item.periodStartTime, item.periodEndTime)) • \(item.langMap.count) stops")
        }
    }
}

struct ArtCultureScreen: View {
    @State var shouldShowTimeSheet = false
    @State var shouldShowAreaSheet = false
    @StateObject private var commonData = CommonViewModel()

    var body: some View {
        if commonData.isSucces {
            renderBody()
        }
    }

    func renderBody() -> some View {
        ScrollView {
            HStack {
                drowButton(action: {
                    shouldShowTimeSheet = true
                }, title: "<5 hours")
                drowButton(action: {
                    shouldShowAreaSheet = true
                }, title: "Non-restricted area")
                Spacer()
            }
            HStack {
                Text("Feature tours")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .foregroundColor(Color("title2"))
                Spacer()
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(FeatureTours.adapter(commonData.data!)) { item in
                        featureItem(item)
                    }
                }
            }
        }
        .padding(20)
        .sheet(isPresented: $shouldShowTimeSheet) {
            timeSheet()
        }
        .sheet(isPresented: $shouldShowAreaSheet) {
            areaSheet()
        }
    }

    func timeSheet() -> some View {
        Text("<5 hours").presentationDetents([.medium, .fraction(0.3)])
    }

    func areaSheet() -> some View {
        Text("Non-restricted area").presentationDetents([.medium, .fraction(0.3)])
    }

    func drowButton(action: @escaping () -> Void, title: String) -> some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.footnote)
                Image("icArrow").resizable().frame(width: 10, height: 6)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .foregroundColor(Color("secondary"))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("secondary"), lineWidth: 2)
            )
        }
        .background(.white)
        .cornerRadius(20)
    }

    fileprivate func featureItem(_ item: FeatureTours) -> some View {
        NavigationLink(destination: {
            DetailsStepsScreen()
        }) {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: item.iamgeUrl))
                    .frame(width: 263, height: 400)
                    .cornerRadius(10)
                Text(item.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("title2"))
                HStack(spacing: 0) {
                    Image("icWalkSmall")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(item.description).foregroundColor(Color("home.feature.description"))
                        .font(.footnote)
                }.offset(y: -8)
            }.frame(width: 263)
        }
    }
}

struct ArtCultureScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArtCultureScreen()
    }
}
