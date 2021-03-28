# Cache-MemoryBlock
Contains script to generate memory block/cache based on positional encoding

it takes only **two transistor swithes delay**(for 12 bit row/column selection), and about 14 transistors switches for 12 bit address decode.
Totally it has about 2176 transistors.

Synthesis result - 0,3 ns (150 nm (osu150)) for 8 bit selector (for 10-12 bit about 0,4).

**TODO:** Make balanced tree version.
Read about SSD, DDR, HBM.
