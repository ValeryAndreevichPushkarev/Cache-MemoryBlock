# Cache-MemoryBlock
Contains script to generate memory block/cache based on positional encoding

To get 1 Tbs wits 1-1-1-1 timings with 64 bit address and 1 kb blocks we need to connect selectors in series.
Each selector decrease last N address bits, and **send remain address bits only when it is active, to selected group (next N selectors), where N - branching factor**.
That's allows us to get 64 bit selector that works on 1 Ghz or more. (because of constant branching factor).
((256/4)x2x8=1024 ps).
For 4 Gb modules its about 512 ps. (or (32/4)x2x5=80 ps for 25 bit row and column selector (50 bit address space))

For high-speed and low power application (with less cache size) we can use version where **remain address bits transfers only to next selector** (btw, thats takes more transistors).

Current python version works different.

it takes only **two transistor swithes delay**(for 12 bit row/column selection), and about **14 transistors switches** for 12 bit address decode.
Totally it has about 2176 transistors.

For **180nm** (osu018) selector delay is about **0,3 ns**. 

**TODO:** Make balanced tree version.

Make selectors thats decrease last N bits of address.

Make normal and low-power version.

Read about SSD, DDR, HBM.

Make InMemoryComputing ) (with reading 8 bit values from eeprom or so).

Add more int to script in repository.
