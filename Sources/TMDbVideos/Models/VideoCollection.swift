//
//  VideoCollection.swift
//  TMDbVideos
//
//  Created by Adam Young on 16/03/2020.
//

import Foundation

public struct VideoCollection: Decodable {

  public let id: Int
  public let results: [VideoMetadata]

  public init(id: Int, results: [VideoMetadata]) {
    self.id = id
    self.results = results
  }

}
