//
//  ViewController.swift
//  iquiz
//
//  Created by Diana Tran on 5/10/24.
//

import UIKit


let quizzes = [
    Quiz(icon: "math", title: "Mathematics", description: "what do you know about math?"),
    Quiz(icon: "marvel", title: "Marvel Super Heroes", description: "how many marvel heros do you know?"),
    Quiz(icon: "science", title: "Science", description: "test your science knowledge")
]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath)
            let quiz = quizzes[indexPath.row]

            if let imageView = cell.viewWithTag(1) as? UIImageView {
                imageView.image = UIImage(named: quiz.icon)
            }
            if let titleLabel = cell.viewWithTag(2) as? UILabel {
                titleLabel.text = quiz.title
            }
            if let descriptionLabel = cell.viewWithTag(3) as? UILabel {
                descriptionLabel.text = quiz.description
            }

            return cell
        }
    
    @IBAction func handleSettingButtonTap(_ sender: UIBarButtonItem) {
            let alertController = UIAlertController(title: "Settings go here", message: "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
}
