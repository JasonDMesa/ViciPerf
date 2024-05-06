//
//  FeedViewModel.swift
//  ViciPerf
//
//  Created by Jason Mesa on 5/5/24.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestoreSwift
//necessary for video feed
class UpperViewModel: ObservableObject {
//     will help us select a video from PhotoPickerItem when we select what video we want to upload
    @Published var videos = [Video]() // video struct we created from Video model
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task {try await uploadVideo() }}
    }
    
    init()
    {
        Task {try await fetchVideos()}
    }
    
//    will upload video by calling VideoUploader Service
    func uploadVideo() async throws {
        guard let item = selectedItem else {return}
        guard let videoData = try await item.loadTransferable(type: Data.self) else {return}
        
        guard let videoUrl = try await VideoUploader.uploadVideo(withData: videoData) else {return}
        try await Firestore.firestore().collection("upper").document().setData(["videoUrl": videoUrl])
        print("DEBUG: Finished Video Upload")
    }
    
//    Will fetch the videos from Firebase so that we can display it on the feed
    @MainActor
    func fetchVideos() async throws {
        let snapshot = try await Firestore.firestore().collection("upper").getDocuments()
        self.videos = snapshot.documents.compactMap({try? $0.data(as: Video.self)})
    }
}


