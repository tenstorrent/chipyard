package chipyard

import org.chipsalliance.cde.config.{Config}
import freechips.rocketchip.devices.tilelink.{BootROMLocated}

// ---------------------
// BOOM Configs
// ---------------------

class WithCustomBootROM extends Config((site, here, up) => {
    case BootROMLocated(x) => up(BootROMLocated(x), site)
        .map(_.copy(contentFileName = s"generators/boom/src/main/resources/bootrom/bootrom.rv64.img"))
})

class SmallBoomConfig extends Config(
  new boom.common.WithNSmallBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class SmallBoomVecConfig extends Config(
  new boom.common.WithBoomDebugHarness ++                        // Enable debug harness
  new WithCustomBootROM ++                                       // Use custom BootROM to enable COSIM
  new boom.common.WithVector(1) ++                               // Add vector 
  new boom.common.WithNSmallBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class MediumBoomConfig extends Config(
  new boom.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)

class MediumBoomVecConfig extends Config(
  new boom.common.WithBoomDebugHarness ++                        // Enable debug harness
  new WithCustomBootROM ++                                       // Use custom BootROM to enable COSIM
  new boom.common.WithVector(2) ++                               // Add vector 
  new boom.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)

class LargeBoomConfig extends Config(
  new boom.common.WithNLargeBooms(1) ++                          // large boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class MegaBoomConfig extends Config(
  new boom.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class DualSmallBoomConfig extends Config(
  new boom.common.WithNSmallBooms(2) ++                          // 2 boom cores
  new chipyard.config.AbstractConfig)

class Cloned64MegaBoomConfig extends Config(
  new boom.common.WithCloneBoomTiles(63, 0) ++
  new boom.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class LoopbackNICLargeBoomConfig extends Config(
  new chipyard.harness.WithLoopbackNIC ++                        // drive NIC IOs with loopback
  new icenet.WithIceNIC ++                                       // build a NIC
  new boom.common.WithNLargeBooms(1) ++
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class DromajoBoomConfig extends Config(
  new chipyard.harness.WithSimDromajoBridge ++                   // attach Dromajo
  new chipyard.config.WithTraceIO ++                             // enable the traceio
  new boom.common.WithNSmallBooms(1) ++
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class MediumBoomCosimConfig extends Config(
  new chipyard.harness.WithCospike ++                            // attach spike-cosim
  new chipyard.config.WithTraceIO ++                             // enable the traceio
  new boom.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)
