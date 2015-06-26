## ExpandingStackCells

Example code for creating expanding table view cells using stack views, introduced in iOS 9.

### What's a stack view?

`UIStackView` is a view introduced in iOS 9. Its main goal is to make it simpler to organize in our layout elements in either horizontal, or vertical stacks. It also promises to minimize the troubles of Auto Layout (which probably has a lot to do with its popularity 😛).

### The goal

As the name suggests, the goal is to create expanding table view cells. Prior to iOS 9, there were already multiple ways to achieve this:

* [By dynamically inserting/deleting cells][insertion-example]
* [By using Auto Layout constraints][AL-example]

This attempt focuses on achieving similar results, but with the use of `UIStackView`.

### Getting started

![][IB-screen]

The benefits of using a stack view become obvious when designing our UI: our table view cell contains one element: a horizontal stack view containing 2 views.

The following layout constraints still had to be defined:

* Pin the leading/trailing/top/bottom edges of the stack view to the content view
* Define vertical constraints within the contained view (see the attached screenshot), so the stack view can infer its size properly.

### Connecting the dots

In our `UITableViewCell` subclass, we define outlets for our labels, but more importantly, an outlet for the stack view itself. If you've been following [my earlier attempts][old-cell] at expanding cells, you'll notice that this is a slightly different approach: previously, we needed outlets for the height constraints of the contained view. Now, these will be managed by the stack view. 👍

### Updating the contents

A notable feature of `UIStackView`, is that it can automatically update its layout whenever we tamper with its contents. It maintains the array of contained views in a property called `arrangedSubviews`. You can dynamically add, or remove views, and the stack view will take care of them out properly.

In our example, we don't want to remove any subviews, only hide them. Luckily, this can be achieved with minimal code.

#### Step 1:
In our table view cell:

```swift
override func setSelected(selected: Bool, animated: Bool) {
   super.setSelected(selected, animated: animated)

   UIView.animateWithDuration(0.5) {
       stackView.arrangedSubviews.last?.hidden = !selected
   }
}
```

You don't actually need to wrap this into an animation block, but in my opinion, this leads to a prettier result.

#### Step 2: 
You'll need to implement a delegate method to inform the table view of the size change:

```swift
override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
   
   tableView.beginUpdates()
   tableView.endUpdates()
}
```

#### Step 3: 
There is no Step 3. Enjoy your expanding cells! 🎉

#### Conclusion:

As you can see, stack views make implementing expanding cells are super easy. If you compare this example to an [earier one][old-vc], you'll notice that we now have much less code to worry about.

`UIStackView` is a great addition in iOS 9, and whether you just want to ease the transition into Auto Layout, or have a more maintainable, organized layout, you should definitely give it a try.

[insertion-example]: https://github.com/jozsef-vesza/TableViewExpansions
[AL-example]: https://github.com/jozsef-vesza/ExpandableTableView
[IB-screen]: http://i.imgur.com/QLOeld5.png
[old-cell]: https://github.com/jozsef-vesza/ExpandableTableView/blob/master/ExpandableTableView/ExpandableTableViewCell.swift
[old-vc]: https://github.com/jozsef-vesza/ExpandableTableView/blob/master/ExpandableTableView/TableViewController.swift