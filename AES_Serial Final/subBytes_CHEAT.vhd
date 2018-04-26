-- Univ. of the Ryukyus LSI design contest 2004
-- SubBytes Transform Circuit for AES Cipher
-- file: SubBytes.vhd
-- combinational logic of SubBytes transform
-- Tom Wada 2003/September/15
-- http://www.ie.u-ryukyu.ac.jp/~wada/design04/subbytes.vhd

-- Modified to use std_logic_vector instead of unsigned

library IEEE;
use IEEE.STD_LOGIC_1164.all, IEEE.NUMERIC_STD.all;

entity SUBBYTES is
    port (CLK    : in  std_logic;
          RESET  : in  std_logic;
          ce  : in  std_logic;
          XIN    : in  std_logic_vector( 7 downto 0 );
          --INVE    : in  std_logic;  -- NOT SUPPORTED FOR THIS
          YOUT   : out std_logic_vector( 7 downto 0) );
end entity SUBBYTES;

architecture RTL of SUBBYTES is  

-- type definition for 256 word x 8 bit Inverse ROM 
type vectype is array (0 to 255) of std_logic_vector (7 downto 0);
-- ROM invrom 
constant invrom  : vectype := (
0 => "00000000",
1 => "00000001",
2 => "10001101",
3 => "11110110",
4 => "11001011",
5 => "01010010",
6 => "01111011",
7 => "11010001",
8 => "11101000",
9 => "01001111",
10 => "00101001",
11 => "11000000",
12 => "10110000",
13 => "11100001",
14 => "11100101",
15 => "11000111",
16 => "01110100",
17 => "10110100",
18 => "10101010",
19 => "01001011",
20 => "10011001",
21 => "00101011",
22 => "01100000",
23 => "01011111",
24 => "01011000",
25 => "00111111",
26 => "11111101",
27 => "11001100",
28 => "11111111",
29 => "01000000",
30 => "11101110",
31 => "10110010",
32 => "00111010",
33 => "01101110",
34 => "01011010",
35 => "11110001",
36 => "01010101",
37 => "01001101",
38 => "10101000",
39 => "11001001",
40 => "11000001",
41 => "00001010",
42 => "10011000",
43 => "00010101",
44 => "00110000",
45 => "01000100",
46 => "10100010",
47 => "11000010",
48 => "00101100",
49 => "01000101",
50 => "10010010",
51 => "01101100",
52 => "11110011",
53 => "00111001",
54 => "01100110",
55 => "01000010",
56 => "11110010",
57 => "00110101",
58 => "00100000",
59 => "01101111",
60 => "01110111",
61 => "10111011",
62 => "01011001",
63 => "00011001",
64 => "00011101",
65 => "11111110",
66 => "00110111",
67 => "01100111",
68 => "00101101",
69 => "00110001",
70 => "11110101",
71 => "01101001",
72 => "10100111",
73 => "01100100",
74 => "10101011",
75 => "00010011",
76 => "01010100",
77 => "00100101",
78 => "11101001",
79 => "00001001",
80 => "11101101",
81 => "01011100",
82 => "00000101",
83 => "11001010",
84 => "01001100",
85 => "00100100",
86 => "10000111",
87 => "10111111",
88 => "00011000",
89 => "00111110",
90 => "00100010",
91 => "11110000",
92 => "01010001",
93 => "11101100",
94 => "01100001",
95 => "00010111",
96 => "00010110",
97 => "01011110",
98 => "10101111",
99 => "11010011",
100 => "01001001",
101 => "10100110",
102 => "00110110",
103 => "01000011",
104 => "11110100",
105 => "01000111",
106 => "10010001",
107 => "11011111",
108 => "00110011",
109 => "10010011",
110 => "00100001",
111 => "00111011",
112 => "01111001",
113 => "10110111",
114 => "10010111",
115 => "10000101",
116 => "00010000",
117 => "10110101",
118 => "10111010",
119 => "00111100",
120 => "10110110",
121 => "01110000",
122 => "11010000",
123 => "00000110",
124 => "10100001",
125 => "11111010",
126 => "10000001",
127 => "10000010",
128 => "10000011",
129 => "01111110",
130 => "01111111",
131 => "10000000",
132 => "10010110",
133 => "01110011",
134 => "10111110",
135 => "01010110",
136 => "10011011",
137 => "10011110",
138 => "10010101",
139 => "11011001",
140 => "11110111",
141 => "00000010",
142 => "10111001",
143 => "10100100",
144 => "11011110",
145 => "01101010",
146 => "00110010",
147 => "01101101",
148 => "11011000",
149 => "10001010",
150 => "10000100",
151 => "01110010",
152 => "00101010",
153 => "00010100",
154 => "10011111",
155 => "10001000",
156 => "11111001",
157 => "11011100",
158 => "10001001",
159 => "10011010",
160 => "11111011",
161 => "01111100",
162 => "00101110",
163 => "11000011",
164 => "10001111",
165 => "10111000",
166 => "01100101",
167 => "01001000",
168 => "00100110",
169 => "11001000",
170 => "00010010",
171 => "01001010",
172 => "11001110",
173 => "11100111",
174 => "11010010",
175 => "01100010",
176 => "00001100",
177 => "11100000",
178 => "00011111",
179 => "11101111",
180 => "00010001",
181 => "01110101",
182 => "01111000",
183 => "01110001",
184 => "10100101",
185 => "10001110",
186 => "01110110",
187 => "00111101",
188 => "10111101",
189 => "10111100",
190 => "10000110",
191 => "01010111",
192 => "00001011",
193 => "00101000",
194 => "00101111",
195 => "10100011",
196 => "11011010",
197 => "11010100",
198 => "11100100",
199 => "00001111",
200 => "10101001",
201 => "00100111",
202 => "01010011",
203 => "00000100",
204 => "00011011",
205 => "11111100",
206 => "10101100",
207 => "11100110",
208 => "01111010",
209 => "00000111",
210 => "10101110",
211 => "01100011",
212 => "11000101",
213 => "11011011",
214 => "11100010",
215 => "11101010",
216 => "10010100",
217 => "10001011",
218 => "11000100",
219 => "11010101",
220 => "10011101",
221 => "11111000",
222 => "10010000",
223 => "01101011",
224 => "10110001",
225 => "00001101",
226 => "11010110",
227 => "11101011",
228 => "11000110",
229 => "00001110",
230 => "11001111",
231 => "10101101",
232 => "00001000",
233 => "01001110",
234 => "11010111",
235 => "11100011",
236 => "01011101",
237 => "01010000",
238 => "00011110",
239 => "10110011",
240 => "01011011",
241 => "00100011",
242 => "00111000",
243 => "00110100",
244 => "01101000",
245 => "01000110",
246 => "00000011",
247 => "10001100",
248 => "11011101",
249 => "10011100",
250 => "01111101",
251 => "10100000",
252 => "11001101",
253 => "00011010",
254 => "01000001",
255 => "00011100"
); 

