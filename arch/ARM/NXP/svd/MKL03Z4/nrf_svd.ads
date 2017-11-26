--  Redistribution and use in source and binary forms, with or without modification,
--  are permitted provided that the following conditions are met:
--  o Redistributions of source code must retain the above copyright notice, this list
--  of conditions and the following disclaimer.
--  o Redistributions in binary form must reproduce the above copyright notice, this
--  list of conditions and the following disclaimer in the documentation and/or
--  other materials provided with the distribution.
--  o Neither the name of the copyright holder nor the names of its
--  contributors may be used to endorse or promote products derived from this
--  software without specific prior written permission.
--  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
--  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
--  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
--  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
--  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
--  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

--  This spec has been automatically generated from MKL03Z4.xml

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  MKL03Z4 NXP Microcontroller
package NRF_SVD is
   pragma Preelaborate;

   --------------------
   -- Base addresses --
   --------------------

   FTFA_FlashConfig_Base : constant System.Address :=
     System'To_Address (16#400#);
   FTFA_Base : constant System.Address :=
     System'To_Address (16#40020000#);
   TPM0_Base : constant System.Address :=
     System'To_Address (16#40038000#);
   TPM1_Base : constant System.Address :=
     System'To_Address (16#40039000#);
   ADC0_Base : constant System.Address :=
     System'To_Address (16#4003B000#);
   RTC_Base : constant System.Address :=
     System'To_Address (16#4003D000#);
   LPTMR0_Base : constant System.Address :=
     System'To_Address (16#40040000#);
   RFSYS_Base : constant System.Address :=
     System'To_Address (16#40041000#);
   SIM_Base : constant System.Address :=
     System'To_Address (16#40047000#);
   PORTA_Base : constant System.Address :=
     System'To_Address (16#40049000#);
   PORTB_Base : constant System.Address :=
     System'To_Address (16#4004A000#);
   LPUART0_Base : constant System.Address :=
     System'To_Address (16#40054000#);
   MCG_Base : constant System.Address :=
     System'To_Address (16#40064000#);
   OSC_Base : constant System.Address :=
     System'To_Address (16#40065000#);
   I2C0_Base : constant System.Address :=
     System'To_Address (16#40066000#);
   CMP0_Base : constant System.Address :=
     System'To_Address (16#40073000#);
   VREF_Base : constant System.Address :=
     System'To_Address (16#40074000#);
   SPI0_Base : constant System.Address :=
     System'To_Address (16#40076000#);
   LLWU_Base : constant System.Address :=
     System'To_Address (16#4007C000#);
   PMC_Base : constant System.Address :=
     System'To_Address (16#4007D000#);
   SMC_Base : constant System.Address :=
     System'To_Address (16#4007E000#);
   RCM_Base : constant System.Address :=
     System'To_Address (16#4007F000#);
   GPIOA_Base : constant System.Address :=
     System'To_Address (16#400FF000#);
   GPIOB_Base : constant System.Address :=
     System'To_Address (16#400FF040#);
   SystemControl_Base : constant System.Address :=
     System'To_Address (16#E000E000#);
   SysTick_Base : constant System.Address :=
     System'To_Address (16#E000E010#);
   NVIC_Base : constant System.Address :=
     System'To_Address (16#E000E100#);
   MTB_Base : constant System.Address :=
     System'To_Address (16#F0000000#);
   MTBDWT_Base : constant System.Address :=
     System'To_Address (16#F0001000#);
   ROM_Base : constant System.Address :=
     System'To_Address (16#F0002000#);
   MCM_Base : constant System.Address :=
     System'To_Address (16#F0003000#);
   FGPIOA_Base : constant System.Address :=
     System'To_Address (16#F8000000#);
   FGPIOB_Base : constant System.Address :=
     System'To_Address (16#F8000040#);

end NRF_SVD;