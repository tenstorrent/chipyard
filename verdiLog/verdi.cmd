simSetSimulator "-vcssv" -exec "sims/vcs/simv-chipyard-SmallBobcatConfig-debug" \
           -args \
           "+permissive +cosim +dramsim +dramsim_ini_dir=/root/my-chipyard/generators/testchipip/src/main/resources/dramsim2_ini +max-cycles=10000000 +loadmem=/root/my-chipyard/sims/vcs/output/chipyard.TestHarness.SmallBobcatConfig/ms4p5_vle64_2.loadmem_hex +loadmem_addr=80000000 +testfile=/root/my-chipyard/tests/rvv/bringup_tests/ms4p5_vle64_2.elf +whisper_path=/root/my-chipyard/sims/whisper/build-Linux/whisper +whisper_json_path=/root/my-chipyard/sims/cosim/bridge/whisper/config/bobcat.json +bootcode=/root/my-chipyard/sims/cosim/bootrom/bootrom +ntb_random_seed_automatic +verbose +fsdbfile=/root/my-chipyard/sims/vcs/output/chipyard.TestHarness.SmallBobcatConfig/ms4p5_vle64_2.fsdb +permissive-off /root/my-chipyard/tests/rvv/bringup_tests/ms4p5_vle64_2.elf"
debImport "-dbdir" "sims/vcs/simv-chipyard-SmallBobcatConfig-debug.daidir/"
debLoadSimResult \
           /root/my-chipyard/sims/vcs/output/chipyard.TestHarness.SmallBobcatConfig/ms4p5_vle64_2.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.lsu" \
           -win $_nTrace1
srcSetScope \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.lsu" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.lsu" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clock" -line 72 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_core_VGen_req_valid" -line 239 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_core_VGen_req_ready" -line 475 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_req_ready" -line 429 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_req_valid" -line 504 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoom -win $_nWave2 840356.266938 1110979.471545
wvZoomAll -win $_nWave2
debReload
wvZoom -win $_nWave2 1937092.411924 2471217.157859
wvZoom -win $_nWave2 2205240.404294 2318144.822134
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_req_bits_0_bits_uop_stq_idx" -line 541 -pos 1 -win \
          $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_req_bits_0_bits_uop_ldq_idx" -line 540 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "dsq_tail" -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "dsq_tail" -line 4098 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "dsq_full" -next
srcDeselectAll -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "dsq_full" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "dsq_full" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "dsq_head" -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "dsq_head" -line 4235 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_resp_0_valid" -line 430 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_resp_0_bits_uop_ldq_idx" -line 431 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_resp_0_bits_uop_stq_idx" -line 432 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
verdiSetActWin -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_nack_0_valid" -line 439 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_nack_0_bits_uop_ldq_idx" -line 440 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_nack_0_bits_uop_uses_ldq" -line 443 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_nack_0_bits_uop_uses_stq" -line 444 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_nack_0_bits_uop_uses_ldq" -line 443 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_nack_0_bits_uop_ldq_idx" -line 440 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_req_bits_0_bits_addr" -line 589 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoom -win $_nWave2 2269724.431555 2292213.522914
wvZoom -win $_nWave2 2274935.318577 2284077.225633
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2279456.722473 -snap {("G1" 5)}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2213506.162626 2240461.162293
wvZoom -win $_nWave2 2218637.839391 2222253.753980
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2223503.155362 -snap {("G1" 15)}
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 2228775.139235 -snap {("G1" 11)}
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoom -win $_nWave2 2224896.367646 2234166.435943
wvZoomOut -win $_nWave2
debReload
wvSetCursor -win $_nWave2 2225500.000000
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 2179159.166667 2304218.516260
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 2267276.865567 -snap {("G1" 8)}
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core" \
           -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core.vec_exe_unit.iresp_fu_units_0" \
           -win $_nTrace1
srcSetScope \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core.vec_exe_unit.iresp_fu_units_0" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core.vec_exe_unit.iresp_fu_units_0" \
           -win $_nTrace1
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core.vec_exe_unit.iresp_fu_units_0.sv_pipeline.vpuModule" \
           -win $_nTrace1
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core.vec_exe_unit.iresp_fu_units_0.sv_pipeline.vpuModule" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core.vec_exe_unit.iresp_fu_units_0.sv_pipeline.vpuModule" \
           -win $_nTrace1
srcSetScope \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core.vec_exe_unit.iresp_fu_units_0.sv_pipeline.vpuModule" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core.vec_exe_unit.iresp_fu_units_0.sv_pipeline.vpuModule" \
           -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_valid" -line 33 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_data" -line 32 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "load_seq_id" -line 31 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "memop_sync_start" -line 38 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "memop_sync_end" -line 37 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoom -win $_nWave2 2265412.837321 2283460.019884
debReload
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.lsu" \
           -win $_nTrace1
srcSetScope \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.lsu" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.lsu" \
           -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_core_VGen_reqHelp_bits_elemID" -line 326 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_core_VGen_reqHelp_bits_vRegID" -line 327 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core.vec_exe_unit.iresp_fu_units_0.sv_pipeline.vIdGen" \
           -win $_nTrace1
srcSetScope \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core.vec_exe_unit.iresp_fu_units_0.sv_pipeline.vIdGen" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "TestDriver.testHarness.chiptop.system.tile_prci_domain.tile_reset_domain_boom_tile.core.vec_exe_unit.iresp_fu_units_0.sv_pipeline.vIdGen" \
           -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "count" -line 117 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoom -win $_nWave2 2236330.070240 2263718.748384
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_sliceSize" -line 94 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "currentVD" -line 83 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
verdiSetActWin -win $_nWave2
debReload
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 2171342.957317 2304218.516260
wvZoom -win $_nWave2 2266138.325587 2286213.697975
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
wvSelectSignal -win $_nWave2 {( "G1" 22 23 24 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 21)}
