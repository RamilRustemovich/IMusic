//
//  TrackCell.swift
//  IMusic
//
//  Created by Ramil Davletshin on 20.08.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit
import SDWebImage

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
    @IBOutlet weak var addTrackButton: UIButton!
    
    var cell: SearchViewModel.Cell?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        trackImageView.image = nil
    }
    
    func set(viewModel: SearchViewModel.Cell) {
        cell = viewModel
        let savedTracks = UserDefaults.standard.savedTracks()
        let hasFavourite = savedTracks.firstIndex {
            $0.trackName == self.cell?.trackName && $0.artistName == self.cell?.artistName
        } != nil
        if hasFavourite {
            addTrackButton.isHidden = true
        } else {
            addTrackButton.isHidden = false
        }
        
        trackNameLabel.text = viewModel.trackName
        artistNameLabel.text = viewModel.artistName
        collectionNameLabel.text = viewModel.collectionName
        
        guard let url = URL(string: viewModel.iconUrlString ?? "") else { return }
        trackImageView.sd_setImage(with: url, completed: nil)
    }
    
    @IBAction func addTrackAction(_ sender: UIButton) {
        guard let cell = cell else { return }
        addTrackButton.isHidden = true
        let defaults = UserDefaults.standard
        var listOfTracks = defaults.savedTracks()
        listOfTracks.append(cell)
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: listOfTracks, requiringSecureCoding: false) {
            defaults.set(savedData, forKey: UserDefaults.favouriteTrackKey)
        }
    }
    
    
}
