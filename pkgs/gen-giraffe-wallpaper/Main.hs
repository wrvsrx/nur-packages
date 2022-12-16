{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text as T
import qualified Data.Text.Read as T
import System.Environment (getArgs)
import Turtle

black = "black.png"
squarePng = "giraffe.png"
outputPng = "output.png"

main = do
  args <- getArgs
  let svg = T.pack (head args)
      width = read (args !! 1) :: Integer
      height = read (args !! 2) :: Integer
      pick = either error id
      isWidthLarger = width > height
      widthCenter = width * 2 `div` 3
      heightCenter = height * 2 `div` 3
      widthText = T.pack (show width)
      heightText = T.pack (show height)
      widthCenterText = T.pack (show widthCenter)
      heightCenterText = T.pack (show heightCenter)
  print svg
  stdout
    ( inproc "convert" ["-size", widthText <> "x" <> heightText, "xc:black", black] empty
        <|> inproc "inkscape" (["--export-type", "png", "--export-filename", squarePng] <> (if isWidthLarger then ["-h", heightCenterText] else ["-w", widthCenterText]) <> [svg]) empty
        <|> inproc "convert" [black, squarePng, "-gravity", "Center", "-composite", outputPng] empty
    )
