Release Notes For BookMyShow:
1. Every functionality except, "Add to fav" is implemented
2. Somehow, API- https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=< PHOTO_REFERENCE>&key=<YOUR_API_KEY> is not returning the image data, so for now just displaying a blue imageview.
3. Though "Add to fav" functionality is not there, adding the places in Database code is written, but I couldn't complete the entire functionality. I used SQLLite, instead of Coredata, as I didn't have time to learn Core data and implement it. Unfortunately, I didn't get a chance to work on Coredata before. But learning is not a problem for me.
4. Tested on iPhone 6, iOS 8.2
5. Async imageview is implemented- LazyloadingImageView.

6. TEST
