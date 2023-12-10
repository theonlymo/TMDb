import Foundation

enum TrendingEndpoint {

    case movies(timeWindow: TrendingTimeWindowFilterType = .day, page: Int? = nil)
    case tvSeries(timeWindow: TrendingTimeWindowFilterType = .day, page: Int? = nil)
    case people(timeWindow: TrendingTimeWindowFilterType = .day, page: Int? = nil)

}

extension TrendingEndpoint: Endpoint {

    private static let basePath = URL(string: "/trending")!

    var path: URL {
        switch self {
        case .movies(let timeWindow, let page):
            return Self.basePath
                .appendingPathComponent("movie")
                .appendingPathComponent(timeWindow)
                .appendingPage(page)
                .appendingQueryItem(name: "include_adult", value: "false")

        case .tvSeries(let timeWindow, let page):
            return Self.basePath
                .appendingPathComponent("tv")
                .appendingPathComponent(timeWindow)
                .appendingPage(page)
                .appendingQueryItem(name: "include_adult", value: "false")

        case .people(let timeWindow, let page):
            return Self.basePath
                .appendingPathComponent("person")
                .appendingPathComponent(timeWindow)
                .appendingPage(page)
                .appendingQueryItem(name: "include_adult", value: "false")
        }
    }

}
