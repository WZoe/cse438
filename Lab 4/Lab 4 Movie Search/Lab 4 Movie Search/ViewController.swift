//
//  ViewController.swift
//  Lab 4 Movie Search
//
//  Created by Zoe Wang on 10/20/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var theSearchResults:[Movie] = []
    var theImageCache:[Int:UIImage] = [:]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setCollectionView()
    }
    
    // setupcollectionview
    func setCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsSelection = true
        if let flow = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.itemSize = CGSize(width: 120, height: 180)
            flow.minimumInteritemSpacing = 5
            flow.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
        collectionView.register(PosterCell.self, forCellWithReuseIdentifier: "movieCell")
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var noResults: UILabel!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return theSearchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! PosterCell
        
        cell.backgroundColor = UIColor.gray
        
        cell.movieTitle.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        cell.movieTitle.font = cell.movieTitle.font.withSize(15)
        cell.movieTitle.textAlignment = .center
        cell.movieTitle.textColor = UIColor.white
        cell.movieTitle.numberOfLines = 2
        cell.movieTitle.text = theSearchResults[indexPath.row].title
        
        cell.moviePoster.image = theImageCache[theSearchResults[indexPath.row].id]
        cell.addSubview(cell.moviePoster)
        cell.addSubview(cell.movieTitle)
        return cell as UICollectionViewCell
    }
    
    // Fetch Search Results
    func fetchSearchResults(for keyword: String) {
        if keyword=="" {
            return
        }
        let keyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        spinner.startAnimating()
        DispatchQueue.global().async {
            let url = URL(string:"https://api.themoviedb.org/3/search/movie?api_key=f37970f052856742371d3453baf5bf09&language=en-US&query=\(keyword)&page=1&include_adult=false")

            let data = try! Data(contentsOf: url!)
            if data.count>0 {
                self.theSearchResults=try! JSONDecoder().decode(APIResults.self, from: data).results
                if self.theSearchResults.count != 0 {
                    self.cacheImages()
                }
            }
            
            DispatchQueue.main.async {
                if data.count <= 0{
                        self.noResults.alpha = 1
                        self.theSearchResults = []
                }
                else {
                    if self.theSearchResults.count == 0 {
                        self.noResults.alpha = 1
                    }else {
                        self.noResults.alpha=0
                    }
                }

                self.collectionView.reloadData()
                self.spinner.stopAnimating()
            }
        }
    }
    
    func cacheImages() {
        for item in theSearchResults {
            if item.poster_path != nil {
                let id = item.id
                let url = URL(string: "https://image.tmdb.org/t/p/w500" + item.poster_path!)
                let data = try? Data(contentsOf: url!)
                let image = UIImage(data:data!)
                theImageCache[id!] = image!
            }
        }
    }
    
    //Search Interaction
    @IBAction func search(_ sender: UITextField) {
        if let text = sender.text {
            fetchSearchResults(for: text)
        }
    }
    
    // Detail ViewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedVC = MovieDetailView()
        detailedVC.currentMovie = theSearchResults[indexPath.row]
        navigationController?.pushViewController(detailedVC, animated: true)
    }

    
}

