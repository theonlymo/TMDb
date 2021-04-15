import Combine
@testable import TMDb
import XCTest

class TMDbAPITVShowSeasonTests: TMDbAPITestCase {

    func testDetailsPublisherForTVShowSeasonReturnsTVShowSeason() throws {
        let expectedResult = TVShowSeason(id: 1, name: "Name 1", seasonNumber: 2)
        tvShowSeasonService.seasonDetails = expectedResult
        let expectedSeasonNumber = 2
        let expectedTVShowID = 3

        let result = try await(
            publisher: tmdb.detailsPublisher(forSeason: expectedSeasonNumber, inTVShow: expectedTVShowID),
            storeIn: &cancellables)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(tvShowSeasonService.lastDetailsSeasonNumber, expectedSeasonNumber)
        XCTAssertEqual(tvShowSeasonService.lastDetailsTVShowID, expectedTVShowID)
    }

    func testImagesPublisherForTVShowSeasonReturnsImages() throws {
        let expectedResult = ImageCollection(
            id: 1,
            posters: [
                ImageMetadata(filePath: URL(string: "/some/image1")!, width: 100, height: 100),
                ImageMetadata(filePath: URL(string: "/some/image2")!, width: 200, height: 200),
                ImageMetadata(filePath: URL(string: "/some/image3")!, width: 300, height: 300)
            ],
            backdrops: [
                ImageMetadata(filePath: URL(string: "/some/image4")!, width: 400, height: 400),
                ImageMetadata(filePath: URL(string: "/some/image5")!, width: 500, height: 500),
                ImageMetadata(filePath: URL(string: "/some/image6")!, width: 600, height: 600)
            ]
        )
        tvShowSeasonService.images = expectedResult
        let expectedSeasonNumber = 2
        let expectedTVShowID = 3

        let result = try await(
            publisher: tmdb.imagesPublisher(forSeason: expectedSeasonNumber, inTVShow: expectedTVShowID),
            storeIn: &cancellables)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(tvShowSeasonService.lastImagesSeasonNumber, expectedSeasonNumber)
        XCTAssertEqual(tvShowSeasonService.lastImagesTVShowID, expectedTVShowID)
    }

    func testVideosPublisherForTVShowSeasonReturnsImages() throws {
        let expectedResult = VideoCollection(
            id: 1,
            results: [
                VideoMetadata(
                    id: "1", name: "Name 1",
                    site: "Site 1",
                    key: "key1",
                    type: .teaser,
                    size: .s1080
                ),
                VideoMetadata(
                    id: "2", name: "Name 2",
                    site: "Site 2",
                    key: "key2",
                    type: .teaser,
                    size: .s360
                )
            ]
        )
        tvShowSeasonService.videos = expectedResult
        let expectedSeasonNumber = 2
        let expectedTVShowID = 3

        let result = try await(
            publisher: tmdb.videosPublisher(forSeason: expectedSeasonNumber, inTVShow: expectedTVShowID),
            storeIn: &cancellables)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(tvShowSeasonService.lastVideosSeasonNumber, expectedSeasonNumber)
        XCTAssertEqual(tvShowSeasonService.lastVideosTVShowID, expectedTVShowID)
    }

}
