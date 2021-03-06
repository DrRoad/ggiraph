library(ggplot2)
library(ggiraph)

# Generate data
huron <- data.frame(year = 1875:1972, level = as.vector(LakeHuron))
h <- ggplot(huron, aes(year))

g <- h +
  geom_ribbon_interactive(aes(ymin = level - 1, ymax = level + 1),
                          fill = "grey70", tooltip = "ribbon1", data_id="ribbon1",
                          outline.type = "both",
                          hover_css = "stroke:red;stroke-width:inherit;") +
  geom_line_interactive(aes(y = level), tooltip = "level", data_id="line1",
                        hover_css = "stroke:orange;fill:none;")
x <- girafe(ggobj = g)
x <- girafe_options(x = x,
                    opts_hover(css = girafe_css(
                      css = "stroke:orange;stroke-width:3px;",
                      area = "fill:blue;"
                    )))
if( interactive() ) print(x)


g <- h + geom_area_interactive(aes(y = level), tooltip = "area1")
x <- girafe(ggobj = g)
if( interactive() ) print(x)
