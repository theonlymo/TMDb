//
//  DiscoverEndpoint.swift
//  TMDb
//
//  Copyright © 2024 Adam Young.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an AS IS BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

enum DiscoverEndpoint {

    case movies(
        sortedBy: MovieSort? = nil,
        people: [Person.ID]? = nil,
        page: Int? = nil,
        withNetworks: Int? = nil,
        withWatchProviders: Int? = nil,
        watchRegion: String? = nil
    )
    case tvSeries(
        sortedBy: TVSeriesSort? = nil,
        page: Int? = nil,
        withNetworks: Int? = nil,
        withWatchProviders: Int? = nil,
        watchRegion: String? = nil
    )

}

extension DiscoverEndpoint: Endpoint {

    private static let basePath = URL(string: "/discover")!

    var path: URL {
        switch self {
        case let .movies(
            sortedBy,
            people,
            page,
            withNetworks,
            withWatchProviders,
            watchRegion
        ):
            Self.basePath
                .appendingPathComponent("movie")
                .appendingSortBy(sortedBy)
                .appendingWithPeople(people)
                .appendingPage(page)
                .appendingWithNetworks(withNetworks)
                .appendingWithWatchProviders(withWatchProviders)
                .appendingWatchRegion(watchRegion)
                .appendingQueryItem(name: "include_adult", value: "false")
                .appendingQueryItem(name: "vote_count.gte", value: 50)
                .appendingQueryItem(name: "vote_average.gte", value: 5)
                .appendingQueryItem(name: "vote_average.lte", value: 10)

        case let .tvSeries(
            sortedBy,
            page,
            withNetworks,
            withWatchProviders,
            watchRegion
        ):
            Self.basePath
                .appendingPathComponent("tv")
                .appendingSortBy(sortedBy)
                .appendingPage(page)
                .appendingWithNetworks(withNetworks)
                .appendingWithWatchProviders(withWatchProviders)
                .appendingWatchRegion(watchRegion)
                .appendingQueryItem(name: "include_adult", value: "false")
                .appendingQueryItem(name: "vote_count.gte", value: 50)
                .appendingQueryItem(name: "vote_average.gte", value: 5)
                .appendingQueryItem(name: "vote_average.lte", value: 10)
        }
    }

}
