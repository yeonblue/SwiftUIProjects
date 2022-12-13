//
//  VideoListView.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/10.
//

import SwiftUI

struct VideoListView: View {
    
    // MARK: - Properties
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    @State var videos: [VideoModel] = Bundle.main.decode("videos.json")
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List(videos) { video in
                NavigationLink {
                    VideoPlayerView(videoSelected: video.id, videoTitle: video.name)
                } label: {
                    VideoListItemView(video: video)
                        .padding(.vertical, 8)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        }
    }
}

// MARK: - Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
