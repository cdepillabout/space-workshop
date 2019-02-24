module Test3 where

import Graphics.Rendering.Chart
import Data.Time.LocalTime
import Data.Colour
import Data.Colour.Names
import Data.Colour.SRGB
import Control.Lens
import Data.Default.Class
import Prices(prices1)

import Utils

green1 = opaque $ sRGB 0.5 1 0.5
blue1 = opaque $ sRGB 0.5 0.5 1

chart :: Renderable (LayoutPick LocalTime Double Double)
chart = layoutToRenderable layout
  where
    price1 = plot_fillbetween_style .~ solidFillStyle green1
           $ plot_fillbetween_values .~ [ (d,(0,v2)) | (d,v1,v2) <- prices1]
           $ plot_fillbetween_title .~ "price 1"
           $ def

    price2 = plot_fillbetween_style .~ solidFillStyle blue1
           $ plot_fillbetween_values .~ [ (d,(0,v1)) | (d,v1,v2) <- prices1]
           $ plot_fillbetween_title .~ "price 2"
           $ def

    layout = layout_title .~ "Price History"
           $ layout_grid_last .~ True
           $ layout_plots .~ [ toPlot price1
                             , toPlot price2 ]
           $ def

-- main = main' "test3" chart
