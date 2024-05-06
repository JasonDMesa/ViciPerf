//
//  FeedView.swift
//  ViciPerf
//
//  Created by Jason Mesa on 5/5/24.
//

//
//  ContentView.swift
//  SwiftUIVideoFeedTutorial
//
//
import SwiftUI
import PhotosUI
import AVKit
struct UpperView: View {//changed
    //    necessary for video feed view
    @StateObject var viewModel = UpperViewModel()
    //    var exercises = ["Lunges", "Tap Squat", "Single Arm Hinge", "filer", "filler", "filler", "filler", "filler", "filler", "filler", "filler", "filler"]
    var body: some View {
        VStack {
            
            HeaderView()
            NavigationStack {
                ZStack {
                    Color(.darkGray)
                        .ignoresSafeArea()
                    ScrollView {
                        //                list to store names of videos
                        //                the scroll video feed we are aiming for, for loop to iterate throught he videos we have
                        ForEach(viewModel.videos) {video in
                            
                            Text("Exercise:")
                            VideoPlayer(player: AVPlayer(url: URL(string: video.videoUrl)!))
                                .frame(height: 250)
                        }
                    }
                    .navigationBarBackButtonHidden()
                    //            necessary for refresh
                    .refreshable {
                        Task { try await viewModel.fetchVideos() }
                    }
                    //            necessary for view and for accessing videos we want to upload
                    .navigationBarTitle("Upper Body", displayMode: .large)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            PhotosPicker(selection: $viewModel.selectedItem, matching: .any(of: [.videos, .not(.images)])) {
                                Image(systemName: "plus")
                                    .foregroundColor(.red)
                                
                            }
                        }
                    }
                }
                //        necessary?
                .padding()
            }
        }
    }
}
// duh
#Preview {
    UpperView()
}

