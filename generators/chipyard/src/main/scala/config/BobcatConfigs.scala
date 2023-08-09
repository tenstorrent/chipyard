package chipyard

import org.chipsalliance.cde.config.{Config}
import freechips.rocketchip.devices.tilelink.{BootROMLocated}

// ---------------------
// Bobcat Configs
// ---------------------
class SmallBobcatConfig extends Config(
  new boom.common.WithVector(1) ++
  new boom.common.WithBoomDebugHarness ++                        // Enable debug harness
  new WithCustomBootROM ++                                       // Use custom BootROM to enable COSIM
  new boom.common.WithNSmallBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class MediumBobcatConfig extends Config(
  new boom.common.WithVector(2) ++
  new boom.common.WithBoomDebugHarness ++                        // Enable debug harness
  new WithCustomBootROM ++                                       // Use custom BootROM to enable COSIM
  new boom.common.WithNMediumBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class LargeBobcatConfig extends Config(
  new boom.common.WithVector(3) ++
  new boom.common.WithBoomDebugHarness ++                        // Enable debug harness
  new WithCustomBootROM ++                                       // Use custom BootROM to enable COSIM
  new boom.common.WithNLargeBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class MegaBobcatConfig extends Config(
  new boom.common.WithVector(4) ++
  new boom.common.WithBoomDebugHarness ++                        // Enable debug harness
  new WithCustomBootROM ++                                       // Use custom BootROM to enable COSIM
  new boom.common.WithNMegaBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

