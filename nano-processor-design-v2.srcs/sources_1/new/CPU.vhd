----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2024 23:04:52
-- Design Name: 
-- Module Name: CPU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- entitiy declaration of the CPU
entity CPU is
    Port ( Clk : in STD_LOGIC;
--           Slow_Clk_check : out STD_LOGIC;
           Reset : in STD_LOGIC;
--               reg_0_out_check : out STD_LOGIC_VECTOR (3 downto 0); -- these lines commented out for further checkings
--               reg_1_out_check : out STD_LOGIC_VECTOR (3 downto 0); -- of the register values, if unncessary, can be removed
--               reg_2_out_check : out STD_LOGIC_VECTOR (3 downto 0);
--               reg_3_out_check : out STD_LOGIC_VECTOR (3 downto 0);
--               reg_4_out_check : out STD_LOGIC_VECTOR (3 downto 0);
--               reg_5_out_check : out STD_LOGIC_VECTOR (3 downto 0);
--               reg_6_out_check : out STD_LOGIC_VECTOR (3 downto 0);
--               reg_7_out_check : out STD_LOGIC_VECTOR (3 downto 0);
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           C_LED : out STD_LOGIC_VECTOR (2 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           carry : out STD_LOGIC;
           zero : out STD_LOGIC);
end CPU;

architecture Behavioral of CPU is

-- component of the register bank
component Register_Bank is
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Register_Select : in STD_LOGIC_VECTOR (2 downto 0);
               R_0_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_1_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_2_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_3_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_4_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_5_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_6_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_7_val : out STD_LOGIC_VECTOR (3 downto 0)
               );
    end component;
    
    -- component of the 8 way 4 bit multiplexer
    component Eight_way_4_bit_Mux is
        Port ( Sel : in STD_LOGIC_VECTOR (2 downto 0);
               In0 : in STD_LOGIC_VECTOR (3 downto 0);
               In1 : in STD_LOGIC_VECTOR (3 downto 0);
               In2 : in STD_LOGIC_VECTOR (3 downto 0);
               In3 : in STD_LOGIC_VECTOR (3 downto 0);
               In4 : in STD_LOGIC_VECTOR (3 downto 0);
               In5 : in STD_LOGIC_VECTOR (3 downto 0);
               In6 : in STD_LOGIC_VECTOR (3 downto 0);
               In7 : in STD_LOGIC_VECTOR (3 downto 0);
               Output : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    -- component of the add/sub unit
    component Add_Sub_Unit is
            Port ( 
                A : in STD_LOGIC_VECTOR (3 downto 0);
                B : in STD_LOGIC_VECTOR (3 downto 0);
                Sel : in STD_LOGIC;
                Sum : out STD_LOGIC_VECTOR (3 downto 0);
                C_out : out STD_LOGIC;
                Pos_or_Neg : out STD_LOGIC;
                zero : out STD_LOGIC
            );
    end component;
        
    -- component of the two way 4 bit multiplexer
    component Two_way_4_bit_Mux is
            Port ( 
                In0 : in STD_LOGIC_VECTOR (3 downto 0);
                In1 : in STD_LOGIC_VECTOR (3 downto 0);
                Sel : in STD_LOGIC;
                Output : out STD_LOGIC_VECTOR (3 downto 0));
     end component;
     
     component four_way_4_bit_mux is
         Port ( In0 : in STD_LOGIC_VECTOR (3 downto 0);
                In1 : in STD_LOGIC_VECTOR (3 downto 0);
                In2 : in STD_LOGIC_VECTOR (3 downto 0);
                In3 : in STD_LOGIC_VECTOR (3 downto 0);
                Sel : in STD_LOGIC_VECTOR (1 downto 0);
                output : out STD_LOGIC_VECTOR (3 downto 0));
     end component;
     
     -- component of the instruction decoder
     component Instruction_Decoder is
             Port ( 
                Ins_Bus : in STD_LOGIC_VECTOR (12 downto 0);
                Reg_Chk_Jmp : in STD_LOGIC_VECTOR (3 downto 0);
                Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
                Load_Sel : out STD_LOGIC_VECTOR (2 downto 0);
                Imm_Val : out STD_LOGIC_VECTOR (3 downto 0);
                Reg_Sel1 : out STD_LOGIC_VECTOR (2 downto 0);
                Reg_Sel2 : out STD_LOGIC_VECTOR (2 downto 0);
                Add_Sub_Sel : out STD_LOGIC;
                Jmp : out STD_LOGIC;
                Jmp_Add : out STD_LOGIC_VECTOR (2 downto 0);
                Comp : out STD_LOGIC);
      end component;
      
      -- component of the three bit adder for incrementing the PC
      component Three_Bit_Adder
              port (
                  A    : in  std_logic_vector(2 downto 0);
                  B    : in  std_logic_vector(2 downto 0);
                  Cin  : in  std_logic;
                  S    : out std_logic_vector(2 downto 0);
                  Cout : out std_logic
              );
          end component;
          
       -- component of the two way 3 bit multiplexer
       component Two_way_3_bit_MuX is
              Port ( In0 : in STD_LOGIC_VECTOR (2 downto 0);
                     In1 : in STD_LOGIC_VECTOR (2 downto 0);
                     Sel : in STD_LOGIC;
                     Output : out STD_LOGIC_VECTOR (2 downto 0));
          end component;
          
       -- component of the progrsm rom
       -- all the instructions are stored here
       component Program_ROM
              Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
                     data : out STD_LOGIC_VECTOR (12 downto 0));
          end component;
          
       -- component of the Program Counter
       component Program_counter
                  Port (
                      Reset : in STD_LOGIC;
                      Clk : in STD_LOGIC;
                      In_Address : in STD_LOGIC_VECTOR (2 downto 0);
                      Out_Address : out STD_LOGIC_VECTOR (2 downto 0)
                  );
        end component; 
        
        -- component of the 7 segment display
        component AU_7_seg is
            Port ( Inuput_7_seg : in STD_LOGIC_VECTOR (3 downto 0);
                   Clk : in STD_LOGIC;
                   S_LED : out STD_LOGIC_VECTOR (3 downto 0);
                   S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
                   an : out STD_LOGIC_VECTOR (3 downto 0));
        end component AU_7_seg;
        
        -- componet of the slow clock
        component Slow_Clk is
            Port ( Clk_in : in STD_LOGIC;
                   Clk_out : out STD_LOGIC);
        end component;
        
        -- component for 2 bit multiplier
        component Multiplier_2 is
            Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
                   B : in STD_LOGIC_VECTOR (1 downto 0);
                   Y : out STD_LOGIC_VECTOR (3 downto 0));
        end component;
        
        -- component for the comparator unit
        component Comparator_4bit is
            Port ( Num1 : in STD_LOGIC_VECTOR (3 downto 0);
                   Num2 : in STD_LOGIC_VECTOR (3 downto 0);
                   GreaterThan : out STD_LOGIC;
                   Equal : out STD_LOGIC;                  
                   LesserThan : out STD_LOGIC;
                   Num_out : out STD_LOGIC_VECTOR (3 downto 0));
        end component;
        
        -- component for the left bit shifter
        component L_Bit_Shift is
            Port ( Data_In : in STD_LOGIC_VECTOR (3 downto 0);
                   Data_Out : out STD_LOGIC_VECTOR (3 downto 0));
        end component;
        
        -- component for the right bit shifter
        component R_Bit_Shift is
            Port ( Data_In : in STD_LOGIC_VECTOR (3 downto 0);
                   Data_Out : out STD_LOGIC_VECTOR (3 downto 0));
        end component;
    
        --Control Signals
        Signal Reg_EN, Eight_way_mux0_Sel, Eight_way_mux1_Sel, Ins_Address_frm_Pgrm, Memory_Selector, Ins_Address_frm_Adder, PC_in : STD_LOGIC_VECTOR(2 downto 0);
        Signal Add_Sub_Sel, JumpFlag, Carry_of_PC_adder : STD_LOGIC;
        Signal LoadSel : STD_LOGIC_VECTOR (2 downto 0);  -- load selector for the 4 way 4 bit mux
    
        --Data Signals
        --RegisterBank
        Signal D, R_0_out, R_1_out, R_2_out, R_3_out, R_4_out, R_5_out, R_6_out, R_7_out : STD_LOGIC_VECTOR(3 downto 0);
    
        --Add/Sub Unit
        Signal Eight_way_mux0_out, Eight_way_mux1_out : STD_LOGIC_VECTOR(3 downto 0);
        signal R : STD_LOGIC_VECTOR(3 downto 0);  -- output of the add/sub unit
        signal N : STD_LOGIC_VECTOR(3 downto 0);  -- output of the multiplier
        signal P : STD_LOGIC_VECTOR(3 downto 0);  -- output of the comparator
        Signal NegPos: STD_LOGIC;
        Signal Slow_Clk_Sig: STD_LOGIC;
    
        --Instruction Decoder
        Signal M : STD_LOGIC_VECTOR(3 downto 0);  -- immidiate value
        Signal I : STD_LOGIC_VECTOR(12 downto 0);  -- instruction
        
        Signal comp_activ : STD_LOGIC; -- select to happen the comapare
        
        --Seven Segment Display
        Signal S_LED_Sig : STD_LOGIC_VECTOR (3 downto 0);
        Signal S_7Seg_Sig : STD_LOGIC_VECTOR (6 downto 0);
        Signal an_Sig : STD_LOGIC_VECTOR (3 downto 0);
        
        --Outputs of the Comparator
        Signal GreaterThan_sig: STD_LOGIC;
        Signal Equal_sig: STD_LOGIC;
        Signal LesserThan_sig: STD_LOGIC;
        
        --Outputs of the Bit Shifters
        Signal Left_Shift : STD_LOGIC_VECTOR(3 downto 0);
        Signal Right_Shift : STD_LOGIC_VECTOR(3 downto 0);
        
        --Connected but no use
        Signal no_use_1 : STD_LOGIC_VECTOR(3 downto 0);
        Signal no_use_2 : STD_LOGIC_VECTOR(3 downto 0);
        
