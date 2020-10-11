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
    
    let tracks = UserDefaults.standard.savedTracks()
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack(spacing: 20) {
                        Button(action: {
                            print("ff")
                        }) {
                            Image(systemName: "play.fill")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                                .background(Color.init(#colorLiteral(red: 0.9587835727, green: 0.9587835727, blue: 0.9587835727, alpha: 1)))
                                .cornerRadius(10)
                        }
                        Button(action: {
                            print("f2f")
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
                List(tracks) { track in
                    LibraryCell(cell: track)
                }
            }
            .navigationBarTitle("Library")
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
