package chipyard

import org.chipsalliance.cde.config.{Config}
import freechips.rocketchip.devices.tilelink.{BootROMLocated}
import freechips.rocketchip.util.{ResourceFileName}

// Swap default chipyard bootrom for the cosim-compatible one shipped with the BOOM submodule.
// Required by the whisper-cosim flow (the cosim bootrom expects HTIF tohost/fromhost and CLINT-poke
// boot for secondary harts).
//
// The `WithBoomDebugHarness` mixin (the whisper-cosim DPI harness) was dropped from every
// config below at plan v2 step A2: it exists only on the M1/M2 boom, not on the v2 branch,
// and it was mixed into the PLAIN V4 configs too, so its absence broke every config here,
// vector or not. It is not described by any Phase-N nlhdl spec, so re-creating it would be
// unspecified RTL and out of A2's scope. It must come back as a specified node before
// gate (e) — the end-to-end cosim regressions — can run, i.e. before step D3.
class WithCustomBootROM extends Config((site, here, up) => {
    case BootROMLocated(x) => up(BootROMLocated(x), site)
        .map(_.copy(contentFileName = ResourceFileName("/bootrom/bootrom.rv64.img")))
})

// ---------------------
// BOOM V3 Configs
// Performant, stable baseline
// ---------------------

class SmallBoomV3Config extends Config(
  new boom.v3.common.WithNSmallBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class MediumBoomV3Config extends Config(
  new boom.v3.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)

class LargeBoomV3Config extends Config(
  new boom.v3.common.WithNLargeBooms(1) ++                          // large boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class MegaBoomV3Config extends Config(
  new boom.v3.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class DualSmallBoomV3Config extends Config(
  new boom.v3.common.WithNSmallBooms(2) ++                          // 2 boom cores
  new chipyard.config.AbstractConfig)

class Cloned64MegaBoomV3Config extends Config(
  new boom.v3.common.WithCloneBoomTiles(63, 0) ++
  new boom.v3.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class LoopbackNICLargeBoomV3Config extends Config(
  new chipyard.harness.WithLoopbackNIC ++                        // drive NIC IOs with loopback
  new icenet.WithIceNIC ++                                       // build a NIC
  new boom.v3.common.WithNLargeBooms(1) ++
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class MediumBoomV3CosimConfig extends Config(
  new chipyard.harness.WithCospike ++                            // attach spike-cosim
  new chipyard.config.WithTraceIO ++                             // enable the traceio
  new boom.v3.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class dmiCheckpointingMediumBoomV3Config extends Config(
  new chipyard.config.WithNPMPs(0) ++                            // remove PMPs (reduce non-core arch state)
  new chipyard.harness.WithSerialTLTiedOff ++                    // don't attach anything to serial-tl
  new chipyard.config.WithDMIDTM ++                              // have debug module expose a clocked DMI port
  new boom.v3.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class dmiMediumBoomV3CosimConfig extends Config(
  new chipyard.harness.WithCospike ++                            // attach spike-cosim
  new chipyard.config.WithTraceIO ++                             // enable the traceio
  new chipyard.harness.WithSerialTLTiedOff ++                    // don't attach anythint to serial-tl
  new chipyard.config.WithDMIDTM ++                              // have debug module expose a clocked DMI port
  new boom.v3.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class SimBlockDeviceMegaBoomV3Config extends Config(
  new chipyard.harness.WithSimBlockDevice ++                     // drive block-device IOs with SimBlockDevice
  new testchipip.iceblk.WithBlockDevice ++                       // add block-device module to peripherybus
  new boom.v3.common.WithNMegaBooms(1) ++                        // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

// ---------------------
// BOOM V4 Configs
// Less stable and performant, but with more advanced micro-architecture
// Use for PD exploration
// ---------------------

class SmallBoomV4Config extends Config(
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNSmallBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class MediumBoomV4Config extends Config(
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)

class MediumBoomV4CommitLogConfig extends Config(
  new boom.v4.common.WithBoomCommitLogPrintf ++                     // emit per-retired-uop commit log via Chisel printf
  new boom.v4.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class LargeBoomV4Config extends Config(
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNLargeBooms(1) ++                          // large boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class MegaBoomV4Config extends Config(
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

// Caracal RVV 1.0 vector-enabled configs (plan v2, step A2).
//
// Only the two tiers plan v2 step A2 calls for are declared here. The M1/M2-era
// *VectorArithConfig / *VectorSnoopConfig configs were removed: they passed
// `enableVectorArith` / `vecScalarSnoopEnable` as fields of `VectorParams`, which
// they are not in v2 — they are `BoomCoreParams` sub-flags with their own fragments
// (`boom.v4.common.WithVectorArith`, `boom.v4.common.WithVecScalarSnoop`). Re-add
// those configs by composing the fragments when Phase F / Phase G land the logic
// behind them.
//
// NOTE: these do not elaborate yet, and that is expected at A2. `core.scala`
// still hardcodes `BasicDispatcher`, so the three IQ_V_* issueParams entries fall
// through to `require(false)`. Plan step D2 switches it to `CompactingDispatcher`
// (decision D2) and is what makes gate (c) reachable. SmallBoom is deliberately
// absent from the vector matrix (decision D3).
class MediumBoomV4VectorConfig extends Config(
  new boom.v4.common.WithVector() ++                                // enable Caracal vector pipeline
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)

class MegaBoomV4VectorConfig extends Config(
  new boom.v4.common.WithMegaBoomsVector ++                         // Mega-tier vector overrides
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class DualSmallBoomV4Config extends Config(
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNSmallBooms(2) ++                          // 2 boom cores
  new chipyard.config.AbstractConfig)

class Cloned64MegaBoomV4Config extends Config(
  new boom.v4.common.WithCloneBoomTiles(63, 0) ++
  new boom.v4.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class MediumBoomV4CosimConfig extends Config(
  new chipyard.harness.WithCospike ++                            // attach spike-cosim
  new chipyard.config.WithTraceIO ++                             // enable the traceio
  new boom.v4.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class dmiCheckpointingMediumBoomV4Config extends Config(
  new chipyard.config.WithNPMPs(0) ++                            // remove PMPs (reduce non-core arch state)
  new chipyard.harness.WithSerialTLTiedOff ++                    // don't attach anything to serial-tl
  new chipyard.config.WithDMIDTM ++                              // have debug module expose a clocked DMI port
  new boom.v4.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class dmiMediumBoomV4CosimConfig extends Config(
  new chipyard.harness.WithCospike ++                            // attach spike-cosim
  new chipyard.config.WithTraceIO ++                             // enable the traceio
  new chipyard.harness.WithSerialTLTiedOff ++                    // don't attach anythint to serial-tl
  new chipyard.config.WithDMIDTM ++                              // have debug module expose a clocked DMI port
  new boom.v4.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class SimBlockDeviceMegaBoomV4Config extends Config(
  new chipyard.harness.WithSimBlockDevice ++                     // drive block-device IOs with SimBlockDevice
  new testchipip.iceblk.WithBlockDevice ++                       // add block-device module to peripherybus
  new boom.v4.common.WithNMegaBooms(1) ++                        // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)