begin

--Slow_Clk_Check <= Slow_Clk_Sig;

Slow_Clock_comp : Slow_Clk
    port map(Clk, Slow_Clk_Sig);
    
reg_bank : Register_Bank
    port map(D, Reset, Slow_Clk_Sig, Reg_EN, R_0_out, R_1_out, R_2_out, R_3_out, R_4_out, R_5_out, R_6_out, R_7_out);
    
mux_8_way_4bit_0 : Eight_way_4_bit_Mux
    port map(Eight_way_mux0_Sel, R_0_out, R_1_out, R_2_out, R_3_out, R_4_out, R_5_out, R_6_out, R_7_out, Eight_way_mux0_out);

mux_8_way_4bit_1 : Eight_way_4_bit_Mux
    port map(Eight_way_mux1_Sel, R_0_out, R_1_out, R_2_out, R_3_out, R_4_out, R_5_out, R_6_out, R_7_out, Eight_way_mux1_out);
    
add_sub_unit_4bit : Add_Sub_Unit
    port map(Eight_way_mux0_out, Eight_way_mux1_out, Add_Sub_Sel, R, carry, NegPos, zero);
    
--mux_2_way_4bit : Two_way_4_bit_Mux
--    port map(M, R, LoadSel, D);
    
mux_8_way_4_bit_2 : Eight_way_4_bit_Mux
    port map(LoadSel, M, R, N, P, Left_Shift , Right_Shift, no_use_1 , no_use_2, D);
    
