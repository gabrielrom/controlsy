//
//  GreetingsViewCell.swift
//  controlsy
//
//  Created by Gabriel Matheus on 17/08/22.
//

import UIKit

class GreetingsViewCell: UICollectionViewCell {
    @IBOutlet var greetingImage: UIImageView!
    @IBOutlet var greetingTitle: UILabel!
    @IBOutlet var greetingDescription: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        let nib = UINib(nibName: "GreetingsViewCell", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
         
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        
        addSubview(view)
    }
    
}
