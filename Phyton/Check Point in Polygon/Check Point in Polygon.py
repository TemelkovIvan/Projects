
from shapely.geometry import Point, Polygon

# Create Point objects
p1 = Point(24.749277, 42.14617) 	

p2 = Point(24.74631666666667, 42.1452167)

# Create a Polygon
coords = [(24.74615047949183,42.14458063154625), (24.74743988292816,42.14430510143152),(24.74811202269086,42.1443987469094), (24.74825082857407,42.14502364269543) , (24.74793607777265,42.14572477195082) , (24.74737282038544,42.14631215929776) , (24.74710786146509,42.14671487295487) , (24.74693536851887,42.14695008019315),(24.7459483173376,42.14678943244348) , (24.74505203019381,42.14661933077117),(24.7455258003286,42.1456814680819),(24.74615047949183,42.14458063154625)]

poly = Polygon(coords)

# Let's check what we have
print(p1)
print(p2)
print(poly)

# Check if p1 is within the polygon using the within function
print(p1.within(poly))

# Check if p2 is within the polygon
print(p2.within(poly))
