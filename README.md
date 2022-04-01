# Cache-MemoryBlock
Contains script to generate memory block/cache based on positional encoding

To get 1 Tbs wits 1-1-1-1 timings with 64 bit address and 1 kb blocks we need to connect selector in series.
Each selector decrease last N address bits, and **send remain address bits only to selected group (next N selectors)**.
That's allows us to get 64 bit selector that works on 1 Ghz or more. (because of constant branching factor).
((256/4)*2*8=1024 ps).
For 4 Gb modules its about 512 ps.


it takes only **two transistor swithes delay**(for 12 bit row/column selection), and about **14 transistors switches** for 12 bit address decode.
Totally it has about 2176 transistors.

For **180nm** (osu018) selector delay is about **0,3 ns**. 

**TODO:** Make balanced tree version.

Make selectors thats decrease last N bits of address.

Read about SSD, DDR, HBM.

Make InMemoryComputing ) (with reading 8 bit values from eeprom or so).

Calculate metrics with respect to FO4-FO(N).

Add more int to script in repository.
