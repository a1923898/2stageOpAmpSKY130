# Testbench selection

- `prelayout/`: schematic-level frequency response, power, CMRR, PSRR, voltage, temperature and transient exploration; bias/compensation parameters vary between historical revisions.
- `postlayout/2stage_OL_pex.sch`: capacitance-only post-layout AC testbench corresponding to published numeric results.
- `postlayout/2stage_OL_pexRC.sch`: original, **not yet validated as RC-PEX**, because its `.include` targets the capacitance-only netlist.

See [known issues](../docs/known-issues.md).