Ins_dec : Instruction_Decoder
    port map(I, Eight_way_mux0_out, Reg_EN, LoadSel, M, Eight_way_mux0_Sel, Eight_way_mux1_Sel, Add_Sub_Sel, JumpFlag, Ins_Address_frm_Pgrm, comp_activ);
    
adder_3bit : Three_Bit_Adder
    port map(Memory_Selector, "001", '0', Ins_Address_frm_Adder, Carry_of_PC_adder);
    
mux_2_way_3bit : Two_way_3_bit_MuX
    port map(Ins_Address_frm_Adder, Ins_Address_frm_Pgrm, JumpFlag, PC_in);    
    
multiplier_unit : Multiplier_2
    port map(Eight_way_mux0_out (1 downto 0), Eight_way_mux1_out(1 downto 0), N);
    
comparator_unit : Comparator_4bit 
    port map (Eight_way_mux0_out, Eight_way_mux1_out, GreaterThan_sig, Equal_sig, LesserThan_sig, P);
    
left_bit_shifter_unit : L_Bit_Shift
    port map (Eight_way_mux0_out, Left_Shift); 
    
right_bit_shifter_unit : R_Bit_Shift
    port map (Eight_way_mux0_out, Right_Shift);  
    
PROM : Program_ROM
    port map(Memory_Selector, I);
    
PC : Program_counter
    port map(Reset, Slow_Clk_Sig, PC_in, Memory_Selector);
    
Seven_Segment : AU_7_seg 
    Port map ( R_7_out, Clk, S_LED_Sig, S_7Seg_Sig, an_Sig); 
              
    S_LED <= S_LED_Sig;
    S_7Seg <= S_7Seg_Sig;
    an <= an_Sig;
    
    C_LED(0) <= GreaterThan_sig AND comp_activ;
    C_LED(1) <= Equal_sig AND comp_activ; 
    C_LED(2) <= LesserThan_sig AND comp_activ;

--    reg_0_out_check <= R_0_out; -- these lines are connected with the signals in the entity
--    reg_1_out_check <= R_1_out; -- declaration or uncomment only if the previously mentioned signsld are
--    reg_2_out_check <= R_2_out; -- uncommented
--    reg_3_out_check <= R_3_out;
--    reg_4_out_check <= R_4_out;
--    reg_5_out_check <= R_5_out;
--    reg_6_out_check <= R_6_out;
--    reg_7_out_check <= R_7_out;

end Behavioral;
