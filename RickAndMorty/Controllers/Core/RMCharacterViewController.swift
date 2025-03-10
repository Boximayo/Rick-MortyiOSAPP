//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Mayo Gonzalez ortega on 22/02/25.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Characters"
        
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
                case .success(let model):
                
                print("Total: "+String(model.info.count))
                print("Page result count: "+String(model.results.count))
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
