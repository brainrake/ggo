module Main

import public Data.Matrix


data Stone = Black | White

data Occupancy = Full Stone | Empty

b : Occupancy
b = Full Black

w : Occupancy
w = Full White

e : Occupancy
e = Empty

Board : Nat -> Nat -> Type
Board m n = Matrix m n Occupancy

board : Board 3 3
board = [ [b, w, b]
        , [w, w, w]
        , [e, e, e] ]

data Point : Type where
  PointC :  Board m n -> Fin m -> Fin n -> Point

occAt : Point -> Occupancy
occAt (PointC board x y) = indices x y board


point : Point
point = PointC board 1 1

neighbors : Point -> List Point
neighbors (PointC board x y) = ?

--Group : Type
--Group = Cell

--group : Cell -> List Cell
--group (CellC board x y) =


Show Stone where
  show Black = "B"
  show White = "W"

Show Occupancy where
  show (Full Black) = "B"
  show (Full White) = "W"
  show Empty = "E"

Show Point where
  show point@(PointC board x y) =
    unwords [(show $ finToNat x), (show $ finToNat y), (show $ occAt point)]


main : IO ()
main = do
  putStrLn $ show board
  putStrLn $ show $ occAt point
  -- putStrLn $ show $ neighbors point
