// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct CommonModel {
    // MARK: - Welcome

    struct Welcome: Codable {
        let language: [Language]
        let tripTour: [TripTour]
        let tripTourCategory: [TripTourCategory]
    }

    // MARK: - Language

    struct Language: Codable {
        let isDefault: Bool
        let langCode: LangCode
        let sortOrder: Int
    }

    enum LangCode: String, Codable {
        case enUS = "en_US"
        case jaJP = "ja_JP"
        case koKR = "ko-KR"
        case zhCN = "zh_CN"
        case zhHK = "zh_HK"
    }

    // MARK: - TripTour

    struct TripTour: Codable {
        let bannerImage: Image
        let expired: Bool
        let id: Int
        let image: Image
        let langMap: [TripTourLangMap]
        let periodEndTime, periodStartTime: Int
        let tripStopList: [TripStopList]
        let tripTourCategoryList: [TripTourCategoryList]
    }

    // MARK: - Image

    struct Image: Codable {
        let fullName: String
    }

    // MARK: - TripTourLangMap

    struct TripTourLangMap: Codable {
        let descr: String
        let langCode: LangCode
        let name: String
    }

    // MARK: - TripStopList

    struct TripStopList: Codable {
        let externalID: String
        let id: Int
        let image: [Image]
        let isExistMap: Bool
        let langMap: [TripStopListLangMap]
        let stayTime: Int
        let videoBrowser: JSONNull?
        let websiteBrowser: Int?

        enum CodingKeys: String, CodingKey {
            case externalID = "externalId"
            case id, image, isExistMap, langMap, stayTime, videoBrowser, websiteBrowser
        }
    }

    // MARK: - TripStopListLangMap

    struct TripStopListLangMap: Codable {
        let audioURL: String
        let descr: String
        let langCode: LangCode
        let name: String
        let videoURL: String
        let websiteURL: String

        enum CodingKeys: String, CodingKey {
            case audioURL = "audioUrl"
            case descr, langCode, name
            case videoURL = "videoUrl"
            case websiteURL = "websiteUrl"
        }
    }

    // MARK: - TripTourCategoryList

    struct TripTourCategoryList: Codable {
        let id: Int
    }

    // MARK: - TripTourCategory

    struct TripTourCategory: Codable {
        let id: Int
        let langMap: [TripTourCategoryLangMap]
        let tourID: [Int]

        enum CodingKeys: String, CodingKey {
            case id, langMap
            case tourID = "tourId"
        }
    }

    // MARK: - TripTourCategoryLangMap

    struct TripTourCategoryLangMap: Codable {
        let langCode: LangCode
        let name: String
    }

    // MARK: - Encode/decode helpers

    class JSONNull: Codable, Hashable {
        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
        }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }
}
