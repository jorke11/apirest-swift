
import UIKit

struct User:Decodable {
    let name:String?
    let product:String?
    let other:String?
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    

    @IBOutlet weak var message: UITextField!
    @IBOutlet weak var tableview: UITableView!
    var users = [User]();
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func sendMesage(_ sender: Any) {
        UserDefaults.standard.set("test", forKey: "test")
        guard let url=URL(string: "http://192.168.1.54:8000/api/users") else {return}
        let session = URLSession.shared
        session.dataTask(with: url){(data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do{
                    //let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    
                    self.users = try JSONDecoder().decode([User].self, from: data)
                    
                    for user in self.users{
                        
                        DispatchQueue.main.async{
                            self.tableview.reloadData()
                        }
                        print(user.name)
                    }
                    
                    
                    
                }catch let jsonError{
                    print("catch",jsonError)
                }
            }
        }.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.labelcell.text = users[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail:DetailViewController=self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        detail.labelDetailText = users[indexPath.row].name ?? ""
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    @IBAction func postMethod(_ sender: Any) {
        let paramters = ["name":"jorge","product":"test"]
        guard let url = URL(string: "http://192.168.1.54:8000/api/users") else {return}
        var request = URLRequest(url:url)
        
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: paramters, options: []) else {return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request){(data, response,error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do{
                    //firsst alternative
//                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else {return}
//                    let user = User(json:json)
                    let user = try JSONDecoder().decode(User.self, from: data)
                    
                    print(user.name)
                    
                }catch let jsonError{
                    print("catch",jsonError)
                }
            }
        }.resume()
    }
    
}

