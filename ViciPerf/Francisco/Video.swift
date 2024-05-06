//
//  Video.swift
//  ViciPerf
//
//  Created by Jason Mesa on 5/5/24.
//

import Foundation
// for decoding and identification purposes, allows video to be worked with for fetching and uploading purposes
struct Video: Identifiable, Decodable {
    let videoUrl: String
    var id: String {
        return NSUUID().uuidString
    }
}


