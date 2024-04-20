    # -*- coding: utf-8 -*-
"""
Created on Thu Feb 29 09:48:31 2024

@author: MyPC
"""
import networkx as nx
import osmnx as ox

a1 = 42.66015184871896 
a2 = 23.382812245368946
b1 = 42.658534411193486
b2 = 23.37551127243041

a = a1,a2
b = b1,b2

origin_point = ('42.66015184871896', '23.382812245368946') 
destination_point = ('42.658534411193486', '23.37551127243041')


G = ox.graph_from_place('Bulgaria', network_type='drive')

# вземете най-близките възли до местоположенията 
origin_node = ox.distance.nearest_nodes(G, a2, a1, return_dist = False)
destination_node = ox.distance.nearest_nodes(G, b2, b1, return_dist = False)

#ox.plot_graph_folium(G, tiles='openstreetmap', weight=1,  color="#8b0000")

#shortest_path = ox.shortest_path(G, a, b, weight='length')
#shortest_pathl = nx.shortest_path_length(G, a, b, weight='length')

#print(shortest_path)
#print(shortest_pathl)

path = ox.shortest_path(G, origin_node, destination_node, weight = 'length')
shortest_pathl = nx.shortest_path_length(G, origin_node, destination_node, weight='length')

print(origin_node)

print(destination_node)

print(path)
print(shortest_pathl)

z=0

for x in path:

#  node_id = list(G.nodes)[z]
#  print(G.nodes[node_id]['x']) #lon
#  print(str(G.nodes[node_id]['y']) + ", " + str(G.nodes[node_id]['x'])) #lat
  print(str(G.nodes[x]['x']) + "," + str(G.nodes[x]['y']) + ',0 ')
  z=z+1
