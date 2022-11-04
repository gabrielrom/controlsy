//
//  OnBoardingViewController.swift
//  controlsy
//
//  Created by Gabriel Matheus on 16/08/22.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController {
    @IBOutlet var greetingsCollection: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    
    private(set) var greetings: [GreetingModel] = GreetingsType.normal.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        greetingsCollection.register(GreetingsViewCell.self,
                                     forCellWithReuseIdentifier: "GreetingsViewCell")
        greetingsCollection.dataSource = self
        greetingsCollection.delegate = self
    }
    
    @IBAction func signupTap(_ sender: UIButton) {
        UserDefaults.standard.set("session", forKey: "access_type")
    }
    
    @IBAction func signinTap(_ sender: UIButton) {
        UserDefaults.standard.set("session", forKey: "access_type")
    }
}

// MARK: Collection Data Source
extension OnBoardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return greetings.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GreetingsViewCell",
                                                      for: indexPath) as! GreetingsViewCell
        
        let greeting = greetings[indexPath.row]
        
        cell.greetingImage.image = greeting.getGreetingImage()
        cell.greetingTitle.text = greeting.greetingTitle
        cell.greetingDescription.text = greeting.greetingDescription
        
        return cell
    }
}

// MARK: Collection Flow Layout
extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,
                      height: collectionView.frame.size.height)
    }
}


// MARK: PageControl
extension OnBoardingViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
}
