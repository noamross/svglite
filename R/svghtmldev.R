#' A fixed-size SVG graphics device for iterative plot development
#'
#' Set \code{svglitedev()} as your graphics device at the start of a session
#' and your plotting commands will appear in the R Studio viewer or browser
#' window.  Then use svglite(), knitr, or another tool to produce the final file.
#'
#'
#' @param file the file where output will appear.
#' @param height,width Height and width in inches.
#' @param bg Default background color for the plot (defaults to "white").
#' @param pointsize default point size.
#' @export
#' @examples
#' svglitedev()
#' plot(1:10)
#' hist(rnorm(100))
#'
#' @export
svglitedev = function(width = 10, height = 8, bg = "white", pointsize = 12) {
  file = tempfile(fileext=".svg")
  htmlfile = tempfile(fileext=".html")

  htmltext = sprintf(
    '<html>
  <script>
    window.onload = function() {
      var image = document.getElementById("img");
      var path = document.URL.substr(0,document.URL.lastIndexOf("/"))
      function updateImage() {
        image.src = path + "/" + "%s" + "?" + new Date().getTime();
      }

      setInterval(updateImage, 1000);
    }
  </script>

  <body>
  <img id="img" src="%s" style="margin:5px 5px 5px 5px;height:100%%;width:100%%"/>
  </body>
</html>', basename(file), basename(file))

  cat(htmltext, file=htmlfile)

  svglite(file = file, width = width, height = height, bg = "white", pointsize = 12, standalone = TRUE, overwrite_page = TRUE)
  viewer <- getOption("viewer")
  if (!is.null(viewer))
    viewer(htmlfile)
  else
    utils::browseURL(htmlfile)
}
