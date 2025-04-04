/* Find a color assignment for the regions so that two adjacent regions have different colors. */
map_color([V1,V2,V3,V4,V5]) :-
	[V1,V2,V3,V4,V5] :: [red,green,yellow,blue],
	V1#\=V2, V1#\=V3, V1#\=V4, V1#\=V5, V2#\=V3,
	V2#\=V4, V2#\=V5, V3#\=V4, V4#\=V5,
	labeling([V1,V2,V3,V4,V5]).
