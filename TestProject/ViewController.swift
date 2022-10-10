

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       var result =  loadJson(filename: "SectionData")
        print(result ?? print("error mistake") as Any)
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "Table"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

