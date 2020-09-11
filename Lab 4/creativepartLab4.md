# Features

- **Discover Tab**: Randomly present movie recommendations.
- **Collections Tab**: Present the top popular movies as collections in different genres.
- **Poster Saving**: Save the original high-resolution poster to Photo Library.
- Favorite Badge: a badge at the Favorite tab indicating the number of favorites.

## Discover Tab


### What

As the homepage of my App, the Discover tab ramdomly presents a movie recommendation among the popular ones. This tab features a high resolution big screen poster and embeded title and overview. The two buttons at the bottom let the user add this movie to Favorites, or give a new recommendation.

### How

I implemented it by adding a new tab with several views. The recommendation is generated by querying th TMDB API for the most popular moives and randomly pick one of them. The Favorite button works exactly as the one at the detail page. The Next button generates another random index and shows the new recommendation.

### Why

I think the Discover tab  works great as the homepage. It is concise and beautiful with big screen posters. It also includes basic functions for users to browse and add to Favorites.

## Collections Tab 



### What

In the Collections tab, user can browse the top popular movies in different genres. The movies are presented mosiaclly with posters and titles. User can swipe horizontally for the whole collections. The images are cached to provide smooth browsing. And a spinner is shown when data is being pulled.

### How

I implemented this by adding 4 UICollectionViews together at the same tab. The data is collected by querying the API for popular movies lists with specific genres. To identify different data to present in different collection views, I tagged them as 1 to 4 and made switch cases.

### Why

This tab provides a general browsing experience. User can see from this tab the most popular movies now and get to know the current trend.

## Poster Saving 



### What

At the movie detail view, the right Download button let User save high-resolution posters to their Photo Library (if there is a poster).

### How

This feature is implemented using  UIImageWriteToSavedPhotosAlbum() structure to save the poster UIImage to Photos. A key requesting for privacy access is added in the App's info.plist.

### Why

When User find the movie poster attracting, they might want to save a high-resolution picture as their desktop or lockscreen. Also, one of the core information the App's presenting is image, so saving posters should be a important feature.



# Note

Thanks for trying and testing my App! 

1. I just want to make a note that, at the Search tab, you need to press Enter on the keyboard after done editing the textbox to start searching. 
2. All the overviews shown in my app are scrollable.