-- signal defininition
signal invout  : std_logic_vector (7 downto 0) := x"00" ;  -- Inverse output
signal affine  : std_logic_vector (7 downto 0) := x"00";  -- affin transform output
signal delay  : std_logic_vector (7 downto 0) := x"00";  -- affin transform output

begin
----------------------------------
-- INVERSE OUTPUT
----------------------------------
INVERSE: process(CLK)
begin
    if rising_edge(CLK) then
        if ce = '1' then
			  if (RESET='1') then
					invout <= "00000000";
			  else
					invout <= invrom(to_integer(unsigned(XIN)));
			  end if;
		  else 
		      invout <= invout;
		  end if;
    end if;
end process INVERSE;

----------------------------------
-- AFFINE TRANSFORM
----------------------------------
AFFINE_TRAN: process(CLK)
begin
  if rising_edge(CLK) then
	  if ce = '1' then
		  affine(7) <= invout(7) xor invout(6) xor invout(5) xor invout(4) xor invout(3) xor '0';  
		  affine(6) <= invout(6) xor invout(5) xor invout(4) xor invout(3) xor invout(2) xor '1';  
		  affine(5) <= invout(5) xor invout(4) xor invout(3) xor invout(2) xor invout(1) xor '1';  
		  affine(4) <= invout(4) xor invout(3) xor invout(2) xor invout(1) xor invout(0) xor '0';  
		  affine(3) <= invout(7) xor invout(3) xor invout(2) xor invout(1) xor invout(0) xor '0';  
		  affine(2) <= invout(7) xor invout(6) xor invout(2) xor invout(1) xor invout(0) xor '0';  
		  affine(1) <= invout(7) xor invout(6) xor invout(5) xor invout(1) xor invout(0) xor '1';  
		  affine(0) <= invout(7) xor invout(6) xor invout(5) xor invout(4) xor invout(0) xor '1';
	  else
			affine <= affine ;
	  end if;
  end if;
end process AFFINE_TRAN;


delay0: process(CLK)
begin
    if rising_edge(CLK) then
        if ce = '1' then
			  if (RESET='1') then
					delay <= "00000000";
			  else
					delay <= affine;
			  end if;
		  else 
		      delay <= delay;
		  end if;
    end if;
end process delay0;
----------------------------------
-- OUTPUT GENERATION
----------------------------------
YOUT <= delay;

end architecture RTL;  