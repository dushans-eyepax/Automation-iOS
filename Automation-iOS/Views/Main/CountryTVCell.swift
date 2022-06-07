//
//  CountryTVCell.swift
//  Automation-iOS
//
//  Created by Dushan Saputhanthri on 6/7/22.
//

import UIKit

class CountryTVCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var callingCodesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        //bgView.addLayerEffects(cornerRadius: 8)
    }
    
    func configureCell(with data: Country) {
        nameLabel.text = data.name
        
        let shortCode = data.altSpellings?.first?.lowercased() ?? ""
        let flagUrlString = "https://www.countryflags.io/\(shortCode)/flat/64.png" // flat / shiny
        //flagImageView.setImageWithUrl(flagUrlString)
        
//        populationLabel.text = data.population.roundedWithAbbreviations
        callingCodesLabel.text = (data.callingCodes ?? []).joined(separator: ",")
    }
    
}
