# svglite 1.0.0.9000

# svglite 1.0.0

svglite is fully featured svg graphics device that works on all platforms, forked from RSvgDevice. It supports all graphics device features:

* All types of line dashing are supported (#15). All line end and line join 
  styles are supported (#24).

* Text is now coloured, and uses the same default fonts as R (Arial, 
  Times New Roman, and Courier). Font metrics are computed using the 
  gdtools package so that `plotmath()` and `strwidth()` now work.

* Transparent colours are now generated with `rgba()` rather than using 
  `stroke-opacity` and `fill-opacity` styles (#16). NA fills and colours are 
  translated to "none".

* `par(bg)` affects the background colour (#8).

* Rasters are supported by embedding base64-encoded pngs in a data url (#2).

* `polypath()` is now supported, which also allows the `showtext` package to 
  render fonts correctly with this device (#36).

We also made a few other tweaks to the rendered SVG:

* Only the `viewBox` attribute of `<svg>` is set (not `width` and `height`):
  I'm reasonably certain this makes it easier to use in more places (#12).

* Default styling properties are specified in a global `<style>` element:
  this reduces overall file size, and should make it easier to re-style
  the output for your own needs.

* You can now only produce a single page per device - previously this worked
  but produced incorrect output (#5).

* Output no longer contains dummy `<desc>` element (#4)

And added some helper functions:

* `xmlSVG()` and `htmlSVG()` make it easier to view generated SVG, either as 
  raw XML or in RStudio/the browser. 
  
* `editSVG()` opens the SVG in the default SVG viewer/editor.
