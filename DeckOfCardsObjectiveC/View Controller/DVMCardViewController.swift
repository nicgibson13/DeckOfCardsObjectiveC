//
//  DVMCardViewController.swift
//  DeckOfCardsObjectiveC
//
//  Created by Nic Gibson on 7/2/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

import UIKit

class DVMCardViewController: UIViewController {
    
    var card: DVMCard?
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateViews(){
        DVMCardController.drawANewCard { (card) in
            DVMCardController.fetchCardImage(card, completion: { (image) in
                DispatchQueue.main.async {
                    self.cardImage.image = image
                    self.cardLabel.text = card.suit
                }
            })
        }
    }
    @IBAction func cardButtonTapped(_ sender: Any) {
        updateViews()
    }
    
    
    
}
