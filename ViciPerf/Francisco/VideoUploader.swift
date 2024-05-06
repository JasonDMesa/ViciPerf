//
//  VideoUploader.swift
//  ViciPerf
//
//  Created by Jason Mesa on 5/5/24.
//

import Foundation
import FirebaseStorage
struct VideoUploader {
    
//    function to upload a video
//    static func will upload video and give us an URL string
    static func uploadVideo(withData videoData: Data) async throws -> String? {
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference().child("/lower/\(filename)")
        let metadata = StorageMetadata()
        metadata.contentType = "video/quicktime"
        
        do {
            let _ = try await ref.putDataAsync(videoData, metadata: metadata)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("ERROR: Failed to upload error with error(\(error.localizedDescription)")
            return nil
        }
    }
}

