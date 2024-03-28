//
//  ViewController.swift
//  WongnaiApp1
//
//  Created by Navathon Limamapar on 26/3/2567 BE.
//

import UIKit


class PhotoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var photos: [PhotoViewModel] = []
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRefreshControl()
        fetchPhotos()
    }
    
    // Sets up the table view data source and delegate, and registers the cell nib.
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "PhotoCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PhotoCell")
    }
    
    // Sets up the refresh control and attaches it to the table view.
    private func setupRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refreshPhotoData(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    // Fetches photo data asynchronously from an API and reloads the table view.
    @objc func fetchPhotos() {
        APIManager.shared.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let photoData):
                    self?.photos = photoData.map { PhotoViewModel(photo: $0) }
                    self?.tableView.reloadData()
                case .failure(let error):
                    // Handle the error, e.g., show an alert to the user
                    print("Error fetching photos: \(error)")
                }
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    // For action refresh photo data
    @objc private func refreshPhotoData(_ sender: UIRefreshControl) {
        // Clear old data
        photos.removeAll()
        
        tableView.reloadData()
        // Fetch new data
        fetchPhotos()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension PhotoListViewController: UITableViewDataSource, UITableViewDelegate {
    // Return number of row from api photos count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    // Set for display info in the cell, build or reuse the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
            fatalError("Unable to dequeue PhotoCell")
        }
        let photoViewModel = photos[indexPath.row]
        cell.configure(with: photoViewModel)
        return cell
    }
}

