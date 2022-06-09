module Main.CSS where

import Prelude

import CSS ((?))
import CSS as CSS
import CSS.Color (blue)
import CSS.Common (auto)
import CSS.Geometry (margin)

main :: CSS.CSS
main = do
  CSS.fromString ".main" ? do
    CSS.width $ CSS.pct 100.0
    CSS.maxWidth $ CSS.px 1200.0
    CSS.minHeight $ CSS.vh 100.0
    CSS.backgroundColor blue
    margin (CSS.px 0.0) auto (CSS.px 0.0) auto