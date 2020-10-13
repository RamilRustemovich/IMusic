//
//  Library.swift
//  IMusic
//
//  Created by Ramil Davletshin on 11.10.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import SwiftUI
import URLImage

struct Library: View {
    
    @State var tracks = UserDefaults.standard.savedTracks()
    @State private var showingAlert = false
    @State private var track: SearchViewModel.Cell!
    var tabBarDelegate: MainTabBarControllerDelegate?
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack(spacing: 20) {
                        Button(action: {
                            self.track = self.tracks.first
                            self.tabBarDelegate?.maximizeTrackDetailController(viewModel: self.track)
                        }) {
                            Image(systemName: "play.fill")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                                .background(Color.init(#colorLiteral(red: 0.9587835727, green: 0.9587835727, blue: 0.9587835727, alpha: 1)))
                                .cornerRadius(10)
                        }
                        Button(action: {
                            self.tracks = UserDefaults.standard.savedTracks()
                        }) {
                            Image(systemName: "arrow.2.circlepath")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                                .background(Color.init(#colorLiteral(red: 0.9587835727, green: 0.9587835727, blue: 0.9587835727, alpha: 1)))
                                .cornerRadius(10)
                        }
                    }
                }.padding().frame(height: 50)
                Divider().padding(.leading).padding(.trailing)
                List {
                    ForEach(tracks) { track in
                        LibraryCell(cell: track)
                            .gesture(LongPressGesture().onEnded({ _ in
                                self.showingAlert = true
                                self.track = track
                            }).simultaneously(with: TapGesture().onEnded { _ in
                                
                                let keyWindow = UIApplication.shared.connectedScenes.filter {
                                    $0.activationState == .foregroundActive
                                }.map { $0 as? UIWindowScene }.compactMap { $0 }.first?.windows.filter({ $0.isKeyWindow }).first
                                let tabBarVC = keyWindow?.rootViewController as? MainTabBarController
                                tabBarVC?.trackDetailView.delegate = self
                                
                                self.track = track
                                self.tabBarDelegate?.maximizeTrackDetailController(viewModel: self.track)
                            }))
                    }.onDelete(perform: delete)
                }
            }.actionSheet(isPresented: $showingAlert, content: {
                ActionSheet(title: Text("Are you sure want to delete this track?"),
                            buttons: [.destructive(Text("Delete"), action: { self.delete(track: self.track)}),
                                      .cancel()]
                )
            })
            .navigationBarTitle("Library")
        }
        
        
    }
    
    func delete(at offsets: IndexSet) {
        tracks.remove(atOffsets: offsets)
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: tracks, requiringSecureCoding: false) {
            UserDefaults.standard.set(savedData, forKey: UserDefaults.favouriteTrackKey)
        }
    }
    
    func delete(track: SearchViewModel.Cell) {
        let optIndex = tracks.firstIndex(of: track)
        guard let index = optIndex else { return }
        tracks.remove(at: index)
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: tracks, requiringSecureCoding: false) {
            UserDefaults.standard.set(savedData, forKey: UserDefaults.favouriteTrackKey)
        }
    }
}



struct LibraryCell: View {
    
    var cell: SearchViewModel.Cell
    
    var body: some View {
        HStack {
            //Image("Image").resizable().frame(width: 60, height: 60).cornerRadius(2)
            URLImage(URL(string: cell.iconUrlString ?? "")!).frame(width: 50, height: 50).cornerRadius(2)
            VStack(alignment: .leading) {
                Text("\(cell.trackName)")
                Text("\(cell.artistName)")
            }
        }
    }
}


struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}

extension Library: TrackMovingDelegate {
    func moveBackForPreviousTrack() -> SearchViewModel.Cell? {
        let optIndex = tracks.firstIndex(of: track)
        guard let index = optIndex else { return nil }
        var nextTrack: SearchViewModel.Cell
        if index - 1 == -1 {
            nextTrack = tracks[tracks.count - 1]
        } else {
            nextTrack = tracks[index - 1]
        }
        self.track = nextTrack
        return nextTrack
    }
    
    func moveForwardForPreviousTrack() -> SearchViewModel.Cell? {
        let optIndex = tracks.firstIndex(of: track)
        guard let index = optIndex else { return nil }
        var nextTrack: SearchViewModel.Cell
        if index + 1 == tracks.count {
            nextTrack = tracks[0]
        } else {
            nextTrack = tracks[index + 1]
        }
        self.track = nextTrack
        return nextTrack
    }
    
    
}
