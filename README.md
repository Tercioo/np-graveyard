# np-graveyard
Add information about a dead citizen to a tomb stone.


To add a new tombstone, open graveyard-data.lua and go into the 'graveyard.tombstonesData' table.
Make a copy of a tombstone table.

Edit the .region:
- name: to a different name.
- payload: is the table index number within the 'tombstonesData'.
- squareSize, regionCoords, worldHeight: 
	use '/regionpaint 3' to paint the region area around the new tombstone.
	use '/regionpaint' to stop painting, the result is shown in the console, just copy from there.

.tooltipWorldLocation is where the tooltip's top left corner is anchored

Now edit the tooltip content:
edit the character name, photo, birth and death dates, desc text.
