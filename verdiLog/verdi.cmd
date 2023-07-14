simSetSimulator "-vcssv" -exec "sims/vcs/simv-chipyard-SmallBobcatConfig-debug" \
           -args
debImport "-dbdir" "sims/vcs/simv-chipyard-SmallBobcatConfig-debug.daidir/"
debLoadSimResult \
           /root/my-chipyard/sims/vcs/output/chipyard.TestHarness.SmallBobcatConfig/ms3p5_pureload.fsdb
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
srcSelect -signal "io_dmem_req_bits_0_bits_uop_uses_ldq" -line 565 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_req_bits_0_bits_uop_uses_stq" -line 566 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_req_bits_0_bits_uop_is_vec" -line 562 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_req_bits_0_bits_uop_stq_idx" -line 541 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_req_bits_0_bits_uop_ldq_idx" -line 540 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoom -win $_nWave2 2146458.705962 2354649.061653
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_dmem_req_valid" -line 504 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
verdiSetActWin -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "can_fire_vector_load" \
           -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "can_fire_vector_load_0" -line 4560 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
verdiSetActWin -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 8)}
uniFindSearchString -win nWave_2 -pattern "dlq_finish" -next
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "dlq_finish" -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "dlq_finished" -line 4671 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
debReload
verdiSetActWin -win $_nWave2
wvZoom -win $_nWave2 2205558.813709 2221356.455875
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
uniFindSearchString -win nWave_2 -pattern "can_fire_vector_load" -next
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "can_fire_vector_load" \
           -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "can_fire_vector_load" \
           -previous
srcDeselectAll -win $_nTrace1
srcSelect -signal "_GEN_312\[ldq_head\]" -line 4586 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "_GEN_313\[ldq_head\]" -line 4586 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
verdiSetActWin -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 9)}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "ldq_0*vectorNoYoung" -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "ldq_0_bits_vectorNoYoung" -line 733 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "ldq_0_bits_vectorHasCross" -line 732 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "ldq_0_bits_vectorCanGo" -line 731 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "stq_head" -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "stq_head" -line 4104 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2225530.629618 -snap {("G1" 13)}
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
