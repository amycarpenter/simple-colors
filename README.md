 I am making this script to practice
 - file layout structure
 - Using Roxygen2
 - create and exporting an R package

 This package is intended to output color palettes
 I want it to be very lightweight and simple
 
 These colors are intended to look nice together. They should provide ample contrast against a white background without being too jarring.
 
 # Background (learning as I go)
 (This is taken from the `par` documentation)
 In the base package, the function `colors()` outputs a list of acceptable color names for `plot`:
 ```r
 [1] "white"                "aliceblue"            "antiquewhite"        
  [4] "antiquewhite1"        "antiquewhite2"        "antiquewhite3"       
  [7] "antiquewhite4"        "aquamarine"           "aquamarine1"         
 [10] "aquamarine2"          "aquamarine3"          "aquamarine4"         
 [13] "azure"                "azure1"               "azure2"              
 [16] "azure3"               "azure4"               "beige"               
 [19] "bisque"               "bisque1"              "bisque2"             
 [22] "bisque3"              "bisque4"              "black"               
 [25] "blanchedalmond"       "blue"                 "blue1"               
 [28] "blue2"                "blue3"                "blue4"  
 ...
 ```
 Alternatively, colors can be specified using a string of the form "`#RRGGBB`". RR, GG, and BB correspond to a hexadecimal digit, from 00 (no pigment) to FF (full pigment for that color).
 
 There are already several functions for quickly creating color palettes. E.g., 
 - `rainbow(n)`
 - `gray(c(0, 0.1, 0.9))` outputs 3 shades of gray
 - `hsv(h=1, s=1, v=1, alpha)` creates vectors of colors with specified hue, saturation, and value.
 
Okay, but the really cool thing is the `palette()` function. This allows you to set the color values, so that you can refer to them by number when you plot (or even just impliciting if you have 2 sets of y-vals?). The default values are
```r
palette()
"black"   "red"     "green3"  "blue"    "cyan"    "magenta" "yellow" "gray"
```
I can set the color palette using `palette(mycols)`. 

So I think that will be the last step of the function `getNiceColors()` - to set the `palette` to the colors the user just specified.

But... we might want be able to restore the plot colors to default. I can do that with `palette("default")`. But do I want that to happen inside the package, or the user has to do it? Maybe just add a note in the function documention on how to restore default ;)

Again, the goal of this package is to produce a list of colors that I feel confident are pretty. So I don't waste time playing around with the colors when I just need to make a graph.

For starters, I want to focus on a set of high-contrast colors for basic plots, when different groups need to be distinguished by color. 
Then maybe later I'm think about monochromatic, heatmaps, diff background/axis colors... though their might already be stuff for that. Goal is to make something really simple for quick plots.

Fun fact: I need to define at least 2 colors
```
palette("black")
Error in palette("black") : unknown palette (need >= 2 colors)
```

# Color inspiration
I want these colors to look yummy
Here is a yummy blue color: #5656FB
Nice yummy salmon: #FD5879
Trying to find a nice deep spinach salad base: #489E2E

oh oh! What if you made one of the color palettes based on a good taco salad?!
- green base
- black beans
- carrot / cheese
- tomato
- meat (brown)
- (avocado, brocolli, chips, watermelon radish... would these have enough saturation?)

Fruit Bowl
- apple
- orange
- blueberries
- (kiwi)

Apple orchard
- green (grass / leaves)
- apples (yummy red/pink)
- brown (tree trunk)
- blue (sky)
- black/gray (seeds?)

Need to make sure that each color looks good on it's own, and in combination with any other set of the other colors