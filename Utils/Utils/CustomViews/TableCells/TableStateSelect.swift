//
//  TableStateSelect.swift
//  Utils
//
//  Created by Uzeyir APAYDIN on 27.05.2019.
//  Copyright © 2019 Uzeyir APAYDIN. All rights reserved.
//

import UIKit

class TableStateSelect: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        fillAvailableStates()
        let gestureShowStates = UITapGestureRecognizer(target: self, action:  #selector(self.showStates))
        viewContent.addGestureRecognizer(gestureShowStates)
    }

    @IBOutlet weak var lblStateName: UILabel!
    @IBOutlet weak var viewContent: UIView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    
    var availableStateList : [State] = []
    
    func fillAvailableStates(){
        availableStateList.insert(State(name: "İstanbul", shortName: "İst"), at: 0)
        availableStateList.insert(State(name: "Ankara", shortName: "Ank"), at: 1)
        availableStateList.insert(State(name: "İzmir", shortName: "İzm"), at: 2)
    }
    
    
    
    @objc func showStates(sender: UIButton!) {
        Vibration.success.vibrate()
        
        let alert = UIAlertController(title: "Available States", message: "Please Select State", preferredStyle: .actionSheet)
        
        
        
        for state in availableStateList {
            alert.addAction(UIAlertAction(title: state.name, style: .default , handler:{ (UIAlertAction)in
                self.lblStateName.text = state.name

                if #available(iOS 12.0, *) {
                    if self.traitCollection.userInterfaceStyle == .dark {
                        self.lblStateName.textColor = UIColor.white
                    } else {
                        self.lblStateName.textColor = UIColor.black
                    }
                } else {
                    self.lblStateName.textColor = UIColor.black
                }
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler:{ (UIAlertAction)in
            self.lblStateName.text = "Please Select State"
            self.lblStateName.textColor = UIColor.lightGray
        }))
        
        self.parentViewController!.present(alert, animated: true, completion: {
            print("completion block")
        })
        
        
        
    }
}




public struct State: Codable {
    public var name: String?
    public var shortName: String?
    
    public init(name: String?, shortName: String?) {
        self.name = name
        self.shortName = shortName

    }

    public enum CodingKeys: String, CodingKey {

        case name = "Name"
        case shortName = "ShortName"
    }


}

