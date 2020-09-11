# Features

- Support multiple independent canvases, can switch between them and create new empty canvas.
- Save the current canvas as an image to Photo Library.

## Multiple Canvases


### What

There is a Gallery button listing all the existing canvases. User can switch between them and draw on different pages independently. User can also create new empty canvas.

### How

This implementation utilized UIAlert and methods on subviews. I implemented it by saving an array of PathViews, which is my subclass of UIView and stores the all the paths in a single canvas. I created an actionSheet of UIAlert to interact with users, letting them jump between the canvases and display the current pathCanvas on the top of all subviews. The **New…** option let user create a new PathView object and draw on it.

### Why

This feature let the user create different independent drawings and easily switch from one to another, extending the content capacity of this drawing app. 

## Save Canvas 



### What

User can touch the "Save" button and make the current canvas in which they are drawing on into an image, and store it in the phone's Photo Library.

### How

This implementation utilized UIGraphicsImageRenderer() to convert UIView to UIImage, then used UIImageWriteToSavedPhotosAlbum() to save the image to Photos. Before the app can do that, I set a new key in the app's info to request for privacy authorization.

### Why

This feature let users save their drawings into their phone so they can easily share and export their work.
