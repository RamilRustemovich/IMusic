//
//  TrackCell.swift
//  IMusic
//
//  Created by Ramil Davletshin on 20.08.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import Foundation
import UIKit

protocol TrackCellViewModel {
    var trackName: String { get }
    var collectionName: String { get }
    var artistName: String { get }
    var iconUrlString: String? { get }
}

class TrackCell: UITableViewCell {
    
    static let reuseId = "TrackCell"
    
    @IBOutlet weak var trackImageView: UIImageView!
    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    
    func set(viewModel: TrackCellViewModel) {
        trackNameLabel.text = viewModel.trackName
        artistNameLabel.text = viewModel.artistName
        collectionNameLabel.text = viewModel.collectionName
        
    }
    
    
}
