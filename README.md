# Cache-MemoryBlock
Contains script to generate memory block/cache based on positional encoding

First of all, those selectors takes only **8 transistors"** per row for any bitness.

Total count of transistor is **2x8x2^Selector_bitness**, that less than modern DRAM modules has.

Transistor switches count is **about 2x4xSelector_bitness/Base_bitness** for **25 bit selector - 40 transistors**.

Delay is about 80 ps for 25 bit selector on 7 nm (5 bit base, 5 stages), so it can be used even in modern RAM modules and CPU Caches (but also in SSD, HBM).

## How it works
To get 1 Tbs wits 1-1-1-1 timings with 64 bit address and 1 kb blocks we need to connect selector in series.
Each selector decrease last N address bits, and **send remain address bits only to selected group (next N selectors), where N - branching factor**.
That's allows us to get 64 bit selector that works on 1 Ghz or more. (because of constant branching factor).
((256/4)x2x8=1024 ps).
For 4 Gb modules its about 512 ps. (or (32/4)*2*5=80 ps for row and column selector))


it takes only **two transistor swithes delay**(for 12 bit row/column selection), and about **14 transistors switches** for 12 bit address decode.
Totally it has about 2176 transistors.

For **180nm** (osu018) selector delay is about **0,3 ns**. 

**TODO:** Make arguments to inline memory cell description (to change from RS triggers to DRAM/SSD cells).

Read about SSD, DDR, HBM.

Make InMemoryComputing ) (with reading 8 bit values from eeprom or so).

Verify modules.
