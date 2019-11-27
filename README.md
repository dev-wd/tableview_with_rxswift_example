# TableView with rxSwift

Applying rxSwfit on tableview in various situations

There are several ways to develope tableview with rxSwfit.

This one is one of the way, not the answer you must follow.

- Code explaination : https://dev-wd.github.io/swift/2019-11-24-tableview-rxswift-example/


## Example 1. Showing data on tableview cell


<center><img src="./images/example1.png" width="300" height="600"></center>

- Showing fruit name and image on tableview.

- Data: BehaviorRelay

- Binding data on tableview with Rxswift


## Example 2. Get data from cell textfield


<center><img src="./images/example2_1.png" width="300" height="600"></center>

- Showing numberLabel and textField on tableview.

- Data: BehaviorRelay

- Binding data on tableview with Rxswift

If you type the fruit name, then you can see the images of each fruit. 

<center><img src="./images/example2_2.png" width="300" height="600"></center>

Here are the images of fruit which you typed on previous page.



## Example 3. Treat button event from tableview cell 


<center><img src="./images/example3.png" width="300" height="600"></center>

- Showing fruit name, image, and remove button on tableview.

- Data: BehaviorRelay

- Binding data on tableview with Rxswift

If you click 'Remove', then cell will be removed from tableview.


