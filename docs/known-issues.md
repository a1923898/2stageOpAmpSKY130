# Known issues and verification status

The repository records a simulated Sky130 design, not measured silicon.

## Reproduction
The uploaded Xschem files use absolute `/home/ttuser/` paths for Sky130 PDK models, symbols and extracted netlists. Update these paths and validate in your own Xschem/ngspice installation.

The Magic hierarchy includes all seven uniquely named child `.mag` files, placed beside `layout/2stage_final.mag`. Five obsolete `~/projects/xschem_test` search hints were removed from the repository copy. Re-open the layout and re-run DRC/LVS to verify portability.

## Simulation caveats
- `testbenches/postlayout/2stage_OL_pex.sch` uses the capacitance-only `2stage_pex.spice` netlist and underpins the published AC data.
- `testbenches/postlayout/2stage_OL_pexRC.sch` currently includes `2stage_pex_flat_c.spice`, *not* the RC extracted netlist. Do not cite it as a validated full-RC test.
- `extraction/2stage_pex_rc.spice` contains explicit parasitic resistors and capacitors, but it still requires a verified simulation setup.
- Several pre-layout testbenches use a 7 µA bias current and ideal compensation components, while the capacitance-only post-layout AC setup uses 6 µA. Test conditions are not matched across all runs.
- `diffpairPVTVar.sch` is a supply-voltage sweep, not a full PVT process/temperature sweep.

## Further work
- [ ] Verify all relocated Xschem and Magic path references
- [ ] Confirm layout loads in a fresh Magic environment
- [ ] Re-run and publish DRC and LVS evidence
- [ ] Validate true RC-PEX with matching schematic/testbench pins and models
- [ ] Add schematic/layout screenshots and post-layout transient results
- [ ] Add matching-condition process corner analysis
