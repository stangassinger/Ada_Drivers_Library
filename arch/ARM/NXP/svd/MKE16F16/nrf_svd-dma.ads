--  This spec has been automatically generated from MKE16F16.xml

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package NRF_SVD.DMA is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Enable Debug
   type CR_EDBG_Field is
     (
      --  When in debug mode, the DMA continues to operate.
      Edbg_0,
      --  When in debug mode, the DMA stalls the start of a new channel.
      --  Executing channels are allowed to complete. Channel execution resumes
      --  when the system exits debug mode or the EDBG bit is cleared.
      Edbg_1)
     with Size => 1;
   for CR_EDBG_Field use
     (Edbg_0 => 0,
      Edbg_1 => 1);

   --  Enable Round Robin Channel Arbitration
   type CR_ERCA_Field is
     (
      --  Fixed priority arbitration is used for channel selection .
      Erca_0,
      --  Round robin arbitration is used for channel selection .
      Erca_1)
     with Size => 1;
   for CR_ERCA_Field use
     (Erca_0 => 0,
      Erca_1 => 1);

   --  Halt On Error
   type CR_HOE_Field is
     (
      --  Normal operation
      Hoe_0,
      --  Any error causes the HALT bit to set. Subsequently, all service
      --  requests are ignored until the HALT bit is cleared.
      Hoe_1)
     with Size => 1;
   for CR_HOE_Field use
     (Hoe_0 => 0,
      Hoe_1 => 1);

   --  Halt DMA Operations
   type CR_HALT_Field is
     (
      --  Normal operation
      Halt_0,
      --  Stall the start of any new channels. Executing channels are allowed
      --  to complete. Channel execution resumes when this bit is cleared.
      Halt_1)
     with Size => 1;
   for CR_HALT_Field use
     (Halt_0 => 0,
      Halt_1 => 1);

   --  Continuous Link Mode
   type CR_CLM_Field is
     (
      --  A minor loop channel link made to itself goes through channel
      --  arbitration before being activated again.
      Clm_0,
      --  A minor loop channel link made to itself does not go through channel
      --  arbitration before being activated again. Upon minor loop completion,
      --  the channel activates again if that channel has a minor loop channel
      --  link enabled and the link channel is itself. This effectively applies
      --  the minor loop offsets and restarts the next minor loop.
      Clm_1)
     with Size => 1;
   for CR_CLM_Field use
     (Clm_0 => 0,
      Clm_1 => 1);

   --  Enable Minor Loop Mapping
   type CR_EMLM_Field is
     (
      --  Disabled. TCDn.word2 is defined as a 32-bit NBYTES field.
      Emlm_0,
      --  Enabled. TCDn.word2 is redefined to include individual enable fields,
      --  an offset field, and the NBYTES field. The individual enable fields
      --  allow the minor loop offset to be applied to the source address, the
      --  destination address, or both. The NBYTES field is reduced when either
      --  offset is enabled.
      Emlm_1)
     with Size => 1;
   for CR_EMLM_Field use
     (Emlm_0 => 0,
      Emlm_1 => 1);

   --  Error Cancel Transfer
   type CR_ECX_Field is
     (
      --  Normal operation
      Ecx_0,
      --  Cancel the remaining data transfer in the same fashion as the CX bit.
      --  Stop the executing channel and force the minor loop to finish. The
      --  cancel takes effect after the last write of the current read/write
      --  sequence. The ECX bit clears itself after the cancel is honored. In
      --  addition to cancelling the transfer, ECX treats the cancel as an
      --  error condition, thus updating the Error Status register (DMAx_ES)
      --  and generating an optional error interrupt.
      Ecx_1)
     with Size => 1;
   for CR_ECX_Field use
     (Ecx_0 => 0,
      Ecx_1 => 1);

   --  Cancel Transfer
   type CR_CX_Field is
     (
      --  Normal operation
      Cx_0,
      --  Cancel the remaining data transfer. Stop the executing channel and
      --  force the minor loop to finish. The cancel takes effect after the
      --  last write of the current read/write sequence. The CX bit clears
      --  itself after the cancel has been honored. This cancel retires the
      --  channel normally as if the minor loop was completed.
      Cx_1)
     with Size => 1;
   for CR_CX_Field use
     (Cx_0 => 0,
      Cx_1 => 1);

   --  Control Register
   type DMA_CR_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  Enable Debug
      EDBG           : CR_EDBG_Field := NRF_SVD.DMA.Edbg_0;
      --  Enable Round Robin Channel Arbitration
      ERCA           : CR_ERCA_Field := NRF_SVD.DMA.Erca_0;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  Halt On Error
      HOE            : CR_HOE_Field := NRF_SVD.DMA.Hoe_0;
      --  Halt DMA Operations
      HALT           : CR_HALT_Field := NRF_SVD.DMA.Halt_0;
      --  Continuous Link Mode
      CLM            : CR_CLM_Field := NRF_SVD.DMA.Clm_0;
      --  Enable Minor Loop Mapping
      EMLM           : CR_EMLM_Field := NRF_SVD.DMA.Emlm_0;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Error Cancel Transfer
      ECX            : CR_ECX_Field := NRF_SVD.DMA.Ecx_0;
      --  Cancel Transfer
      CX             : CR_CX_Field := NRF_SVD.DMA.Cx_0;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_CR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      EDBG           at 0 range 1 .. 1;
      ERCA           at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      HOE            at 0 range 4 .. 4;
      HALT           at 0 range 5 .. 5;
      CLM            at 0 range 6 .. 6;
      EMLM           at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      ECX            at 0 range 16 .. 16;
      CX             at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --  Destination Bus Error
   type ES_DBE_Field is
     (
      --  No destination bus error
      Dbe_0,
      --  The last recorded error was a bus error on a destination write
      Dbe_1)
     with Size => 1;
   for ES_DBE_Field use
     (Dbe_0 => 0,
      Dbe_1 => 1);

   --  Source Bus Error
   type ES_SBE_Field is
     (
      --  No source bus error
      Sbe_0,
      --  The last recorded error was a bus error on a source read
      Sbe_1)
     with Size => 1;
   for ES_SBE_Field use
     (Sbe_0 => 0,
      Sbe_1 => 1);

   --  Scatter/Gather Configuration Error
   type ES_SGE_Field is
     (
      --  No scatter/gather configuration error
      Sge_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_DLASTSGA field. This field is checked at the beginning of a
      --  scatter/gather operation after major loop completion if TCDn_CSR[ESG]
      --  is enabled. TCDn_DLASTSGA is not on a 32 byte boundary.
      Sge_1)
     with Size => 1;
   for ES_SGE_Field use
     (Sge_0 => 0,
      Sge_1 => 1);

   --  NBYTES/CITER Configuration Error
   type ES_NCE_Field is
     (
      --  No NBYTES/CITER configuration error
      Nce_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_NBYTES or TCDn_CITER fields. TCDn_NBYTES is not a multiple of
      --  TCDn_ATTR[SSIZE] and TCDn_ATTR[DSIZE], or TCDn_CITER[CITER] is equal
      --  to zero, or TCDn_CITER[ELINK] is not equal to TCDn_BITER[ELINK]
      Nce_1)
     with Size => 1;
   for ES_NCE_Field use
     (Nce_0 => 0,
      Nce_1 => 1);

   --  Destination Offset Error
   type ES_DOE_Field is
     (
      --  No destination offset configuration error
      Doe_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_DOFF field. TCDn_DOFF is inconsistent with TCDn_ATTR[DSIZE].
      Doe_1)
     with Size => 1;
   for ES_DOE_Field use
     (Doe_0 => 0,
      Doe_1 => 1);

   --  Destination Address Error
   type ES_DAE_Field is
     (
      --  No destination address configuration error
      Dae_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_DADDR field. TCDn_DADDR is inconsistent with TCDn_ATTR[DSIZE].
      Dae_1)
     with Size => 1;
   for ES_DAE_Field use
     (Dae_0 => 0,
      Dae_1 => 1);

   --  Source Offset Error
   type ES_SOE_Field is
     (
      --  No source offset configuration error
      Soe_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_SOFF field. TCDn_SOFF is inconsistent with TCDn_ATTR[SSIZE].
      Soe_1)
     with Size => 1;
   for ES_SOE_Field use
     (Soe_0 => 0,
      Soe_1 => 1);

   --  Source Address Error
   type ES_SAE_Field is
     (
      --  No source address configuration error.
      Sae_0,
      --  The last recorded error was a configuration error detected in the
      --  TCDn_SADDR field. TCDn_SADDR is inconsistent with TCDn_ATTR[SSIZE].
      Sae_1)
     with Size => 1;
   for ES_SAE_Field use
     (Sae_0 => 0,
      Sae_1 => 1);

   subtype DMA_ES_ERRCHN_Field is HAL.UInt4;

   --  Channel Priority Error
   type ES_CPE_Field is
     (
      --  No channel priority error
      Cpe_0,
      --  The last recorded error was a configuration error in the channel
      --  priorities . Channel priorities are not unique.
      Cpe_1)
     with Size => 1;
   for ES_CPE_Field use
     (Cpe_0 => 0,
      Cpe_1 => 1);

   --  Transfer Canceled
   type ES_ECX_Field is
     (
      --  No canceled transfers
      Ecx_0,
      --  The last recorded entry was a canceled transfer by the error cancel
      --  transfer input
      Ecx_1)
     with Size => 1;
   for ES_ECX_Field use
     (Ecx_0 => 0,
      Ecx_1 => 1);

   --  Logical OR of all ERR status bits
   type ES_VLD_Field is
     (
      --  No ERR bits are set.
      Vld_0,
      --  At least one ERR bit is set indicating a valid error exists that has
      --  not been cleared.
      Vld_1)
     with Size => 1;
   for ES_VLD_Field use
     (Vld_0 => 0,
      Vld_1 => 1);

   --  Error Status Register
   type DMA_ES_Register is record
      --  Read-only. Destination Bus Error
      DBE            : ES_DBE_Field;
      --  Read-only. Source Bus Error
      SBE            : ES_SBE_Field;
      --  Read-only. Scatter/Gather Configuration Error
      SGE            : ES_SGE_Field;
      --  Read-only. NBYTES/CITER Configuration Error
      NCE            : ES_NCE_Field;
      --  Read-only. Destination Offset Error
      DOE            : ES_DOE_Field;
      --  Read-only. Destination Address Error
      DAE            : ES_DAE_Field;
      --  Read-only. Source Offset Error
      SOE            : ES_SOE_Field;
      --  Read-only. Source Address Error
      SAE            : ES_SAE_Field;
      --  Read-only. Error Channel Number or Canceled Channel Number
      ERRCHN         : DMA_ES_ERRCHN_Field;
      --  unspecified
      Reserved_12_13 : HAL.UInt2;
      --  Read-only. Channel Priority Error
      CPE            : ES_CPE_Field;
      --  unspecified
      Reserved_15_15 : HAL.Bit;
      --  Read-only. Transfer Canceled
      ECX            : ES_ECX_Field;
      --  unspecified
      Reserved_17_30 : HAL.UInt14;
      --  Read-only. Logical OR of all ERR status bits
      VLD            : ES_VLD_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_ES_Register use record
      DBE            at 0 range 0 .. 0;
      SBE            at 0 range 1 .. 1;
      SGE            at 0 range 2 .. 2;
      NCE            at 0 range 3 .. 3;
      DOE            at 0 range 4 .. 4;
      DAE            at 0 range 5 .. 5;
      SOE            at 0 range 6 .. 6;
      SAE            at 0 range 7 .. 7;
      ERRCHN         at 0 range 8 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      CPE            at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      ECX            at 0 range 16 .. 16;
      Reserved_17_30 at 0 range 17 .. 30;
      VLD            at 0 range 31 .. 31;
   end record;

   --  Enable DMA Request 0
   type ERQ_ERQ0_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq0_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq0_1)
     with Size => 1;
   for ERQ_ERQ0_Field use
     (Erq0_0 => 0,
      Erq0_1 => 1);

   --  Enable DMA Request 1
   type ERQ_ERQ1_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq1_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq1_1)
     with Size => 1;
   for ERQ_ERQ1_Field use
     (Erq1_0 => 0,
      Erq1_1 => 1);

   --  Enable DMA Request 2
   type ERQ_ERQ2_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq2_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq2_1)
     with Size => 1;
   for ERQ_ERQ2_Field use
     (Erq2_0 => 0,
      Erq2_1 => 1);

   --  Enable DMA Request 3
   type ERQ_ERQ3_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq3_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq3_1)
     with Size => 1;
   for ERQ_ERQ3_Field use
     (Erq3_0 => 0,
      Erq3_1 => 1);

   --  Enable DMA Request 4
   type ERQ_ERQ4_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq4_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq4_1)
     with Size => 1;
   for ERQ_ERQ4_Field use
     (Erq4_0 => 0,
      Erq4_1 => 1);

   --  Enable DMA Request 5
   type ERQ_ERQ5_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq5_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq5_1)
     with Size => 1;
   for ERQ_ERQ5_Field use
     (Erq5_0 => 0,
      Erq5_1 => 1);

   --  Enable DMA Request 6
   type ERQ_ERQ6_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq6_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq6_1)
     with Size => 1;
   for ERQ_ERQ6_Field use
     (Erq6_0 => 0,
      Erq6_1 => 1);

   --  Enable DMA Request 7
   type ERQ_ERQ7_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq7_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq7_1)
     with Size => 1;
   for ERQ_ERQ7_Field use
     (Erq7_0 => 0,
      Erq7_1 => 1);

   --  Enable DMA Request 8
   type ERQ_ERQ8_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq8_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq8_1)
     with Size => 1;
   for ERQ_ERQ8_Field use
     (Erq8_0 => 0,
      Erq8_1 => 1);

   --  Enable DMA Request 9
   type ERQ_ERQ9_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq9_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq9_1)
     with Size => 1;
   for ERQ_ERQ9_Field use
     (Erq9_0 => 0,
      Erq9_1 => 1);

   --  Enable DMA Request 10
   type ERQ_ERQ10_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq10_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq10_1)
     with Size => 1;
   for ERQ_ERQ10_Field use
     (Erq10_0 => 0,
      Erq10_1 => 1);

   --  Enable DMA Request 11
   type ERQ_ERQ11_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq11_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq11_1)
     with Size => 1;
   for ERQ_ERQ11_Field use
     (Erq11_0 => 0,
      Erq11_1 => 1);

   --  Enable DMA Request 12
   type ERQ_ERQ12_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq12_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq12_1)
     with Size => 1;
   for ERQ_ERQ12_Field use
     (Erq12_0 => 0,
      Erq12_1 => 1);

   --  Enable DMA Request 13
   type ERQ_ERQ13_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq13_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq13_1)
     with Size => 1;
   for ERQ_ERQ13_Field use
     (Erq13_0 => 0,
      Erq13_1 => 1);

   --  Enable DMA Request 14
   type ERQ_ERQ14_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq14_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq14_1)
     with Size => 1;
   for ERQ_ERQ14_Field use
     (Erq14_0 => 0,
      Erq14_1 => 1);

   --  Enable DMA Request 15
   type ERQ_ERQ15_Field is
     (
      --  The DMA request signal for the corresponding channel is disabled
      Erq15_0,
      --  The DMA request signal for the corresponding channel is enabled
      Erq15_1)
     with Size => 1;
   for ERQ_ERQ15_Field use
     (Erq15_0 => 0,
      Erq15_1 => 1);

   --  Enable Request Register
   type DMA_ERQ_Register is record
      --  Enable DMA Request 0
      ERQ0           : ERQ_ERQ0_Field := NRF_SVD.DMA.Erq0_0;
      --  Enable DMA Request 1
      ERQ1           : ERQ_ERQ1_Field := NRF_SVD.DMA.Erq1_0;
      --  Enable DMA Request 2
      ERQ2           : ERQ_ERQ2_Field := NRF_SVD.DMA.Erq2_0;
      --  Enable DMA Request 3
      ERQ3           : ERQ_ERQ3_Field := NRF_SVD.DMA.Erq3_0;
      --  Enable DMA Request 4
      ERQ4           : ERQ_ERQ4_Field := NRF_SVD.DMA.Erq4_0;
      --  Enable DMA Request 5
      ERQ5           : ERQ_ERQ5_Field := NRF_SVD.DMA.Erq5_0;
      --  Enable DMA Request 6
      ERQ6           : ERQ_ERQ6_Field := NRF_SVD.DMA.Erq6_0;
      --  Enable DMA Request 7
      ERQ7           : ERQ_ERQ7_Field := NRF_SVD.DMA.Erq7_0;
      --  Enable DMA Request 8
      ERQ8           : ERQ_ERQ8_Field := NRF_SVD.DMA.Erq8_0;
      --  Enable DMA Request 9
      ERQ9           : ERQ_ERQ9_Field := NRF_SVD.DMA.Erq9_0;
      --  Enable DMA Request 10
      ERQ10          : ERQ_ERQ10_Field := NRF_SVD.DMA.Erq10_0;
      --  Enable DMA Request 11
      ERQ11          : ERQ_ERQ11_Field := NRF_SVD.DMA.Erq11_0;
      --  Enable DMA Request 12
      ERQ12          : ERQ_ERQ12_Field := NRF_SVD.DMA.Erq12_0;
      --  Enable DMA Request 13
      ERQ13          : ERQ_ERQ13_Field := NRF_SVD.DMA.Erq13_0;
      --  Enable DMA Request 14
      ERQ14          : ERQ_ERQ14_Field := NRF_SVD.DMA.Erq14_0;
      --  Enable DMA Request 15
      ERQ15          : ERQ_ERQ15_Field := NRF_SVD.DMA.Erq15_0;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_ERQ_Register use record
      ERQ0           at 0 range 0 .. 0;
      ERQ1           at 0 range 1 .. 1;
      ERQ2           at 0 range 2 .. 2;
      ERQ3           at 0 range 3 .. 3;
      ERQ4           at 0 range 4 .. 4;
      ERQ5           at 0 range 5 .. 5;
      ERQ6           at 0 range 6 .. 6;
      ERQ7           at 0 range 7 .. 7;
      ERQ8           at 0 range 8 .. 8;
      ERQ9           at 0 range 9 .. 9;
      ERQ10          at 0 range 10 .. 10;
      ERQ11          at 0 range 11 .. 11;
      ERQ12          at 0 range 12 .. 12;
      ERQ13          at 0 range 13 .. 13;
      ERQ14          at 0 range 14 .. 14;
      ERQ15          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Enable Error Interrupt 0
   type EEI_EEI0_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei0_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei0_1)
     with Size => 1;
   for EEI_EEI0_Field use
     (Eei0_0 => 0,
      Eei0_1 => 1);

   --  Enable Error Interrupt 1
   type EEI_EEI1_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei1_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei1_1)
     with Size => 1;
   for EEI_EEI1_Field use
     (Eei1_0 => 0,
      Eei1_1 => 1);

   --  Enable Error Interrupt 2
   type EEI_EEI2_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei2_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei2_1)
     with Size => 1;
   for EEI_EEI2_Field use
     (Eei2_0 => 0,
      Eei2_1 => 1);

   --  Enable Error Interrupt 3
   type EEI_EEI3_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei3_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei3_1)
     with Size => 1;
   for EEI_EEI3_Field use
     (Eei3_0 => 0,
      Eei3_1 => 1);

   --  Enable Error Interrupt 4
   type EEI_EEI4_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei4_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei4_1)
     with Size => 1;
   for EEI_EEI4_Field use
     (Eei4_0 => 0,
      Eei4_1 => 1);

   --  Enable Error Interrupt 5
   type EEI_EEI5_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei5_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei5_1)
     with Size => 1;
   for EEI_EEI5_Field use
     (Eei5_0 => 0,
      Eei5_1 => 1);

   --  Enable Error Interrupt 6
   type EEI_EEI6_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei6_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei6_1)
     with Size => 1;
   for EEI_EEI6_Field use
     (Eei6_0 => 0,
      Eei6_1 => 1);

   --  Enable Error Interrupt 7
   type EEI_EEI7_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei7_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei7_1)
     with Size => 1;
   for EEI_EEI7_Field use
     (Eei7_0 => 0,
      Eei7_1 => 1);

   --  Enable Error Interrupt 8
   type EEI_EEI8_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei8_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei8_1)
     with Size => 1;
   for EEI_EEI8_Field use
     (Eei8_0 => 0,
      Eei8_1 => 1);

   --  Enable Error Interrupt 9
   type EEI_EEI9_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei9_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei9_1)
     with Size => 1;
   for EEI_EEI9_Field use
     (Eei9_0 => 0,
      Eei9_1 => 1);

   --  Enable Error Interrupt 10
   type EEI_EEI10_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei10_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei10_1)
     with Size => 1;
   for EEI_EEI10_Field use
     (Eei10_0 => 0,
      Eei10_1 => 1);

   --  Enable Error Interrupt 11
   type EEI_EEI11_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei11_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei11_1)
     with Size => 1;
   for EEI_EEI11_Field use
     (Eei11_0 => 0,
      Eei11_1 => 1);

   --  Enable Error Interrupt 12
   type EEI_EEI12_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei12_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei12_1)
     with Size => 1;
   for EEI_EEI12_Field use
     (Eei12_0 => 0,
      Eei12_1 => 1);

   --  Enable Error Interrupt 13
   type EEI_EEI13_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei13_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei13_1)
     with Size => 1;
   for EEI_EEI13_Field use
     (Eei13_0 => 0,
      Eei13_1 => 1);

   --  Enable Error Interrupt 14
   type EEI_EEI14_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei14_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei14_1)
     with Size => 1;
   for EEI_EEI14_Field use
     (Eei14_0 => 0,
      Eei14_1 => 1);

   --  Enable Error Interrupt 15
   type EEI_EEI15_Field is
     (
      --  The error signal for corresponding channel does not generate an error
      --  interrupt
      Eei15_0,
      --  The assertion of the error signal for corresponding channel generates
      --  an error interrupt request
      Eei15_1)
     with Size => 1;
   for EEI_EEI15_Field use
     (Eei15_0 => 0,
      Eei15_1 => 1);

   --  Enable Error Interrupt Register
   type DMA_EEI_Register is record
      --  Enable Error Interrupt 0
      EEI0           : EEI_EEI0_Field := NRF_SVD.DMA.Eei0_0;
      --  Enable Error Interrupt 1
      EEI1           : EEI_EEI1_Field := NRF_SVD.DMA.Eei1_0;
      --  Enable Error Interrupt 2
      EEI2           : EEI_EEI2_Field := NRF_SVD.DMA.Eei2_0;
      --  Enable Error Interrupt 3
      EEI3           : EEI_EEI3_Field := NRF_SVD.DMA.Eei3_0;
      --  Enable Error Interrupt 4
      EEI4           : EEI_EEI4_Field := NRF_SVD.DMA.Eei4_0;
      --  Enable Error Interrupt 5
      EEI5           : EEI_EEI5_Field := NRF_SVD.DMA.Eei5_0;
      --  Enable Error Interrupt 6
      EEI6           : EEI_EEI6_Field := NRF_SVD.DMA.Eei6_0;
      --  Enable Error Interrupt 7
      EEI7           : EEI_EEI7_Field := NRF_SVD.DMA.Eei7_0;
      --  Enable Error Interrupt 8
      EEI8           : EEI_EEI8_Field := NRF_SVD.DMA.Eei8_0;
      --  Enable Error Interrupt 9
      EEI9           : EEI_EEI9_Field := NRF_SVD.DMA.Eei9_0;
      --  Enable Error Interrupt 10
      EEI10          : EEI_EEI10_Field := NRF_SVD.DMA.Eei10_0;
      --  Enable Error Interrupt 11
      EEI11          : EEI_EEI11_Field := NRF_SVD.DMA.Eei11_0;
      --  Enable Error Interrupt 12
      EEI12          : EEI_EEI12_Field := NRF_SVD.DMA.Eei12_0;
      --  Enable Error Interrupt 13
      EEI13          : EEI_EEI13_Field := NRF_SVD.DMA.Eei13_0;
      --  Enable Error Interrupt 14
      EEI14          : EEI_EEI14_Field := NRF_SVD.DMA.Eei14_0;
      --  Enable Error Interrupt 15
      EEI15          : EEI_EEI15_Field := NRF_SVD.DMA.Eei15_0;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_EEI_Register use record
      EEI0           at 0 range 0 .. 0;
      EEI1           at 0 range 1 .. 1;
      EEI2           at 0 range 2 .. 2;
      EEI3           at 0 range 3 .. 3;
      EEI4           at 0 range 4 .. 4;
      EEI5           at 0 range 5 .. 5;
      EEI6           at 0 range 6 .. 6;
      EEI7           at 0 range 7 .. 7;
      EEI8           at 0 range 8 .. 8;
      EEI9           at 0 range 9 .. 9;
      EEI10          at 0 range 10 .. 10;
      EEI11          at 0 range 11 .. 11;
      EEI12          at 0 range 12 .. 12;
      EEI13          at 0 range 13 .. 13;
      EEI14          at 0 range 14 .. 14;
      EEI15          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DMA_CEEI_CEEI_Field is HAL.UInt4;

   --  Clear All Enable Error Interrupts
   type CEEI_CAEE_Field is
     (
      --  Clear only the EEI bit specified in the CEEI field
      Caee_0,
      --  Clear all bits in EEI
      Caee_1)
     with Size => 1;
   for CEEI_CAEE_Field use
     (Caee_0 => 0,
      Caee_1 => 1);

   --  No Op enable
   type CEEI_NOP_Field is
     (
      --  Normal operation
      Nop_0,
      --  No operation, ignore the other bits in this register
      Nop_1)
     with Size => 1;
   for CEEI_NOP_Field use
     (Nop_0 => 0,
      Nop_1 => 1);

   --  Clear Enable Error Interrupt Register
   type DMA_CEEI_Register is record
      --  Write-only. Clear Enable Error Interrupt
      CEEI         : DMA_CEEI_CEEI_Field := 16#0#;
      --  unspecified
      Reserved_4_5 : HAL.UInt2 := 16#0#;
      --  Write-only. Clear All Enable Error Interrupts
      CAEE         : CEEI_CAEE_Field := NRF_SVD.DMA.Caee_0;
      --  Write-only. No Op enable
      NOP          : CEEI_NOP_Field := NRF_SVD.DMA.Nop_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_CEEI_Register use record
      CEEI         at 0 range 0 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      CAEE         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_SEEI_SEEI_Field is HAL.UInt4;

   --  Sets All Enable Error Interrupts
   type SEEI_SAEE_Field is
     (
      --  Set only the EEI bit specified in the SEEI field.
      Saee_0,
      --  Sets all bits in EEI
      Saee_1)
     with Size => 1;
   for SEEI_SAEE_Field use
     (Saee_0 => 0,
      Saee_1 => 1);

   --  No Op enable
   type SEEI_NOP_Field is
     (
      --  Normal operation
      Nop_0,
      --  No operation, ignore the other bits in this register
      Nop_1)
     with Size => 1;
   for SEEI_NOP_Field use
     (Nop_0 => 0,
      Nop_1 => 1);

   --  Set Enable Error Interrupt Register
   type DMA_SEEI_Register is record
      --  Write-only. Set Enable Error Interrupt
      SEEI         : DMA_SEEI_SEEI_Field := 16#0#;
      --  unspecified
      Reserved_4_5 : HAL.UInt2 := 16#0#;
      --  Write-only. Sets All Enable Error Interrupts
      SAEE         : SEEI_SAEE_Field := NRF_SVD.DMA.Saee_0;
      --  Write-only. No Op enable
      NOP          : SEEI_NOP_Field := NRF_SVD.DMA.Nop_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_SEEI_Register use record
      SEEI         at 0 range 0 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      SAEE         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_CERQ_CERQ_Field is HAL.UInt4;

   --  Clear All Enable Requests
   type CERQ_CAER_Field is
     (
      --  Clear only the ERQ bit specified in the CERQ field
      Caer_0,
      --  Clear all bits in ERQ
      Caer_1)
     with Size => 1;
   for CERQ_CAER_Field use
     (Caer_0 => 0,
      Caer_1 => 1);

   --  No Op enable
   type CERQ_NOP_Field is
     (
      --  Normal operation
      Nop_0,
      --  No operation, ignore the other bits in this register
      Nop_1)
     with Size => 1;
   for CERQ_NOP_Field use
     (Nop_0 => 0,
      Nop_1 => 1);

   --  Clear Enable Request Register
   type DMA_CERQ_Register is record
      --  Write-only. Clear Enable Request
      CERQ         : DMA_CERQ_CERQ_Field := 16#0#;
      --  unspecified
      Reserved_4_5 : HAL.UInt2 := 16#0#;
      --  Write-only. Clear All Enable Requests
      CAER         : CERQ_CAER_Field := NRF_SVD.DMA.Caer_0;
      --  Write-only. No Op enable
      NOP          : CERQ_NOP_Field := NRF_SVD.DMA.Nop_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_CERQ_Register use record
      CERQ         at 0 range 0 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      CAER         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_SERQ_SERQ_Field is HAL.UInt4;

   --  Set All Enable Requests
   type SERQ_SAER_Field is
     (
      --  Set only the ERQ bit specified in the SERQ field
      Saer_0,
      --  Set all bits in ERQ
      Saer_1)
     with Size => 1;
   for SERQ_SAER_Field use
     (Saer_0 => 0,
      Saer_1 => 1);

   --  No Op enable
   type SERQ_NOP_Field is
     (
      --  Normal operation
      Nop_0,
      --  No operation, ignore the other bits in this register
      Nop_1)
     with Size => 1;
   for SERQ_NOP_Field use
     (Nop_0 => 0,
      Nop_1 => 1);

   --  Set Enable Request Register
   type DMA_SERQ_Register is record
      --  Write-only. Set Enable Request
      SERQ         : DMA_SERQ_SERQ_Field := 16#0#;
      --  unspecified
      Reserved_4_5 : HAL.UInt2 := 16#0#;
      --  Write-only. Set All Enable Requests
      SAER         : SERQ_SAER_Field := NRF_SVD.DMA.Saer_0;
      --  Write-only. No Op enable
      NOP          : SERQ_NOP_Field := NRF_SVD.DMA.Nop_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_SERQ_Register use record
      SERQ         at 0 range 0 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      SAER         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_CDNE_CDNE_Field is HAL.UInt4;

   --  Clears All DONE Bits
   type CDNE_CADN_Field is
     (
      --  Clears only the TCDn_CSR[DONE] bit specified in the CDNE field
      Cadn_0,
      --  Clears all bits in TCDn_CSR[DONE]
      Cadn_1)
     with Size => 1;
   for CDNE_CADN_Field use
     (Cadn_0 => 0,
      Cadn_1 => 1);

   --  No Op enable
   type CDNE_NOP_Field is
     (
      --  Normal operation
      Nop_0,
      --  No operation, ignore the other bits in this register
      Nop_1)
     with Size => 1;
   for CDNE_NOP_Field use
     (Nop_0 => 0,
      Nop_1 => 1);

   --  Clear DONE Status Bit Register
   type DMA_CDNE_Register is record
      --  Write-only. Clear DONE Bit
      CDNE         : DMA_CDNE_CDNE_Field := 16#0#;
      --  unspecified
      Reserved_4_5 : HAL.UInt2 := 16#0#;
      --  Write-only. Clears All DONE Bits
      CADN         : CDNE_CADN_Field := NRF_SVD.DMA.Cadn_0;
      --  Write-only. No Op enable
      NOP          : CDNE_NOP_Field := NRF_SVD.DMA.Nop_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_CDNE_Register use record
      CDNE         at 0 range 0 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      CADN         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_SSRT_SSRT_Field is HAL.UInt4;

   --  Set All START Bits (activates all channels)
   type SSRT_SAST_Field is
     (
      --  Set only the TCDn_CSR[START] bit specified in the SSRT field
      Sast_0,
      --  Set all bits in TCDn_CSR[START]
      Sast_1)
     with Size => 1;
   for SSRT_SAST_Field use
     (Sast_0 => 0,
      Sast_1 => 1);

   --  No Op enable
   type SSRT_NOP_Field is
     (
      --  Normal operation
      Nop_0,
      --  No operation, ignore the other bits in this register
      Nop_1)
     with Size => 1;
   for SSRT_NOP_Field use
     (Nop_0 => 0,
      Nop_1 => 1);

   --  Set START Bit Register
   type DMA_SSRT_Register is record
      --  Write-only. Set START Bit
      SSRT         : DMA_SSRT_SSRT_Field := 16#0#;
      --  unspecified
      Reserved_4_5 : HAL.UInt2 := 16#0#;
      --  Write-only. Set All START Bits (activates all channels)
      SAST         : SSRT_SAST_Field := NRF_SVD.DMA.Sast_0;
      --  Write-only. No Op enable
      NOP          : SSRT_NOP_Field := NRF_SVD.DMA.Nop_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_SSRT_Register use record
      SSRT         at 0 range 0 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      SAST         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_CERR_CERR_Field is HAL.UInt4;

   --  Clear All Error Indicators
   type CERR_CAEI_Field is
     (
      --  Clear only the ERR bit specified in the CERR field
      Caei_0,
      --  Clear all bits in ERR
      Caei_1)
     with Size => 1;
   for CERR_CAEI_Field use
     (Caei_0 => 0,
      Caei_1 => 1);

   --  No Op enable
   type CERR_NOP_Field is
     (
      --  Normal operation
      Nop_0,
      --  No operation, ignore the other bits in this register
      Nop_1)
     with Size => 1;
   for CERR_NOP_Field use
     (Nop_0 => 0,
      Nop_1 => 1);

   --  Clear Error Register
   type DMA_CERR_Register is record
      --  Write-only. Clear Error Indicator
      CERR         : DMA_CERR_CERR_Field := 16#0#;
      --  unspecified
      Reserved_4_5 : HAL.UInt2 := 16#0#;
      --  Write-only. Clear All Error Indicators
      CAEI         : CERR_CAEI_Field := NRF_SVD.DMA.Caei_0;
      --  Write-only. No Op enable
      NOP          : CERR_NOP_Field := NRF_SVD.DMA.Nop_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_CERR_Register use record
      CERR         at 0 range 0 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      CAEI         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   subtype DMA_CINT_CINT_Field is HAL.UInt4;

   --  Clear All Interrupt Requests
   type CINT_CAIR_Field is
     (
      --  Clear only the INT bit specified in the CINT field
      Cair_0,
      --  Clear all bits in INT
      Cair_1)
     with Size => 1;
   for CINT_CAIR_Field use
     (Cair_0 => 0,
      Cair_1 => 1);

   --  No Op enable
   type CINT_NOP_Field is
     (
      --  Normal operation
      Nop_0,
      --  No operation, ignore the other bits in this register
      Nop_1)
     with Size => 1;
   for CINT_NOP_Field use
     (Nop_0 => 0,
      Nop_1 => 1);

   --  Clear Interrupt Request Register
   type DMA_CINT_Register is record
      --  Write-only. Clear Interrupt Request
      CINT         : DMA_CINT_CINT_Field := 16#0#;
      --  unspecified
      Reserved_4_5 : HAL.UInt2 := 16#0#;
      --  Write-only. Clear All Interrupt Requests
      CAIR         : CINT_CAIR_Field := NRF_SVD.DMA.Cair_0;
      --  Write-only. No Op enable
      NOP          : CINT_NOP_Field := NRF_SVD.DMA.Nop_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_CINT_Register use record
      CINT         at 0 range 0 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      CAIR         at 0 range 6 .. 6;
      NOP          at 0 range 7 .. 7;
   end record;

   --  Interrupt Request 0
   type INT_INT0_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int0_0,
      --  The interrupt request for corresponding channel is active
      Int0_1)
     with Size => 1;
   for INT_INT0_Field use
     (Int0_0 => 0,
      Int0_1 => 1);

   --  Interrupt Request 1
   type INT_INT1_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int1_0,
      --  The interrupt request for corresponding channel is active
      Int1_1)
     with Size => 1;
   for INT_INT1_Field use
     (Int1_0 => 0,
      Int1_1 => 1);

   --  Interrupt Request 2
   type INT_INT2_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int2_0,
      --  The interrupt request for corresponding channel is active
      Int2_1)
     with Size => 1;
   for INT_INT2_Field use
     (Int2_0 => 0,
      Int2_1 => 1);

   --  Interrupt Request 3
   type INT_INT3_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int3_0,
      --  The interrupt request for corresponding channel is active
      Int3_1)
     with Size => 1;
   for INT_INT3_Field use
     (Int3_0 => 0,
      Int3_1 => 1);

   --  Interrupt Request 4
   type INT_INT4_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int4_0,
      --  The interrupt request for corresponding channel is active
      Int4_1)
     with Size => 1;
   for INT_INT4_Field use
     (Int4_0 => 0,
      Int4_1 => 1);

   --  Interrupt Request 5
   type INT_INT5_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int5_0,
      --  The interrupt request for corresponding channel is active
      Int5_1)
     with Size => 1;
   for INT_INT5_Field use
     (Int5_0 => 0,
      Int5_1 => 1);

   --  Interrupt Request 6
   type INT_INT6_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int6_0,
      --  The interrupt request for corresponding channel is active
      Int6_1)
     with Size => 1;
   for INT_INT6_Field use
     (Int6_0 => 0,
      Int6_1 => 1);

   --  Interrupt Request 7
   type INT_INT7_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int7_0,
      --  The interrupt request for corresponding channel is active
      Int7_1)
     with Size => 1;
   for INT_INT7_Field use
     (Int7_0 => 0,
      Int7_1 => 1);

   --  Interrupt Request 8
   type INT_INT8_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int8_0,
      --  The interrupt request for corresponding channel is active
      Int8_1)
     with Size => 1;
   for INT_INT8_Field use
     (Int8_0 => 0,
      Int8_1 => 1);

   --  Interrupt Request 9
   type INT_INT9_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int9_0,
      --  The interrupt request for corresponding channel is active
      Int9_1)
     with Size => 1;
   for INT_INT9_Field use
     (Int9_0 => 0,
      Int9_1 => 1);

   --  Interrupt Request 10
   type INT_INT10_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int10_0,
      --  The interrupt request for corresponding channel is active
      Int10_1)
     with Size => 1;
   for INT_INT10_Field use
     (Int10_0 => 0,
      Int10_1 => 1);

   --  Interrupt Request 11
   type INT_INT11_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int11_0,
      --  The interrupt request for corresponding channel is active
      Int11_1)
     with Size => 1;
   for INT_INT11_Field use
     (Int11_0 => 0,
      Int11_1 => 1);

   --  Interrupt Request 12
   type INT_INT12_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int12_0,
      --  The interrupt request for corresponding channel is active
      Int12_1)
     with Size => 1;
   for INT_INT12_Field use
     (Int12_0 => 0,
      Int12_1 => 1);

   --  Interrupt Request 13
   type INT_INT13_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int13_0,
      --  The interrupt request for corresponding channel is active
      Int13_1)
     with Size => 1;
   for INT_INT13_Field use
     (Int13_0 => 0,
      Int13_1 => 1);

   --  Interrupt Request 14
   type INT_INT14_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int14_0,
      --  The interrupt request for corresponding channel is active
      Int14_1)
     with Size => 1;
   for INT_INT14_Field use
     (Int14_0 => 0,
      Int14_1 => 1);

   --  Interrupt Request 15
   type INT_INT15_Field is
     (
      --  The interrupt request for corresponding channel is cleared
      Int15_0,
      --  The interrupt request for corresponding channel is active
      Int15_1)
     with Size => 1;
   for INT_INT15_Field use
     (Int15_0 => 0,
      Int15_1 => 1);

   --  Interrupt Request Register
   type DMA_INT_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 0
      INT0           : INT_INT0_Field := NRF_SVD.DMA.Int0_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 1
      INT1           : INT_INT1_Field := NRF_SVD.DMA.Int1_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 2
      INT2           : INT_INT2_Field := NRF_SVD.DMA.Int2_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 3
      INT3           : INT_INT3_Field := NRF_SVD.DMA.Int3_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 4
      INT4           : INT_INT4_Field := NRF_SVD.DMA.Int4_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 5
      INT5           : INT_INT5_Field := NRF_SVD.DMA.Int5_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 6
      INT6           : INT_INT6_Field := NRF_SVD.DMA.Int6_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 7
      INT7           : INT_INT7_Field := NRF_SVD.DMA.Int7_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 8
      INT8           : INT_INT8_Field := NRF_SVD.DMA.Int8_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 9
      INT9           : INT_INT9_Field := NRF_SVD.DMA.Int9_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 10
      INT10          : INT_INT10_Field := NRF_SVD.DMA.Int10_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 11
      INT11          : INT_INT11_Field := NRF_SVD.DMA.Int11_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 12
      INT12          : INT_INT12_Field := NRF_SVD.DMA.Int12_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 13
      INT13          : INT_INT13_Field := NRF_SVD.DMA.Int13_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 14
      INT14          : INT_INT14_Field := NRF_SVD.DMA.Int14_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Interrupt Request 15
      INT15          : INT_INT15_Field := NRF_SVD.DMA.Int15_0;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_INT_Register use record
      INT0           at 0 range 0 .. 0;
      INT1           at 0 range 1 .. 1;
      INT2           at 0 range 2 .. 2;
      INT3           at 0 range 3 .. 3;
      INT4           at 0 range 4 .. 4;
      INT5           at 0 range 5 .. 5;
      INT6           at 0 range 6 .. 6;
      INT7           at 0 range 7 .. 7;
      INT8           at 0 range 8 .. 8;
      INT9           at 0 range 9 .. 9;
      INT10          at 0 range 10 .. 10;
      INT11          at 0 range 11 .. 11;
      INT12          at 0 range 12 .. 12;
      INT13          at 0 range 13 .. 13;
      INT14          at 0 range 14 .. 14;
      INT15          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Error In Channel 0
   type ERR_ERR0_Field is
     (
      --  An error in this channel has not occurred
      Err0_0,
      --  An error in this channel has occurred
      Err0_1)
     with Size => 1;
   for ERR_ERR0_Field use
     (Err0_0 => 0,
      Err0_1 => 1);

   --  Error In Channel 1
   type ERR_ERR1_Field is
     (
      --  An error in this channel has not occurred
      Err1_0,
      --  An error in this channel has occurred
      Err1_1)
     with Size => 1;
   for ERR_ERR1_Field use
     (Err1_0 => 0,
      Err1_1 => 1);

   --  Error In Channel 2
   type ERR_ERR2_Field is
     (
      --  An error in this channel has not occurred
      Err2_0,
      --  An error in this channel has occurred
      Err2_1)
     with Size => 1;
   for ERR_ERR2_Field use
     (Err2_0 => 0,
      Err2_1 => 1);

   --  Error In Channel 3
   type ERR_ERR3_Field is
     (
      --  An error in this channel has not occurred
      Err3_0,
      --  An error in this channel has occurred
      Err3_1)
     with Size => 1;
   for ERR_ERR3_Field use
     (Err3_0 => 0,
      Err3_1 => 1);

   --  Error In Channel 4
   type ERR_ERR4_Field is
     (
      --  An error in this channel has not occurred
      Err4_0,
      --  An error in this channel has occurred
      Err4_1)
     with Size => 1;
   for ERR_ERR4_Field use
     (Err4_0 => 0,
      Err4_1 => 1);

   --  Error In Channel 5
   type ERR_ERR5_Field is
     (
      --  An error in this channel has not occurred
      Err5_0,
      --  An error in this channel has occurred
      Err5_1)
     with Size => 1;
   for ERR_ERR5_Field use
     (Err5_0 => 0,
      Err5_1 => 1);

   --  Error In Channel 6
   type ERR_ERR6_Field is
     (
      --  An error in this channel has not occurred
      Err6_0,
      --  An error in this channel has occurred
      Err6_1)
     with Size => 1;
   for ERR_ERR6_Field use
     (Err6_0 => 0,
      Err6_1 => 1);

   --  Error In Channel 7
   type ERR_ERR7_Field is
     (
      --  An error in this channel has not occurred
      Err7_0,
      --  An error in this channel has occurred
      Err7_1)
     with Size => 1;
   for ERR_ERR7_Field use
     (Err7_0 => 0,
      Err7_1 => 1);

   --  Error In Channel 8
   type ERR_ERR8_Field is
     (
      --  An error in this channel has not occurred
      Err8_0,
      --  An error in this channel has occurred
      Err8_1)
     with Size => 1;
   for ERR_ERR8_Field use
     (Err8_0 => 0,
      Err8_1 => 1);

   --  Error In Channel 9
   type ERR_ERR9_Field is
     (
      --  An error in this channel has not occurred
      Err9_0,
      --  An error in this channel has occurred
      Err9_1)
     with Size => 1;
   for ERR_ERR9_Field use
     (Err9_0 => 0,
      Err9_1 => 1);

   --  Error In Channel 10
   type ERR_ERR10_Field is
     (
      --  An error in this channel has not occurred
      Err10_0,
      --  An error in this channel has occurred
      Err10_1)
     with Size => 1;
   for ERR_ERR10_Field use
     (Err10_0 => 0,
      Err10_1 => 1);

   --  Error In Channel 11
   type ERR_ERR11_Field is
     (
      --  An error in this channel has not occurred
      Err11_0,
      --  An error in this channel has occurred
      Err11_1)
     with Size => 1;
   for ERR_ERR11_Field use
     (Err11_0 => 0,
      Err11_1 => 1);

   --  Error In Channel 12
   type ERR_ERR12_Field is
     (
      --  An error in this channel has not occurred
      Err12_0,
      --  An error in this channel has occurred
      Err12_1)
     with Size => 1;
   for ERR_ERR12_Field use
     (Err12_0 => 0,
      Err12_1 => 1);

   --  Error In Channel 13
   type ERR_ERR13_Field is
     (
      --  An error in this channel has not occurred
      Err13_0,
      --  An error in this channel has occurred
      Err13_1)
     with Size => 1;
   for ERR_ERR13_Field use
     (Err13_0 => 0,
      Err13_1 => 1);

   --  Error In Channel 14
   type ERR_ERR14_Field is
     (
      --  An error in this channel has not occurred
      Err14_0,
      --  An error in this channel has occurred
      Err14_1)
     with Size => 1;
   for ERR_ERR14_Field use
     (Err14_0 => 0,
      Err14_1 => 1);

   --  Error In Channel 15
   type ERR_ERR15_Field is
     (
      --  An error in this channel has not occurred
      Err15_0,
      --  An error in this channel has occurred
      Err15_1)
     with Size => 1;
   for ERR_ERR15_Field use
     (Err15_0 => 0,
      Err15_1 => 1);

   --  Error Register
   type DMA_ERR_Register is record
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 0
      ERR0           : ERR_ERR0_Field := NRF_SVD.DMA.Err0_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 1
      ERR1           : ERR_ERR1_Field := NRF_SVD.DMA.Err1_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 2
      ERR2           : ERR_ERR2_Field := NRF_SVD.DMA.Err2_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 3
      ERR3           : ERR_ERR3_Field := NRF_SVD.DMA.Err3_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 4
      ERR4           : ERR_ERR4_Field := NRF_SVD.DMA.Err4_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 5
      ERR5           : ERR_ERR5_Field := NRF_SVD.DMA.Err5_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 6
      ERR6           : ERR_ERR6_Field := NRF_SVD.DMA.Err6_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 7
      ERR7           : ERR_ERR7_Field := NRF_SVD.DMA.Err7_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 8
      ERR8           : ERR_ERR8_Field := NRF_SVD.DMA.Err8_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 9
      ERR9           : ERR_ERR9_Field := NRF_SVD.DMA.Err9_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 10
      ERR10          : ERR_ERR10_Field := NRF_SVD.DMA.Err10_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 11
      ERR11          : ERR_ERR11_Field := NRF_SVD.DMA.Err11_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 12
      ERR12          : ERR_ERR12_Field := NRF_SVD.DMA.Err12_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 13
      ERR13          : ERR_ERR13_Field := NRF_SVD.DMA.Err13_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 14
      ERR14          : ERR_ERR14_Field := NRF_SVD.DMA.Err14_0;
      --  Write data bit of one shall clear (set to zero) the corresponding bit
      --  in the field. Error In Channel 15
      ERR15          : ERR_ERR15_Field := NRF_SVD.DMA.Err15_0;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_ERR_Register use record
      ERR0           at 0 range 0 .. 0;
      ERR1           at 0 range 1 .. 1;
      ERR2           at 0 range 2 .. 2;
      ERR3           at 0 range 3 .. 3;
      ERR4           at 0 range 4 .. 4;
      ERR5           at 0 range 5 .. 5;
      ERR6           at 0 range 6 .. 6;
      ERR7           at 0 range 7 .. 7;
      ERR8           at 0 range 8 .. 8;
      ERR9           at 0 range 9 .. 9;
      ERR10          at 0 range 10 .. 10;
      ERR11          at 0 range 11 .. 11;
      ERR12          at 0 range 12 .. 12;
      ERR13          at 0 range 13 .. 13;
      ERR14          at 0 range 14 .. 14;
      ERR15          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Hardware Request Status Channel 0
   type HRS_HRS0_Field is
     (
      --  A hardware service request for channel 0 is not present
      Hrs0_0,
      --  A hardware service request for channel 0 is present
      Hrs0_1)
     with Size => 1;
   for HRS_HRS0_Field use
     (Hrs0_0 => 0,
      Hrs0_1 => 1);

   --  Hardware Request Status Channel 1
   type HRS_HRS1_Field is
     (
      --  A hardware service request for channel 1 is not present
      Hrs1_0,
      --  A hardware service request for channel 1 is present
      Hrs1_1)
     with Size => 1;
   for HRS_HRS1_Field use
     (Hrs1_0 => 0,
      Hrs1_1 => 1);

   --  Hardware Request Status Channel 2
   type HRS_HRS2_Field is
     (
      --  A hardware service request for channel 2 is not present
      Hrs2_0,
      --  A hardware service request for channel 2 is present
      Hrs2_1)
     with Size => 1;
   for HRS_HRS2_Field use
     (Hrs2_0 => 0,
      Hrs2_1 => 1);

   --  Hardware Request Status Channel 3
   type HRS_HRS3_Field is
     (
      --  A hardware service request for channel 3 is not present
      Hrs3_0,
      --  A hardware service request for channel 3 is present
      Hrs3_1)
     with Size => 1;
   for HRS_HRS3_Field use
     (Hrs3_0 => 0,
      Hrs3_1 => 1);

   --  Hardware Request Status Channel 4
   type HRS_HRS4_Field is
     (
      --  A hardware service request for channel 4 is not present
      Hrs4_0,
      --  A hardware service request for channel 4 is present
      Hrs4_1)
     with Size => 1;
   for HRS_HRS4_Field use
     (Hrs4_0 => 0,
      Hrs4_1 => 1);

   --  Hardware Request Status Channel 5
   type HRS_HRS5_Field is
     (
      --  A hardware service request for channel 5 is not present
      Hrs5_0,
      --  A hardware service request for channel 5 is present
      Hrs5_1)
     with Size => 1;
   for HRS_HRS5_Field use
     (Hrs5_0 => 0,
      Hrs5_1 => 1);

   --  Hardware Request Status Channel 6
   type HRS_HRS6_Field is
     (
      --  A hardware service request for channel 6 is not present
      Hrs6_0,
      --  A hardware service request for channel 6 is present
      Hrs6_1)
     with Size => 1;
   for HRS_HRS6_Field use
     (Hrs6_0 => 0,
      Hrs6_1 => 1);

   --  Hardware Request Status Channel 7
   type HRS_HRS7_Field is
     (
      --  A hardware service request for channel 7 is not present
      Hrs7_0,
      --  A hardware service request for channel 7 is present
      Hrs7_1)
     with Size => 1;
   for HRS_HRS7_Field use
     (Hrs7_0 => 0,
      Hrs7_1 => 1);

   --  Hardware Request Status Channel 8
   type HRS_HRS8_Field is
     (
      --  A hardware service request for channel 8 is not present
      Hrs8_0,
      --  A hardware service request for channel 8 is present
      Hrs8_1)
     with Size => 1;
   for HRS_HRS8_Field use
     (Hrs8_0 => 0,
      Hrs8_1 => 1);

   --  Hardware Request Status Channel 9
   type HRS_HRS9_Field is
     (
      --  A hardware service request for channel 9 is not present
      Hrs9_0,
      --  A hardware service request for channel 9 is present
      Hrs9_1)
     with Size => 1;
   for HRS_HRS9_Field use
     (Hrs9_0 => 0,
      Hrs9_1 => 1);

   --  Hardware Request Status Channel 10
   type HRS_HRS10_Field is
     (
      --  A hardware service request for channel 10 is not present
      Hrs10_0,
      --  A hardware service request for channel 10 is present
      Hrs10_1)
     with Size => 1;
   for HRS_HRS10_Field use
     (Hrs10_0 => 0,
      Hrs10_1 => 1);

   --  Hardware Request Status Channel 11
   type HRS_HRS11_Field is
     (
      --  A hardware service request for channel 11 is not present
      Hrs11_0,
      --  A hardware service request for channel 11 is present
      Hrs11_1)
     with Size => 1;
   for HRS_HRS11_Field use
     (Hrs11_0 => 0,
      Hrs11_1 => 1);

   --  Hardware Request Status Channel 12
   type HRS_HRS12_Field is
     (
      --  A hardware service request for channel 12 is not present
      Hrs12_0,
      --  A hardware service request for channel 12 is present
      Hrs12_1)
     with Size => 1;
   for HRS_HRS12_Field use
     (Hrs12_0 => 0,
      Hrs12_1 => 1);

   --  Hardware Request Status Channel 13
   type HRS_HRS13_Field is
     (
      --  A hardware service request for channel 13 is not present
      Hrs13_0,
      --  A hardware service request for channel 13 is present
      Hrs13_1)
     with Size => 1;
   for HRS_HRS13_Field use
     (Hrs13_0 => 0,
      Hrs13_1 => 1);

   --  Hardware Request Status Channel 14
   type HRS_HRS14_Field is
     (
      --  A hardware service request for channel 14 is not present
      Hrs14_0,
      --  A hardware service request for channel 14 is present
      Hrs14_1)
     with Size => 1;
   for HRS_HRS14_Field use
     (Hrs14_0 => 0,
      Hrs14_1 => 1);

   --  Hardware Request Status Channel 15
   type HRS_HRS15_Field is
     (
      --  A hardware service request for channel 15 is not present
      Hrs15_0,
      --  A hardware service request for channel 15 is present
      Hrs15_1)
     with Size => 1;
   for HRS_HRS15_Field use
     (Hrs15_0 => 0,
      Hrs15_1 => 1);

   --  Hardware Request Status Register
   type DMA_HRS_Register is record
      --  Read-only. Hardware Request Status Channel 0
      HRS0           : HRS_HRS0_Field;
      --  Read-only. Hardware Request Status Channel 1
      HRS1           : HRS_HRS1_Field;
      --  Read-only. Hardware Request Status Channel 2
      HRS2           : HRS_HRS2_Field;
      --  Read-only. Hardware Request Status Channel 3
      HRS3           : HRS_HRS3_Field;
      --  Read-only. Hardware Request Status Channel 4
      HRS4           : HRS_HRS4_Field;
      --  Read-only. Hardware Request Status Channel 5
      HRS5           : HRS_HRS5_Field;
      --  Read-only. Hardware Request Status Channel 6
      HRS6           : HRS_HRS6_Field;
      --  Read-only. Hardware Request Status Channel 7
      HRS7           : HRS_HRS7_Field;
      --  Read-only. Hardware Request Status Channel 8
      HRS8           : HRS_HRS8_Field;
      --  Read-only. Hardware Request Status Channel 9
      HRS9           : HRS_HRS9_Field;
      --  Read-only. Hardware Request Status Channel 10
      HRS10          : HRS_HRS10_Field;
      --  Read-only. Hardware Request Status Channel 11
      HRS11          : HRS_HRS11_Field;
      --  Read-only. Hardware Request Status Channel 12
      HRS12          : HRS_HRS12_Field;
      --  Read-only. Hardware Request Status Channel 13
      HRS13          : HRS_HRS13_Field;
      --  Read-only. Hardware Request Status Channel 14
      HRS14          : HRS_HRS14_Field;
      --  Read-only. Hardware Request Status Channel 15
      HRS15          : HRS_HRS15_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_HRS_Register use record
      HRS0           at 0 range 0 .. 0;
      HRS1           at 0 range 1 .. 1;
      HRS2           at 0 range 2 .. 2;
      HRS3           at 0 range 3 .. 3;
      HRS4           at 0 range 4 .. 4;
      HRS5           at 0 range 5 .. 5;
      HRS6           at 0 range 6 .. 6;
      HRS7           at 0 range 7 .. 7;
      HRS8           at 0 range 8 .. 8;
      HRS9           at 0 range 9 .. 9;
      HRS10          at 0 range 10 .. 10;
      HRS11          at 0 range 11 .. 11;
      HRS12          at 0 range 12 .. 12;
      HRS13          at 0 range 13 .. 13;
      HRS14          at 0 range 14 .. 14;
      HRS15          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Enable asynchronous DMA request in stop mode for channel 0.
   type EARS_EDREQ_0_Field is
     (
      --  Disable asynchronous DMA request for channel 0.
      Edreq_0_0,
      --  Enable asynchronous DMA request for channel 0.
      Edreq_0_1)
     with Size => 1;
   for EARS_EDREQ_0_Field use
     (Edreq_0_0 => 0,
      Edreq_0_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 1.
   type EARS_EDREQ_1_Field is
     (
      --  Disable asynchronous DMA request for channel 1
      Edreq_1_0,
      --  Enable asynchronous DMA request for channel 1.
      Edreq_1_1)
     with Size => 1;
   for EARS_EDREQ_1_Field use
     (Edreq_1_0 => 0,
      Edreq_1_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 2.
   type EARS_EDREQ_2_Field is
     (
      --  Disable asynchronous DMA request for channel 2.
      Edreq_2_0,
      --  Enable asynchronous DMA request for channel 2.
      Edreq_2_1)
     with Size => 1;
   for EARS_EDREQ_2_Field use
     (Edreq_2_0 => 0,
      Edreq_2_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 3.
   type EARS_EDREQ_3_Field is
     (
      --  Disable asynchronous DMA request for channel 3.
      Edreq_3_0,
      --  Enable asynchronous DMA request for channel 3.
      Edreq_3_1)
     with Size => 1;
   for EARS_EDREQ_3_Field use
     (Edreq_3_0 => 0,
      Edreq_3_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 4
   type EARS_EDREQ_4_Field is
     (
      --  Disable asynchronous DMA request for channel 4.
      Edreq_4_0,
      --  Enable asynchronous DMA request for channel 4.
      Edreq_4_1)
     with Size => 1;
   for EARS_EDREQ_4_Field use
     (Edreq_4_0 => 0,
      Edreq_4_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 5
   type EARS_EDREQ_5_Field is
     (
      --  Disable asynchronous DMA request for channel 5.
      Edreq_5_0,
      --  Enable asynchronous DMA request for channel 5.
      Edreq_5_1)
     with Size => 1;
   for EARS_EDREQ_5_Field use
     (Edreq_5_0 => 0,
      Edreq_5_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 6
   type EARS_EDREQ_6_Field is
     (
      --  Disable asynchronous DMA request for channel 6.
      Edreq_6_0,
      --  Enable asynchronous DMA request for channel 6.
      Edreq_6_1)
     with Size => 1;
   for EARS_EDREQ_6_Field use
     (Edreq_6_0 => 0,
      Edreq_6_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 7
   type EARS_EDREQ_7_Field is
     (
      --  Disable asynchronous DMA request for channel 7.
      Edreq_7_0,
      --  Enable asynchronous DMA request for channel 7.
      Edreq_7_1)
     with Size => 1;
   for EARS_EDREQ_7_Field use
     (Edreq_7_0 => 0,
      Edreq_7_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 8
   type EARS_EDREQ_8_Field is
     (
      --  Disable asynchronous DMA request for channel 8.
      Edreq_8_0,
      --  Enable asynchronous DMA request for channel 8.
      Edreq_8_1)
     with Size => 1;
   for EARS_EDREQ_8_Field use
     (Edreq_8_0 => 0,
      Edreq_8_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 9
   type EARS_EDREQ_9_Field is
     (
      --  Disable asynchronous DMA request for channel 9.
      Edreq_9_0,
      --  Enable asynchronous DMA request for channel 9.
      Edreq_9_1)
     with Size => 1;
   for EARS_EDREQ_9_Field use
     (Edreq_9_0 => 0,
      Edreq_9_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 10
   type EARS_EDREQ_10_Field is
     (
      --  Disable asynchronous DMA request for channel 10.
      Edreq_10_0,
      --  Enable asynchronous DMA request for channel 10.
      Edreq_10_1)
     with Size => 1;
   for EARS_EDREQ_10_Field use
     (Edreq_10_0 => 0,
      Edreq_10_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 11
   type EARS_EDREQ_11_Field is
     (
      --  Disable asynchronous DMA request for channel 11.
      Edreq_11_0,
      --  Enable asynchronous DMA request for channel 11.
      Edreq_11_1)
     with Size => 1;
   for EARS_EDREQ_11_Field use
     (Edreq_11_0 => 0,
      Edreq_11_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 12
   type EARS_EDREQ_12_Field is
     (
      --  Disable asynchronous DMA request for channel 12.
      Edreq_12_0,
      --  Enable asynchronous DMA request for channel 12.
      Edreq_12_1)
     with Size => 1;
   for EARS_EDREQ_12_Field use
     (Edreq_12_0 => 0,
      Edreq_12_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 13
   type EARS_EDREQ_13_Field is
     (
      --  Disable asynchronous DMA request for channel 13.
      Edreq_13_0,
      --  Enable asynchronous DMA request for channel 13.
      Edreq_13_1)
     with Size => 1;
   for EARS_EDREQ_13_Field use
     (Edreq_13_0 => 0,
      Edreq_13_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 14
   type EARS_EDREQ_14_Field is
     (
      --  Disable asynchronous DMA request for channel 14.
      Edreq_14_0,
      --  Enable asynchronous DMA request for channel 14.
      Edreq_14_1)
     with Size => 1;
   for EARS_EDREQ_14_Field use
     (Edreq_14_0 => 0,
      Edreq_14_1 => 1);

   --  Enable asynchronous DMA request in stop mode for channel 15
   type EARS_EDREQ_15_Field is
     (
      --  Disable asynchronous DMA request for channel 15.
      Edreq_15_0,
      --  Enable asynchronous DMA request for channel 15.
      Edreq_15_1)
     with Size => 1;
   for EARS_EDREQ_15_Field use
     (Edreq_15_0 => 0,
      Edreq_15_1 => 1);

   --  Enable Asynchronous Request in Stop Register
   type DMA_EARS_Register is record
      --  Enable asynchronous DMA request in stop mode for channel 0.
      EDREQ_0        : EARS_EDREQ_0_Field := NRF_SVD.DMA.Edreq_0_0;
      --  Enable asynchronous DMA request in stop mode for channel 1.
      EDREQ_1        : EARS_EDREQ_1_Field := NRF_SVD.DMA.Edreq_1_0;
      --  Enable asynchronous DMA request in stop mode for channel 2.
      EDREQ_2        : EARS_EDREQ_2_Field := NRF_SVD.DMA.Edreq_2_0;
      --  Enable asynchronous DMA request in stop mode for channel 3.
      EDREQ_3        : EARS_EDREQ_3_Field := NRF_SVD.DMA.Edreq_3_0;
      --  Enable asynchronous DMA request in stop mode for channel 4
      EDREQ_4        : EARS_EDREQ_4_Field := NRF_SVD.DMA.Edreq_4_0;
      --  Enable asynchronous DMA request in stop mode for channel 5
      EDREQ_5        : EARS_EDREQ_5_Field := NRF_SVD.DMA.Edreq_5_0;
      --  Enable asynchronous DMA request in stop mode for channel 6
      EDREQ_6        : EARS_EDREQ_6_Field := NRF_SVD.DMA.Edreq_6_0;
      --  Enable asynchronous DMA request in stop mode for channel 7
      EDREQ_7        : EARS_EDREQ_7_Field := NRF_SVD.DMA.Edreq_7_0;
      --  Enable asynchronous DMA request in stop mode for channel 8
      EDREQ_8        : EARS_EDREQ_8_Field := NRF_SVD.DMA.Edreq_8_0;
      --  Enable asynchronous DMA request in stop mode for channel 9
      EDREQ_9        : EARS_EDREQ_9_Field := NRF_SVD.DMA.Edreq_9_0;
      --  Enable asynchronous DMA request in stop mode for channel 10
      EDREQ_10       : EARS_EDREQ_10_Field := NRF_SVD.DMA.Edreq_10_0;
      --  Enable asynchronous DMA request in stop mode for channel 11
      EDREQ_11       : EARS_EDREQ_11_Field := NRF_SVD.DMA.Edreq_11_0;
      --  Enable asynchronous DMA request in stop mode for channel 12
      EDREQ_12       : EARS_EDREQ_12_Field := NRF_SVD.DMA.Edreq_12_0;
      --  Enable asynchronous DMA request in stop mode for channel 13
      EDREQ_13       : EARS_EDREQ_13_Field := NRF_SVD.DMA.Edreq_13_0;
      --  Enable asynchronous DMA request in stop mode for channel 14
      EDREQ_14       : EARS_EDREQ_14_Field := NRF_SVD.DMA.Edreq_14_0;
      --  Enable asynchronous DMA request in stop mode for channel 15
      EDREQ_15       : EARS_EDREQ_15_Field := NRF_SVD.DMA.Edreq_15_0;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_EARS_Register use record
      EDREQ_0        at 0 range 0 .. 0;
      EDREQ_1        at 0 range 1 .. 1;
      EDREQ_2        at 0 range 2 .. 2;
      EDREQ_3        at 0 range 3 .. 3;
      EDREQ_4        at 0 range 4 .. 4;
      EDREQ_5        at 0 range 5 .. 5;
      EDREQ_6        at 0 range 6 .. 6;
      EDREQ_7        at 0 range 7 .. 7;
      EDREQ_8        at 0 range 8 .. 8;
      EDREQ_9        at 0 range 9 .. 9;
      EDREQ_10       at 0 range 10 .. 10;
      EDREQ_11       at 0 range 11 .. 11;
      EDREQ_12       at 0 range 12 .. 12;
      EDREQ_13       at 0 range 13 .. 13;
      EDREQ_14       at 0 range 14 .. 14;
      EDREQ_15       at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DMA_DCHPRI_CHPRI_Field is HAL.UInt4;

   --  Disable Preempt Ability.
   type DCHPRI_DPA_Field is
     (
      --  Channel n can suspend a lower priority channel.
      Dpa_0,
      --  Channel n cannot suspend any channel, regardless of channel priority.
      Dpa_1)
     with Size => 1;
   for DCHPRI_DPA_Field use
     (Dpa_0 => 0,
      Dpa_1 => 1);

   --  Enable Channel Preemption.
   type DCHPRI_ECP_Field is
     (
      --  Channel n cannot be suspended by a higher priority channel's service
      --  request.
      Ecp_0,
      --  Channel n can be temporarily suspended by the service request of a
      --  higher priority channel.
      Ecp_1)
     with Size => 1;
   for DCHPRI_ECP_Field use
     (Ecp_0 => 0,
      Ecp_1 => 1);

   --  Channel n Priority Register
   type DMA_DCHPRI_Register is record
      --  Channel n Arbitration Priority
      CHPRI        : DMA_DCHPRI_CHPRI_Field := 16#0#;
      --  unspecified
      Reserved_4_5 : HAL.UInt2 := 16#0#;
      --  Disable Preempt Ability.
      DPA          : DCHPRI_DPA_Field := NRF_SVD.DMA.Dpa_0;
      --  Enable Channel Preemption.
      ECP          : DCHPRI_ECP_Field := NRF_SVD.DMA.Ecp_0;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

   for DMA_DCHPRI_Register use record
      CHPRI        at 0 range 0 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      DPA          at 0 range 6 .. 6;
      ECP          at 0 range 7 .. 7;
   end record;

   --  Channel n Priority Register
   type DMA_DCHPRI_Registers is array (0 .. 15) of DMA_DCHPRI_Register
     with Volatile;

   subtype TCD_ATTR_DSIZE_Field is HAL.UInt3;
   subtype TCD_ATTR_DMOD_Field is HAL.UInt5;

   --  Source data transfer size
   type TCD_ATTR0_SSIZE_Field is
     (
      --  8-bit
      Ssize_0,
      --  16-bit
      Ssize_1,
      --  32-bit
      Ssize_2,
      --  16-byte burst
      Ssize_4,
      --  32-byte burst
      Ssize_5)
     with Size => 3;
   for TCD_ATTR0_SSIZE_Field use
     (Ssize_0 => 0,
      Ssize_1 => 1,
      Ssize_2 => 2,
      Ssize_4 => 4,
      Ssize_5 => 5);

   --  Source Address Modulo
   type TCD_ATTR0_SMOD_Field is
     (
      --  Source address modulo feature is disabled
      Smod_0)
     with Size => 5;
   for TCD_ATTR0_SMOD_Field use
     (Smod_0 => 0);

   --  TCD Transfer Attributes
   type TCD_ATTR_Register is record
      --  Destination data transfer size
      DSIZE : TCD_ATTR_DSIZE_Field := 16#0#;
      --  Destination Address Modulo
      DMOD  : TCD_ATTR_DMOD_Field := 16#0#;
      --  Source data transfer size
      SSIZE : TCD_ATTR0_SSIZE_Field := NRF_SVD.DMA.Ssize_0;
      --  Source Address Modulo
      SMOD  : TCD_ATTR0_SMOD_Field := NRF_SVD.DMA.Smod_0;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_ATTR_Register use record
      DSIZE at 0 range 0 .. 2;
      DMOD  at 0 range 3 .. 7;
      SSIZE at 0 range 8 .. 10;
      SMOD  at 0 range 11 .. 15;
   end record;

   subtype TCD_NBYTES_MLOFFNO_NBYTES_Field is HAL.UInt30;

   --  Destination Minor Loop Offset enable
   type TCD_NBYTES_MLOFFNO0_DMLOE_Field is
     (
      --  The minor loop offset is not applied to the DADDR
      Dmloe_0,
      --  The minor loop offset is applied to the DADDR
      Dmloe_1)
     with Size => 1;
   for TCD_NBYTES_MLOFFNO0_DMLOE_Field use
     (Dmloe_0 => 0,
      Dmloe_1 => 1);

   --  Source Minor Loop Offset Enable
   type TCD_NBYTES_MLOFFNO0_SMLOE_Field is
     (
      --  The minor loop offset is not applied to the SADDR
      Smloe_0,
      --  The minor loop offset is applied to the SADDR
      Smloe_1)
     with Size => 1;
   for TCD_NBYTES_MLOFFNO0_SMLOE_Field use
     (Smloe_0 => 0,
      Smloe_1 => 1);

   --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and Offset
   --  Disabled)
   type TCD_NBYTES_MLOFFNO_Register is record
      --  Minor Byte Transfer Count
      NBYTES : TCD_NBYTES_MLOFFNO_NBYTES_Field := 16#0#;
      --  Destination Minor Loop Offset enable
      DMLOE  : TCD_NBYTES_MLOFFNO0_DMLOE_Field := NRF_SVD.DMA.Dmloe_0;
      --  Source Minor Loop Offset Enable
      SMLOE  : TCD_NBYTES_MLOFFNO0_SMLOE_Field := NRF_SVD.DMA.Smloe_0;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCD_NBYTES_MLOFFNO_Register use record
      NBYTES at 0 range 0 .. 29;
      DMLOE  at 0 range 30 .. 30;
      SMLOE  at 0 range 31 .. 31;
   end record;

   subtype TCD_NBYTES_MLOFFYES_NBYTES_Field is HAL.UInt10;
   subtype TCD_NBYTES_MLOFFYES_MLOFF_Field is HAL.UInt20;

   --  Destination Minor Loop Offset enable
   type TCD_NBYTES_MLOFFYES0_DMLOE_Field is
     (
      --  The minor loop offset is not applied to the DADDR
      Dmloe_0,
      --  The minor loop offset is applied to the DADDR
      Dmloe_1)
     with Size => 1;
   for TCD_NBYTES_MLOFFYES0_DMLOE_Field use
     (Dmloe_0 => 0,
      Dmloe_1 => 1);

   --  Source Minor Loop Offset Enable
   type TCD_NBYTES_MLOFFYES0_SMLOE_Field is
     (
      --  The minor loop offset is not applied to the SADDR
      Smloe_0,
      --  The minor loop offset is applied to the SADDR
      Smloe_1)
     with Size => 1;
   for TCD_NBYTES_MLOFFYES0_SMLOE_Field use
     (Smloe_0 => 0,
      Smloe_1 => 1);

   --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset Enabled)
   type TCD_NBYTES_MLOFFYES_Register is record
      --  Minor Byte Transfer Count
      NBYTES : TCD_NBYTES_MLOFFYES_NBYTES_Field := 16#0#;
      --  If SMLOE or DMLOE is set, this field represents a sign-extended
      --  offset applied to the source or destination address to form the
      --  next-state value after the minor loop completes.
      MLOFF  : TCD_NBYTES_MLOFFYES_MLOFF_Field := 16#0#;
      --  Destination Minor Loop Offset enable
      DMLOE  : TCD_NBYTES_MLOFFYES0_DMLOE_Field := NRF_SVD.DMA.Dmloe_0;
      --  Source Minor Loop Offset Enable
      SMLOE  : TCD_NBYTES_MLOFFYES0_SMLOE_Field := NRF_SVD.DMA.Smloe_0;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCD_NBYTES_MLOFFYES_Register use record
      NBYTES at 0 range 0 .. 9;
      MLOFF  at 0 range 10 .. 29;
      DMLOE  at 0 range 30 .. 30;
      SMLOE  at 0 range 31 .. 31;
   end record;

   subtype TCD_CITER_ELINKYES_CITER_Field is HAL.UInt9;
   subtype TCD_CITER_ELINKYES_LINKCH_Field is HAL.UInt4;

   --  Enable channel-to-channel linking on minor-loop complete
   type TCD_CITER_ELINKYES0_ELINK_Field is
     (
      --  The channel-to-channel linking is disabled
      Elink_0,
      --  The channel-to-channel linking is enabled
      Elink_1)
     with Size => 1;
   for TCD_CITER_ELINKYES0_ELINK_Field use
     (Elink_0 => 0,
      Elink_1 => 1);

   --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking Enabled)
   type TCD_CITER_ELINKYES_Register is record
      --  Current Major Iteration Count
      CITER          : TCD_CITER_ELINKYES_CITER_Field := 16#0#;
      --  Minor Loop Link Channel Number
      LINKCH         : TCD_CITER_ELINKYES_LINKCH_Field := 16#0#;
      --  unspecified
      Reserved_13_14 : HAL.UInt2 := 16#0#;
      --  Enable channel-to-channel linking on minor-loop complete
      ELINK          : TCD_CITER_ELINKYES0_ELINK_Field := NRF_SVD.DMA.Elink_0;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_CITER_ELINKYES_Register use record
      CITER          at 0 range 0 .. 8;
      LINKCH         at 0 range 9 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      ELINK          at 0 range 15 .. 15;
   end record;

   subtype TCD_CITER_ELINKNO_CITER_Field is HAL.UInt15;

   --  Enable channel-to-channel linking on minor-loop complete
   type TCD_CITER_ELINKNO0_ELINK_Field is
     (
      --  The channel-to-channel linking is disabled
      Elink_0,
      --  The channel-to-channel linking is enabled
      Elink_1)
     with Size => 1;
   for TCD_CITER_ELINKNO0_ELINK_Field use
     (Elink_0 => 0,
      Elink_1 => 1);

   --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking Disabled)
   type TCD_CITER_ELINKNO_Register is record
      --  Current Major Iteration Count
      CITER : TCD_CITER_ELINKNO_CITER_Field := 16#0#;
      --  Enable channel-to-channel linking on minor-loop complete
      ELINK : TCD_CITER_ELINKNO0_ELINK_Field := NRF_SVD.DMA.Elink_0;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_CITER_ELINKNO_Register use record
      CITER at 0 range 0 .. 14;
      ELINK at 0 range 15 .. 15;
   end record;

   --  Channel Start
   type TCD_CSR0_START_Field is
     (
      --  The channel is not explicitly started.
      Start_0,
      --  The channel is explicitly started via a software initiated service
      --  request.
      Start_1)
     with Size => 1;
   for TCD_CSR0_START_Field use
     (Start_0 => 0,
      Start_1 => 1);

   --  Enable an interrupt when major iteration count completes.
   type TCD_CSR0_INTMAJOR_Field is
     (
      --  The end-of-major loop interrupt is disabled.
      Intmajor_0,
      --  The end-of-major loop interrupt is enabled.
      Intmajor_1)
     with Size => 1;
   for TCD_CSR0_INTMAJOR_Field use
     (Intmajor_0 => 0,
      Intmajor_1 => 1);

   --  Enable an interrupt when major counter is half complete.
   type TCD_CSR0_INTHALF_Field is
     (
      --  The half-point interrupt is disabled.
      Inthalf_0,
      --  The half-point interrupt is enabled.
      Inthalf_1)
     with Size => 1;
   for TCD_CSR0_INTHALF_Field use
     (Inthalf_0 => 0,
      Inthalf_1 => 1);

   --  Disable Request
   type TCD_CSR0_DREQ_Field is
     (
      --  The channel's ERQ bit is not affected.
      Dreq_0,
      --  The channel's ERQ bit is cleared when the major loop is complete.
      Dreq_1)
     with Size => 1;
   for TCD_CSR0_DREQ_Field use
     (Dreq_0 => 0,
      Dreq_1 => 1);

   --  Enable Scatter/Gather Processing
   type TCD_CSR0_ESG_Field is
     (
      --  The current channel's TCD is normal format.
      Esg_0,
      --  The current channel's TCD specifies a scatter gather format. The
      --  DLASTSGA field provides a memory pointer to the next TCD to be loaded
      --  into this channel after the major loop completes its execution.
      Esg_1)
     with Size => 1;
   for TCD_CSR0_ESG_Field use
     (Esg_0 => 0,
      Esg_1 => 1);

   --  Enable channel-to-channel linking on major loop complete
   type TCD_CSR0_MAJORELINK_Field is
     (
      --  The channel-to-channel linking is disabled.
      Majorelink_0,
      --  The channel-to-channel linking is enabled.
      Majorelink_1)
     with Size => 1;
   for TCD_CSR0_MAJORELINK_Field use
     (Majorelink_0 => 0,
      Majorelink_1 => 1);

   subtype TCD_CSR_MAJORLINKCH_Field is HAL.UInt4;

   --  Bandwidth Control
   type TCD_CSR0_BWC_Field is
     (
      --  No eDMA engine stalls.
      Bwc_0,
      --  eDMA engine stalls for 4 cycles after each R/W.
      Bwc_2,
      --  eDMA engine stalls for 8 cycles after each R/W.
      Bwc_3)
     with Size => 2;
   for TCD_CSR0_BWC_Field use
     (Bwc_0 => 0,
      Bwc_2 => 2,
      Bwc_3 => 3);

   --  TCD Control and Status
   type TCD_CSR_Register is record
      --  Channel Start
      START          : TCD_CSR0_START_Field := NRF_SVD.DMA.Start_0;
      --  Enable an interrupt when major iteration count completes.
      INTMAJOR       : TCD_CSR0_INTMAJOR_Field := NRF_SVD.DMA.Intmajor_0;
      --  Enable an interrupt when major counter is half complete.
      INTHALF        : TCD_CSR0_INTHALF_Field := NRF_SVD.DMA.Inthalf_0;
      --  Disable Request
      DREQ           : TCD_CSR0_DREQ_Field := NRF_SVD.DMA.Dreq_0;
      --  Enable Scatter/Gather Processing
      ESG            : TCD_CSR0_ESG_Field := NRF_SVD.DMA.Esg_0;
      --  Enable channel-to-channel linking on major loop complete
      MAJORELINK     : TCD_CSR0_MAJORELINK_Field := NRF_SVD.DMA.Majorelink_0;
      --  Read-only. Channel Active
      ACTIVE         : Boolean := False;
      --  Channel Done
      DONE           : Boolean := False;
      --  Major Loop Link Channel Number
      MAJORLINKCH    : TCD_CSR_MAJORLINKCH_Field := 16#0#;
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      --  Bandwidth Control
      BWC            : TCD_CSR0_BWC_Field := NRF_SVD.DMA.Bwc_0;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_CSR_Register use record
      START          at 0 range 0 .. 0;
      INTMAJOR       at 0 range 1 .. 1;
      INTHALF        at 0 range 2 .. 2;
      DREQ           at 0 range 3 .. 3;
      ESG            at 0 range 4 .. 4;
      MAJORELINK     at 0 range 5 .. 5;
      ACTIVE         at 0 range 6 .. 6;
      DONE           at 0 range 7 .. 7;
      MAJORLINKCH    at 0 range 8 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      BWC            at 0 range 14 .. 15;
   end record;

   subtype TCD_BITER_ELINKYES_BITER_Field is HAL.UInt9;
   subtype TCD_BITER_ELINKYES_LINKCH_Field is HAL.UInt4;

   --  Enables channel-to-channel linking on minor loop complete
   type TCD_BITER_ELINKYES0_ELINK_Field is
     (
      --  The channel-to-channel linking is disabled
      Elink_0,
      --  The channel-to-channel linking is enabled
      Elink_1)
     with Size => 1;
   for TCD_BITER_ELINKYES0_ELINK_Field use
     (Elink_0 => 0,
      Elink_1 => 1);

   --  TCD Beginning Minor Loop Link, Major Loop Count (Channel Linking
   --  Enabled)
   type TCD_BITER_ELINKYES_Register is record
      --  Starting major iteration count
      BITER          : TCD_BITER_ELINKYES_BITER_Field := 16#0#;
      --  Link Channel Number
      LINKCH         : TCD_BITER_ELINKYES_LINKCH_Field := 16#0#;
      --  unspecified
      Reserved_13_14 : HAL.UInt2 := 16#0#;
      --  Enables channel-to-channel linking on minor loop complete
      ELINK          : TCD_BITER_ELINKYES0_ELINK_Field := NRF_SVD.DMA.Elink_0;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_BITER_ELINKYES_Register use record
      BITER          at 0 range 0 .. 8;
      LINKCH         at 0 range 9 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      ELINK          at 0 range 15 .. 15;
   end record;

   subtype TCD_BITER_ELINKNO_BITER_Field is HAL.UInt15;

   --  Enables channel-to-channel linking on minor loop complete
   type TCD_BITER_ELINKNO0_ELINK_Field is
     (
      --  The channel-to-channel linking is disabled
      Elink_0,
      --  The channel-to-channel linking is enabled
      Elink_1)
     with Size => 1;
   for TCD_BITER_ELINKNO0_ELINK_Field use
     (Elink_0 => 0,
      Elink_1 => 1);

   --  TCD Beginning Minor Loop Link, Major Loop Count (Channel Linking
   --  Disabled)
   type TCD_BITER_ELINKNO_Register is record
      --  Starting Major Iteration Count
      BITER : TCD_BITER_ELINKNO_BITER_Field := 16#0#;
      --  Enables channel-to-channel linking on minor loop complete
      ELINK : TCD_BITER_ELINKNO0_ELINK_Field := NRF_SVD.DMA.Elink_0;
   end record
     with Volatile_Full_Access, Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCD_BITER_ELINKNO_Register use record
      BITER at 0 range 0 .. 14;
      ELINK at 0 range 15 .. 15;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type DMA_Disc is
     (
      No0,
      Offno0,
      Offyes0,
      Yes0,
      No1,
      Offno1,
      Offyes1,
      Yes1,
      No2,
      Offno2,
      Offyes2,
      Yes2,
      No3,
      Offno3,
      Offyes3,
      Yes3,
      No4,
      Offno4,
      Offyes4,
      Yes4,
      No5,
      Offno5,
      Offyes5,
      Yes5,
      No6,
      Offno6,
      Offyes6,
      Yes6,
      No7,
      Offno7,
      Offyes7,
      Yes7,
      No8,
      Offno8,
      Offyes8,
      Yes8,
      No9,
      Offno9,
      Offyes9,
      Yes9,
      No10,
      Offno10,
      Offyes10,
      Yes10,
      No11,
      Offno11,
      Offyes11,
      Yes11,
      No12,
      Offno12,
      Offyes12,
      Yes12,
      No13,
      Offno13,
      Offyes13,
      Yes13,
      No14,
      Offno14,
      Offyes14,
      Yes14,
      No15,
      Offno15,
      Offyes15,
      Yes15);

   --  Enhanced direct memory access controller
   type DMA_Peripheral
     (Discriminent : DMA_Disc := No0)
   is record
      --  Control Register
      CR                    : aliased DMA_CR_Register;
      --  Error Status Register
      ES                    : aliased DMA_ES_Register;
      --  Enable Request Register
      ERQ                   : aliased DMA_ERQ_Register;
      --  Enable Error Interrupt Register
      EEI                   : aliased DMA_EEI_Register;
      --  Clear Enable Error Interrupt Register
      CEEI                  : aliased DMA_CEEI_Register;
      --  Set Enable Error Interrupt Register
      SEEI                  : aliased DMA_SEEI_Register;
      --  Clear Enable Request Register
      CERQ                  : aliased DMA_CERQ_Register;
      --  Set Enable Request Register
      SERQ                  : aliased DMA_SERQ_Register;
      --  Clear DONE Status Bit Register
      CDNE                  : aliased DMA_CDNE_Register;
      --  Set START Bit Register
      SSRT                  : aliased DMA_SSRT_Register;
      --  Clear Error Register
      CERR                  : aliased DMA_CERR_Register;
      --  Clear Interrupt Request Register
      CINT                  : aliased DMA_CINT_Register;
      --  Interrupt Request Register
      INT                   : aliased DMA_INT_Register;
      --  Error Register
      ERR                   : aliased DMA_ERR_Register;
      --  Hardware Request Status Register
      HRS                   : aliased DMA_HRS_Register;
      --  Enable Asynchronous Request in Stop Register
      EARS                  : aliased DMA_EARS_Register;
      --  Channel n Priority Register
      DCHPRI                : aliased DMA_DCHPRI_Registers;
      --  TCD Source Address
      TCD_SADDR0            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF0             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR0             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST0            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR0            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF0             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA0         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR0              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR1            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF1             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR1             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST1            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR1            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF1             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA1         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR1              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR2            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF2             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR2             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST2            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR2            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF2             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA2         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR2              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR3            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF3             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR3             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST3            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR3            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF3             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA3         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR3              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR4            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF4             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR4             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST4            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR4            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF4             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA4         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR4              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR5            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF5             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR5             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST5            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR5            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF5             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA5         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR5              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR6            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF6             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR6             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST6            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR6            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF6             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA6         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR6              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR7            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF7             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR7             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST7            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR7            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF7             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA7         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR7              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR8            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF8             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR8             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST8            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR8            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF8             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA8         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR8              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR9            : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF9             : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR9             : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST9            : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR9            : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF9             : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA9         : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR9              : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR10           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF10            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR10            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST10           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR10           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF10            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA10        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR10             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR11           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF11            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR11            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST11           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR11           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF11            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA11        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR11             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR12           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF12            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR12            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST12           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR12           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF12            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA12        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR12             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR13           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF13            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR13            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST13           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR13           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF13            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA13        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR13             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR14           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF14            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR14            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST14           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR14           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF14            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA14        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR14             : aliased TCD_CSR_Register;
      --  TCD Source Address
      TCD_SADDR15           : aliased HAL.UInt32;
      --  TCD Signed Source Address Offset
      TCD_SOFF15            : aliased HAL.UInt16;
      --  TCD Transfer Attributes
      TCD_ATTR15            : aliased TCD_ATTR_Register;
      --  TCD Last Source Address Adjustment
      TCD_SLAST15           : aliased HAL.UInt32;
      --  TCD Destination Address
      TCD_DADDR15           : aliased HAL.UInt32;
      --  TCD Signed Destination Address Offset
      TCD_DOFF15            : aliased HAL.UInt16;
      --  TCD Last Destination Address Adjustment/Scatter Gather Address
      TCD_DLASTSGA15        : aliased HAL.UInt32;
      --  TCD Control and Status
      TCD_CSR15             : aliased TCD_CSR_Register;
      case Discriminent is
         when No0 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO0 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO0 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO0 : aliased TCD_BITER_ELINKNO_Register;
         when Offno0 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO0 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes0 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES0 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes0 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES0 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES0 : aliased TCD_BITER_ELINKYES_Register;
         when No1 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO1 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO1 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO1 : aliased TCD_BITER_ELINKNO_Register;
         when Offno1 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO1 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes1 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES1 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes1 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES1 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES1 : aliased TCD_BITER_ELINKYES_Register;
         when No2 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO2 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO2 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO2 : aliased TCD_BITER_ELINKNO_Register;
         when Offno2 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO2 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes2 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES2 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes2 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES2 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES2 : aliased TCD_BITER_ELINKYES_Register;
         when No3 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO3 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO3 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO3 : aliased TCD_BITER_ELINKNO_Register;
         when Offno3 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO3 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes3 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES3 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes3 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES3 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES3 : aliased TCD_BITER_ELINKYES_Register;
         when No4 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO4 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO4 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO4 : aliased TCD_BITER_ELINKNO_Register;
         when Offno4 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO4 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes4 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES4 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes4 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES4 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES4 : aliased TCD_BITER_ELINKYES_Register;
         when No5 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO5 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO5 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO5 : aliased TCD_BITER_ELINKNO_Register;
         when Offno5 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO5 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes5 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES5 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes5 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES5 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES5 : aliased TCD_BITER_ELINKYES_Register;
         when No6 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO6 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO6 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO6 : aliased TCD_BITER_ELINKNO_Register;
         when Offno6 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO6 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes6 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES6 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes6 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES6 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES6 : aliased TCD_BITER_ELINKYES_Register;
         when No7 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO7 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO7 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO7 : aliased TCD_BITER_ELINKNO_Register;
         when Offno7 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO7 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes7 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES7 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes7 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES7 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES7 : aliased TCD_BITER_ELINKYES_Register;
         when No8 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO8 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO8 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO8 : aliased TCD_BITER_ELINKNO_Register;
         when Offno8 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO8 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes8 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES8 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes8 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES8 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES8 : aliased TCD_BITER_ELINKYES_Register;
         when No9 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO9 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO9 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO9 : aliased TCD_BITER_ELINKNO_Register;
         when Offno9 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO9 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes9 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES9 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes9 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES9 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES9 : aliased TCD_BITER_ELINKYES_Register;
         when No10 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO10 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO10 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO10 : aliased TCD_BITER_ELINKNO_Register;
         when Offno10 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO10 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes10 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES10 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes10 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES10 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES10 : aliased TCD_BITER_ELINKYES_Register;
         when No11 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO11 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO11 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO11 : aliased TCD_BITER_ELINKNO_Register;
         when Offno11 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO11 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes11 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES11 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes11 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES11 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES11 : aliased TCD_BITER_ELINKYES_Register;
         when No12 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO12 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO12 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO12 : aliased TCD_BITER_ELINKNO_Register;
         when Offno12 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO12 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes12 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES12 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes12 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES12 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES12 : aliased TCD_BITER_ELINKYES_Register;
         when No13 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO13 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO13 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO13 : aliased TCD_BITER_ELINKNO_Register;
         when Offno13 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO13 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes13 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES13 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes13 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES13 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES13 : aliased TCD_BITER_ELINKYES_Register;
         when No14 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO14 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO14 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO14 : aliased TCD_BITER_ELINKNO_Register;
         when Offno14 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO14 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes14 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES14 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes14 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES14 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES14 : aliased TCD_BITER_ELINKYES_Register;
         when No15 =>
            --  TCD Minor Byte Count (Minor Loop Mapping Disabled)
            TCD_NBYTES_MLNO15 : aliased HAL.UInt32;
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Disabled)
            TCD_CITER_ELINKNO15 : aliased TCD_CITER_ELINKNO_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Disabled)
            TCD_BITER_ELINKNO15 : aliased TCD_BITER_ELINKNO_Register;
         when Offno15 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping Enabled and
            --  Offset Disabled)
            TCD_NBYTES_MLOFFNO15 : aliased TCD_NBYTES_MLOFFNO_Register;
         when Offyes15 =>
            --  TCD Signed Minor Loop Offset (Minor Loop Mapping and Offset
            --  Enabled)
            TCD_NBYTES_MLOFFYES15 : aliased TCD_NBYTES_MLOFFYES_Register;
         when Yes15 =>
            --  TCD Current Minor Loop Link, Major Loop Count (Channel Linking
            --  Enabled)
            TCD_CITER_ELINKYES15 : aliased TCD_CITER_ELINKYES_Register;
            --  TCD Beginning Minor Loop Link, Major Loop Count (Channel
            --  Linking Enabled)
            TCD_BITER_ELINKYES15 : aliased TCD_BITER_ELINKYES_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for DMA_Peripheral use record
      CR                    at 16#0# range 0 .. 31;
      ES                    at 16#4# range 0 .. 31;
      ERQ                   at 16#C# range 0 .. 31;
      EEI                   at 16#14# range 0 .. 31;
      CEEI                  at 16#18# range 0 .. 7;
      SEEI                  at 16#19# range 0 .. 7;
      CERQ                  at 16#1A# range 0 .. 7;
      SERQ                  at 16#1B# range 0 .. 7;
      CDNE                  at 16#1C# range 0 .. 7;
      SSRT                  at 16#1D# range 0 .. 7;
      CERR                  at 16#1E# range 0 .. 7;
      CINT                  at 16#1F# range 0 .. 7;
      INT                   at 16#24# range 0 .. 31;
      ERR                   at 16#2C# range 0 .. 31;
      HRS                   at 16#34# range 0 .. 31;
      EARS                  at 16#44# range 0 .. 31;
      DCHPRI                at 16#100# range 0 .. 127;
      TCD_SADDR0            at 16#1000# range 0 .. 31;
      TCD_SOFF0             at 16#1004# range 0 .. 15;
      TCD_ATTR0             at 16#1006# range 0 .. 15;
      TCD_SLAST0            at 16#100C# range 0 .. 31;
      TCD_DADDR0            at 16#1010# range 0 .. 31;
      TCD_DOFF0             at 16#1014# range 0 .. 15;
      TCD_DLASTSGA0         at 16#1018# range 0 .. 31;
      TCD_CSR0              at 16#101C# range 0 .. 15;
      TCD_SADDR1            at 16#1020# range 0 .. 31;
      TCD_SOFF1             at 16#1024# range 0 .. 15;
      TCD_ATTR1             at 16#1026# range 0 .. 15;
      TCD_SLAST1            at 16#102C# range 0 .. 31;
      TCD_DADDR1            at 16#1030# range 0 .. 31;
      TCD_DOFF1             at 16#1034# range 0 .. 15;
      TCD_DLASTSGA1         at 16#1038# range 0 .. 31;
      TCD_CSR1              at 16#103C# range 0 .. 15;
      TCD_SADDR2            at 16#1040# range 0 .. 31;
      TCD_SOFF2             at 16#1044# range 0 .. 15;
      TCD_ATTR2             at 16#1046# range 0 .. 15;
      TCD_SLAST2            at 16#104C# range 0 .. 31;
      TCD_DADDR2            at 16#1050# range 0 .. 31;
      TCD_DOFF2             at 16#1054# range 0 .. 15;
      TCD_DLASTSGA2         at 16#1058# range 0 .. 31;
      TCD_CSR2              at 16#105C# range 0 .. 15;
      TCD_SADDR3            at 16#1060# range 0 .. 31;
      TCD_SOFF3             at 16#1064# range 0 .. 15;
      TCD_ATTR3             at 16#1066# range 0 .. 15;
      TCD_SLAST3            at 16#106C# range 0 .. 31;
      TCD_DADDR3            at 16#1070# range 0 .. 31;
      TCD_DOFF3             at 16#1074# range 0 .. 15;
      TCD_DLASTSGA3         at 16#1078# range 0 .. 31;
      TCD_CSR3              at 16#107C# range 0 .. 15;
      TCD_SADDR4            at 16#1080# range 0 .. 31;
      TCD_SOFF4             at 16#1084# range 0 .. 15;
      TCD_ATTR4             at 16#1086# range 0 .. 15;
      TCD_SLAST4            at 16#108C# range 0 .. 31;
      TCD_DADDR4            at 16#1090# range 0 .. 31;
      TCD_DOFF4             at 16#1094# range 0 .. 15;
      TCD_DLASTSGA4         at 16#1098# range 0 .. 31;
      TCD_CSR4              at 16#109C# range 0 .. 15;
      TCD_SADDR5            at 16#10A0# range 0 .. 31;
      TCD_SOFF5             at 16#10A4# range 0 .. 15;
      TCD_ATTR5             at 16#10A6# range 0 .. 15;
      TCD_SLAST5            at 16#10AC# range 0 .. 31;
      TCD_DADDR5            at 16#10B0# range 0 .. 31;
      TCD_DOFF5             at 16#10B4# range 0 .. 15;
      TCD_DLASTSGA5         at 16#10B8# range 0 .. 31;
      TCD_CSR5              at 16#10BC# range 0 .. 15;
      TCD_SADDR6            at 16#10C0# range 0 .. 31;
      TCD_SOFF6             at 16#10C4# range 0 .. 15;
      TCD_ATTR6             at 16#10C6# range 0 .. 15;
      TCD_SLAST6            at 16#10CC# range 0 .. 31;
      TCD_DADDR6            at 16#10D0# range 0 .. 31;
      TCD_DOFF6             at 16#10D4# range 0 .. 15;
      TCD_DLASTSGA6         at 16#10D8# range 0 .. 31;
      TCD_CSR6              at 16#10DC# range 0 .. 15;
      TCD_SADDR7            at 16#10E0# range 0 .. 31;
      TCD_SOFF7             at 16#10E4# range 0 .. 15;
      TCD_ATTR7             at 16#10E6# range 0 .. 15;
      TCD_SLAST7            at 16#10EC# range 0 .. 31;
      TCD_DADDR7            at 16#10F0# range 0 .. 31;
      TCD_DOFF7             at 16#10F4# range 0 .. 15;
      TCD_DLASTSGA7         at 16#10F8# range 0 .. 31;
      TCD_CSR7              at 16#10FC# range 0 .. 15;
      TCD_SADDR8            at 16#1100# range 0 .. 31;
      TCD_SOFF8             at 16#1104# range 0 .. 15;
      TCD_ATTR8             at 16#1106# range 0 .. 15;
      TCD_SLAST8            at 16#110C# range 0 .. 31;
      TCD_DADDR8            at 16#1110# range 0 .. 31;
      TCD_DOFF8             at 16#1114# range 0 .. 15;
      TCD_DLASTSGA8         at 16#1118# range 0 .. 31;
      TCD_CSR8              at 16#111C# range 0 .. 15;
      TCD_SADDR9            at 16#1120# range 0 .. 31;
      TCD_SOFF9             at 16#1124# range 0 .. 15;
      TCD_ATTR9             at 16#1126# range 0 .. 15;
      TCD_SLAST9            at 16#112C# range 0 .. 31;
      TCD_DADDR9            at 16#1130# range 0 .. 31;
      TCD_DOFF9             at 16#1134# range 0 .. 15;
      TCD_DLASTSGA9         at 16#1138# range 0 .. 31;
      TCD_CSR9              at 16#113C# range 0 .. 15;
      TCD_SADDR10           at 16#1140# range 0 .. 31;
      TCD_SOFF10            at 16#1144# range 0 .. 15;
      TCD_ATTR10            at 16#1146# range 0 .. 15;
      TCD_SLAST10           at 16#114C# range 0 .. 31;
      TCD_DADDR10           at 16#1150# range 0 .. 31;
      TCD_DOFF10            at 16#1154# range 0 .. 15;
      TCD_DLASTSGA10        at 16#1158# range 0 .. 31;
      TCD_CSR10             at 16#115C# range 0 .. 15;
      TCD_SADDR11           at 16#1160# range 0 .. 31;
      TCD_SOFF11            at 16#1164# range 0 .. 15;
      TCD_ATTR11            at 16#1166# range 0 .. 15;
      TCD_SLAST11           at 16#116C# range 0 .. 31;
      TCD_DADDR11           at 16#1170# range 0 .. 31;
      TCD_DOFF11            at 16#1174# range 0 .. 15;
      TCD_DLASTSGA11        at 16#1178# range 0 .. 31;
      TCD_CSR11             at 16#117C# range 0 .. 15;
      TCD_SADDR12           at 16#1180# range 0 .. 31;
      TCD_SOFF12            at 16#1184# range 0 .. 15;
      TCD_ATTR12            at 16#1186# range 0 .. 15;
      TCD_SLAST12           at 16#118C# range 0 .. 31;
      TCD_DADDR12           at 16#1190# range 0 .. 31;
      TCD_DOFF12            at 16#1194# range 0 .. 15;
      TCD_DLASTSGA12        at 16#1198# range 0 .. 31;
      TCD_CSR12             at 16#119C# range 0 .. 15;
      TCD_SADDR13           at 16#11A0# range 0 .. 31;
      TCD_SOFF13            at 16#11A4# range 0 .. 15;
      TCD_ATTR13            at 16#11A6# range 0 .. 15;
      TCD_SLAST13           at 16#11AC# range 0 .. 31;
      TCD_DADDR13           at 16#11B0# range 0 .. 31;
      TCD_DOFF13            at 16#11B4# range 0 .. 15;
      TCD_DLASTSGA13        at 16#11B8# range 0 .. 31;
      TCD_CSR13             at 16#11BC# range 0 .. 15;
      TCD_SADDR14           at 16#11C0# range 0 .. 31;
      TCD_SOFF14            at 16#11C4# range 0 .. 15;
      TCD_ATTR14            at 16#11C6# range 0 .. 15;
      TCD_SLAST14           at 16#11CC# range 0 .. 31;
      TCD_DADDR14           at 16#11D0# range 0 .. 31;
      TCD_DOFF14            at 16#11D4# range 0 .. 15;
      TCD_DLASTSGA14        at 16#11D8# range 0 .. 31;
      TCD_CSR14             at 16#11DC# range 0 .. 15;
      TCD_SADDR15           at 16#11E0# range 0 .. 31;
      TCD_SOFF15            at 16#11E4# range 0 .. 15;
      TCD_ATTR15            at 16#11E6# range 0 .. 15;
      TCD_SLAST15           at 16#11EC# range 0 .. 31;
      TCD_DADDR15           at 16#11F0# range 0 .. 31;
      TCD_DOFF15            at 16#11F4# range 0 .. 15;
      TCD_DLASTSGA15        at 16#11F8# range 0 .. 31;
      TCD_CSR15             at 16#11FC# range 0 .. 15;
      TCD_NBYTES_MLNO0      at 16#1008# range 0 .. 31;
      TCD_CITER_ELINKNO0    at 16#1016# range 0 .. 15;
      TCD_BITER_ELINKNO0    at 16#101E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO0   at 16#1008# range 0 .. 31;
      TCD_NBYTES_MLOFFYES0  at 16#1008# range 0 .. 31;
      TCD_CITER_ELINKYES0   at 16#1016# range 0 .. 15;
      TCD_BITER_ELINKYES0   at 16#101E# range 0 .. 15;
      TCD_NBYTES_MLNO1      at 16#1028# range 0 .. 31;
      TCD_CITER_ELINKNO1    at 16#1036# range 0 .. 15;
      TCD_BITER_ELINKNO1    at 16#103E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO1   at 16#1028# range 0 .. 31;
      TCD_NBYTES_MLOFFYES1  at 16#1028# range 0 .. 31;
      TCD_CITER_ELINKYES1   at 16#1036# range 0 .. 15;
      TCD_BITER_ELINKYES1   at 16#103E# range 0 .. 15;
      TCD_NBYTES_MLNO2      at 16#1048# range 0 .. 31;
      TCD_CITER_ELINKNO2    at 16#1056# range 0 .. 15;
      TCD_BITER_ELINKNO2    at 16#105E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO2   at 16#1048# range 0 .. 31;
      TCD_NBYTES_MLOFFYES2  at 16#1048# range 0 .. 31;
      TCD_CITER_ELINKYES2   at 16#1056# range 0 .. 15;
      TCD_BITER_ELINKYES2   at 16#105E# range 0 .. 15;
      TCD_NBYTES_MLNO3      at 16#1068# range 0 .. 31;
      TCD_CITER_ELINKNO3    at 16#1076# range 0 .. 15;
      TCD_BITER_ELINKNO3    at 16#107E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO3   at 16#1068# range 0 .. 31;
      TCD_NBYTES_MLOFFYES3  at 16#1068# range 0 .. 31;
      TCD_CITER_ELINKYES3   at 16#1076# range 0 .. 15;
      TCD_BITER_ELINKYES3   at 16#107E# range 0 .. 15;
      TCD_NBYTES_MLNO4      at 16#1088# range 0 .. 31;
      TCD_CITER_ELINKNO4    at 16#1096# range 0 .. 15;
      TCD_BITER_ELINKNO4    at 16#109E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO4   at 16#1088# range 0 .. 31;
      TCD_NBYTES_MLOFFYES4  at 16#1088# range 0 .. 31;
      TCD_CITER_ELINKYES4   at 16#1096# range 0 .. 15;
      TCD_BITER_ELINKYES4   at 16#109E# range 0 .. 15;
      TCD_NBYTES_MLNO5      at 16#10A8# range 0 .. 31;
      TCD_CITER_ELINKNO5    at 16#10B6# range 0 .. 15;
      TCD_BITER_ELINKNO5    at 16#10BE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO5   at 16#10A8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES5  at 16#10A8# range 0 .. 31;
      TCD_CITER_ELINKYES5   at 16#10B6# range 0 .. 15;
      TCD_BITER_ELINKYES5   at 16#10BE# range 0 .. 15;
      TCD_NBYTES_MLNO6      at 16#10C8# range 0 .. 31;
      TCD_CITER_ELINKNO6    at 16#10D6# range 0 .. 15;
      TCD_BITER_ELINKNO6    at 16#10DE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO6   at 16#10C8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES6  at 16#10C8# range 0 .. 31;
      TCD_CITER_ELINKYES6   at 16#10D6# range 0 .. 15;
      TCD_BITER_ELINKYES6   at 16#10DE# range 0 .. 15;
      TCD_NBYTES_MLNO7      at 16#10E8# range 0 .. 31;
      TCD_CITER_ELINKNO7    at 16#10F6# range 0 .. 15;
      TCD_BITER_ELINKNO7    at 16#10FE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO7   at 16#10E8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES7  at 16#10E8# range 0 .. 31;
      TCD_CITER_ELINKYES7   at 16#10F6# range 0 .. 15;
      TCD_BITER_ELINKYES7   at 16#10FE# range 0 .. 15;
      TCD_NBYTES_MLNO8      at 16#1108# range 0 .. 31;
      TCD_CITER_ELINKNO8    at 16#1116# range 0 .. 15;
      TCD_BITER_ELINKNO8    at 16#111E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO8   at 16#1108# range 0 .. 31;
      TCD_NBYTES_MLOFFYES8  at 16#1108# range 0 .. 31;
      TCD_CITER_ELINKYES8   at 16#1116# range 0 .. 15;
      TCD_BITER_ELINKYES8   at 16#111E# range 0 .. 15;
      TCD_NBYTES_MLNO9      at 16#1128# range 0 .. 31;
      TCD_CITER_ELINKNO9    at 16#1136# range 0 .. 15;
      TCD_BITER_ELINKNO9    at 16#113E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO9   at 16#1128# range 0 .. 31;
      TCD_NBYTES_MLOFFYES9  at 16#1128# range 0 .. 31;
      TCD_CITER_ELINKYES9   at 16#1136# range 0 .. 15;
      TCD_BITER_ELINKYES9   at 16#113E# range 0 .. 15;
      TCD_NBYTES_MLNO10     at 16#1148# range 0 .. 31;
      TCD_CITER_ELINKNO10   at 16#1156# range 0 .. 15;
      TCD_BITER_ELINKNO10   at 16#115E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO10  at 16#1148# range 0 .. 31;
      TCD_NBYTES_MLOFFYES10 at 16#1148# range 0 .. 31;
      TCD_CITER_ELINKYES10  at 16#1156# range 0 .. 15;
      TCD_BITER_ELINKYES10  at 16#115E# range 0 .. 15;
      TCD_NBYTES_MLNO11     at 16#1168# range 0 .. 31;
      TCD_CITER_ELINKNO11   at 16#1176# range 0 .. 15;
      TCD_BITER_ELINKNO11   at 16#117E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO11  at 16#1168# range 0 .. 31;
      TCD_NBYTES_MLOFFYES11 at 16#1168# range 0 .. 31;
      TCD_CITER_ELINKYES11  at 16#1176# range 0 .. 15;
      TCD_BITER_ELINKYES11  at 16#117E# range 0 .. 15;
      TCD_NBYTES_MLNO12     at 16#1188# range 0 .. 31;
      TCD_CITER_ELINKNO12   at 16#1196# range 0 .. 15;
      TCD_BITER_ELINKNO12   at 16#119E# range 0 .. 15;
      TCD_NBYTES_MLOFFNO12  at 16#1188# range 0 .. 31;
      TCD_NBYTES_MLOFFYES12 at 16#1188# range 0 .. 31;
      TCD_CITER_ELINKYES12  at 16#1196# range 0 .. 15;
      TCD_BITER_ELINKYES12  at 16#119E# range 0 .. 15;
      TCD_NBYTES_MLNO13     at 16#11A8# range 0 .. 31;
      TCD_CITER_ELINKNO13   at 16#11B6# range 0 .. 15;
      TCD_BITER_ELINKNO13   at 16#11BE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO13  at 16#11A8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES13 at 16#11A8# range 0 .. 31;
      TCD_CITER_ELINKYES13  at 16#11B6# range 0 .. 15;
      TCD_BITER_ELINKYES13  at 16#11BE# range 0 .. 15;
      TCD_NBYTES_MLNO14     at 16#11C8# range 0 .. 31;
      TCD_CITER_ELINKNO14   at 16#11D6# range 0 .. 15;
      TCD_BITER_ELINKNO14   at 16#11DE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO14  at 16#11C8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES14 at 16#11C8# range 0 .. 31;
      TCD_CITER_ELINKYES14  at 16#11D6# range 0 .. 15;
      TCD_BITER_ELINKYES14  at 16#11DE# range 0 .. 15;
      TCD_NBYTES_MLNO15     at 16#11E8# range 0 .. 31;
      TCD_CITER_ELINKNO15   at 16#11F6# range 0 .. 15;
      TCD_BITER_ELINKNO15   at 16#11FE# range 0 .. 15;
      TCD_NBYTES_MLOFFNO15  at 16#11E8# range 0 .. 31;
      TCD_NBYTES_MLOFFYES15 at 16#11E8# range 0 .. 31;
      TCD_CITER_ELINKYES15  at 16#11F6# range 0 .. 15;
      TCD_BITER_ELINKYES15  at 16#11FE# range 0 .. 15;
   end record;

   --  Enhanced direct memory access controller
   DMA_Periph : aliased DMA_Peripheral
     with Import, Address => System'To_Address (16#40008000#);

end NRF_SVD.DMA;