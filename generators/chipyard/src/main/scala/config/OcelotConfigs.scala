package chipyard

import org.chipsalliance.cde.config.{Config}
import freechips.rocketchip.devices.tilelink.{BootROMLocated}

// ---------------------
// Ocelot Configs
// ---------------------

class SmallOcelotConfig extends Config(
  new boom.common.WithVector(1) ++                               // Add vector 
  new boom.common.WithNSmallBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class SmallOcelotCosimConfig extends Config(
  new boom.common.WithBoomDebugHarness ++                        // Enable debug harness
  new WithCustomBootROM ++                                       // Use custom BootROM to enable COSIM
  new boom.common.WithVector(1) ++                               // Add vector 
  new boom.common.WithNSmallBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class MediumOcelotConfig extends Config(
  new boom.common.WithVector(2) ++                               // Add vector 
  new boom.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)

class MediumOcelotCosimConfig extends Config(
  new boom.common.WithBoomDebugHarness ++                        // Enable debug harness
  new WithCustomBootROM ++                                       // Use custom BootROM to enable COSIM
  new boom.common.WithVector(2) ++                               // Add vector 
  new boom.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)
