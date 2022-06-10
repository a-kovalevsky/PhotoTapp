//
//  ViewController.swift
//  PhotoTapp
//
//  Created by andrew on 16.04.22.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var image: UIImage? = nil

    @IBOutlet weak var imageVC: UIImageView!
    
    
    @IBAction func buttonVC(_ sender: UIButton) {
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        shareController.completionWithItemsHandler = {_,bool,_,_ in if bool {print("Успешно")} else {print(" не успешно ")}//гляди документацию и входные параметры,тут конкретно индикация успешности шэйра самого поэтому остальное андерскоуп
        }
        present(shareController, animated: true, completion: nil)//после завершения блока
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageVC.image = image
        
    }
    


}
