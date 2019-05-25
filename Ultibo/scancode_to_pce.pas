unit scancode_to_pce;

{$mode objfpc}{$H+}

interface

function ScancodeToPCE(scancode : integer) : integer;

implementation

uses
  GlobalConst;

const PCE_KEY_NONE=             0  ;
const PCE_KEY_ESC=              1  ;
const PCE_KEY_F1=               2  ;
const PCE_KEY_F2=               3  ;
const PCE_KEY_F3=               4  ;
const PCE_KEY_F4=               5  ;
const PCE_KEY_F5=               6  ;
const PCE_KEY_F6=               7  ;
const PCE_KEY_F7=               8  ;
const PCE_KEY_F8=               9  ;
const PCE_KEY_F9=               10 ;
const PCE_KEY_F10=              11 ;
const PCE_KEY_F11=              12 ;
const PCE_KEY_F12=              13 ;
const PCE_KEY_PRTSCN=           14 ;
const PCE_KEY_SCRLK=            15 ;
const PCE_KEY_PAUSE=            16 ;
const PCE_KEY_BACKQUOTE=        17 ;
const PCE_KEY_1=                18 ;
const PCE_KEY_2=                19 ;
const PCE_KEY_3=                20 ;
const PCE_KEY_4=                21 ;
const PCE_KEY_5=                22 ;
const PCE_KEY_6=                23 ;
const PCE_KEY_7=                24 ;
const PCE_KEY_8=                25 ;
const PCE_KEY_9=                26 ;
const PCE_KEY_0=                27 ;
const PCE_KEY_MINUS=            28 ;
const PCE_KEY_EQUAL=            29 ;
const PCE_KEY_BACKSPACE=        30 ;
const PCE_KEY_TAB=              31 ;
const PCE_KEY_Q=                32 ;
const PCE_KEY_W=                33 ;
const PCE_KEY_E=                34 ;
const PCE_KEY_R=                35 ;
const PCE_KEY_T=                36 ;
const PCE_KEY_Y=                37 ;
const PCE_KEY_U=                38 ;
const PCE_KEY_I=                39 ;
const PCE_KEY_O=                40 ;
const PCE_KEY_P=                41 ;
const PCE_KEY_LBRACKET=         42 ;
const PCE_KEY_RBRACKET=         43 ;
const PCE_KEY_RETURN=           44 ;
const PCE_KEY_CAPSLOCK=         45 ;
const PCE_KEY_A=                46 ;
const PCE_KEY_S=                47 ;
const PCE_KEY_D=                48 ;
const PCE_KEY_F=                49 ;
const PCE_KEY_G=                50 ;
const PCE_KEY_H=                51 ;
const PCE_KEY_J=                52 ;
const PCE_KEY_K=                53 ;
const PCE_KEY_L=                54 ;
const PCE_KEY_SEMICOLON=        55 ;
const PCE_KEY_QUOTE=            56 ;
const PCE_KEY_BACKSLASH=        57 ;
const PCE_KEY_LSHIFT=           58 ;
const PCE_KEY_LESS=             59 ;
const PCE_KEY_Z=                60 ;
const PCE_KEY_X=                61 ;
const PCE_KEY_C=                62 ;
const PCE_KEY_V=                63 ;
const PCE_KEY_B=                64 ;
const PCE_KEY_M=                65 ;
const PCE_KEY_N=                66 ;
const PCE_KEY_COMMA=            67 ;
const PCE_KEY_PERIOD=           68 ;
const PCE_KEY_SLASH=            69 ;
const PCE_KEY_RSHIFT=           70 ;
const PCE_KEY_LCTRL=            71 ;
const PCE_KEY_LSUPER=           72 ;
const PCE_KEY_LMETA=            73 ;
const PCE_KEY_MODE=             74 ;
const PCE_KEY_LALT=             75 ;
const PCE_KEY_SPACE=            76 ;
const PCE_KEY_RALT=             77 ;
const PCE_KEY_RMETA=            78 ;
const PCE_KEY_RSUPER=           79 ;
const PCE_KEY_MENU=             80 ;
const PCE_KEY_RCTRL=            81 ;
const PCE_KEY_NUMLOCK=          82 ;
const PCE_KEY_KP_SLASH=         83 ;
const PCE_KEY_KP_STAR=          84 ;
const PCE_KEY_KP_MINUS=         85 ;
const PCE_KEY_KP_7=             86 ;
const PCE_KEY_KP_8=             87 ;
const PCE_KEY_KP_9=             88 ;
const PCE_KEY_KP_PLUS=          89 ;
const PCE_KEY_KP_4=             90 ;
const PCE_KEY_KP_5=             91 ;
const PCE_KEY_KP_6=             92 ;
const PCE_KEY_KP_1=             93 ;
const PCE_KEY_KP_2=             94 ;
const PCE_KEY_KP_3=             95 ;
const PCE_KEY_KP_ENTER=         96 ;
const PCE_KEY_KP_0=             97 ;
const PCE_KEY_KP_PERIOD=        98 ;
const PCE_KEY_INS=              99 ;
const PCE_KEY_HOME=             100;
const PCE_KEY_PAGEUP=           101;
const PCE_KEY_DEL=              102;
const PCE_KEY_END=              103;
const PCE_KEY_PAGEDN=           104;
const PCE_KEY_UP=               105;
const PCE_KEY_LEFT=             106;
const PCE_KEY_DOWN=             107;
const PCE_KEY_RIGHT=            108;
const PCE_KEY_EXTRA1=           109;
const PCE_KEY_EXTRA2=           110;
const PCE_KEY_EXTRA3=           111;
const PCE_KEY_EXTRA4=           112;
const PCE_KEY_EXTRA5=           113;
const PCE_KEY_EXTRA6=           114;
const PCE_KEY_EXTRA7=           115;
const PCE_KEY_EXTRA8=           116;
const PCE_KEY_EXTRA9=           117;
const PCE_KEY_EXTRA10=          118;
const PCE_KEY_EXTRA11=          119;
const PCE_KEY_EXTRA12=          120;
const PCE_KEY_EXTRA13=          121;
const PCE_KEY_EXTRA14=          122;
const PCE_KEY_EXTRA15=          123;
const PCE_KEY_EXTRA16=          124;

function ScancodeToPCE(scancode : integer) : integer;
begin
  Result := 0;

  case scancode of
  SCAN_CODE_ESCAPE : Result :=        PCE_KEY_ESC ;
  SCAN_CODE_F1 : Result :=            PCE_KEY_F1 ;
  SCAN_CODE_F2 : Result :=            PCE_KEY_F2 ;
  SCAN_CODE_F3 : Result :=            PCE_KEY_F3 ;
  SCAN_CODE_F4 : Result :=            PCE_KEY_F4 ;
  SCAN_CODE_F5 : Result :=            PCE_KEY_F5 ;
  SCAN_CODE_F6 : Result :=            PCE_KEY_F6 ;
  SCAN_CODE_F7 : Result :=            PCE_KEY_F7 ;
  SCAN_CODE_F8 : Result :=            PCE_KEY_F8 ;
  SCAN_CODE_F9 : Result :=            PCE_KEY_F9 ;
  SCAN_CODE_F10 : Result :=           PCE_KEY_F10 ;
  SCAN_CODE_F11 : Result :=           PCE_KEY_F11 ;
  SCAN_CODE_F12 : Result :=           PCE_KEY_F12 ;

  SCAN_CODE_PRINTSCREEN : Result :=   PCE_KEY_PRTSCN ;
  SCAN_CODE_SCROLLLOCK : Result :=    PCE_KEY_SCRLK ;
  SCAN_CODE_PAUSE : Result :=         PCE_KEY_PAUSE ;

  SCAN_CODE_GRAVE : Result :=         PCE_KEY_BACKQUOTE ;
  SCAN_CODE_1 : Result :=             PCE_KEY_1 ;
  SCAN_CODE_2 : Result :=             PCE_KEY_2 ;
  SCAN_CODE_3 : Result :=             PCE_KEY_3 ;
  SCAN_CODE_4 : Result :=             PCE_KEY_4 ;
  SCAN_CODE_5 : Result :=             PCE_KEY_5 ;
  SCAN_CODE_6 : Result :=             PCE_KEY_6 ;
  SCAN_CODE_7 : Result :=             PCE_KEY_7 ;
  SCAN_CODE_8 : Result :=             PCE_KEY_8 ;
  SCAN_CODE_9 : Result :=             PCE_KEY_9 ;
  SCAN_CODE_0 : Result :=             PCE_KEY_0 ;
  SCAN_CODE_MINUS : Result :=         PCE_KEY_MINUS ;
  SCAN_CODE_EQUALS : Result :=        PCE_KEY_EQUAL ;
  SCAN_CODE_BACKSPACE : Result :=     PCE_KEY_BACKSPACE ;

  SCAN_CODE_TAB : Result :=           PCE_KEY_TAB ;
  SCAN_CODE_Q : Result :=             PCE_KEY_Q ;
  SCAN_CODE_W : Result :=             PCE_KEY_W ;
  SCAN_CODE_E : Result :=             PCE_KEY_E ;
  SCAN_CODE_R : Result :=             PCE_KEY_R ;
  SCAN_CODE_T : Result :=             PCE_KEY_T ;
  SCAN_CODE_Y : Result :=             PCE_KEY_Y ;
  SCAN_CODE_U : Result :=             PCE_KEY_U ;
  SCAN_CODE_I : Result :=             PCE_KEY_I ;
  SCAN_CODE_O : Result :=             PCE_KEY_O ;
  SCAN_CODE_P : Result :=             PCE_KEY_P ;
  SCAN_CODE_LEFT_BRACE : Result :=   PCE_KEY_LBRACKET ;
  SCAN_CODE_RIGHT_BRACE : Result :=  PCE_KEY_RBRACKET ;
  SCAN_CODE_RETURN : Result :=        PCE_KEY_RETURN ;
  SCAN_CODE_ENTER : Result :=        PCE_KEY_RETURN ;

  SCAN_CODE_CAPSLOCK : Result :=      PCE_KEY_CAPSLOCK ;
  SCAN_CODE_A : Result :=             PCE_KEY_A ;
  SCAN_CODE_S : Result :=             PCE_KEY_S ;
  SCAN_CODE_D : Result :=             PCE_KEY_D ;
  SCAN_CODE_F : Result :=             PCE_KEY_F ;
  SCAN_CODE_G : Result :=             PCE_KEY_G ;
  SCAN_CODE_H : Result :=             PCE_KEY_H ;
  SCAN_CODE_J : Result :=             PCE_KEY_J ;
  SCAN_CODE_K : Result :=             PCE_KEY_K ;
  SCAN_CODE_L : Result :=             PCE_KEY_L ;
  SCAN_CODE_SEMICOLON : Result :=     PCE_KEY_SEMICOLON ;
  SCAN_CODE_APOSTROPHE : Result :=    PCE_KEY_QUOTE ;
  SCAN_CODE_BACKSLASH : Result :=     PCE_KEY_BACKSLASH ;

  SCAN_CODE_LEFT_SHIFT : Result :=        PCE_KEY_LSHIFT ;
  SCAN_CODE_NONUS_BACKSLASH : Result :=  PCE_KEY_BACKSLASH ;
  SCAN_CODE_Z : Result :=             PCE_KEY_Z ;
  SCAN_CODE_X : Result :=             PCE_KEY_X ;
  SCAN_CODE_C : Result :=             PCE_KEY_C ;
  SCAN_CODE_V : Result :=             PCE_KEY_V ;
  SCAN_CODE_B : Result :=             PCE_KEY_B ;
  SCAN_CODE_N : Result :=             PCE_KEY_N ;
  SCAN_CODE_M : Result :=             PCE_KEY_M ;
  SCAN_CODE_COMMA : Result :=         PCE_KEY_COMMA ;
  SCAN_CODE_PERIOD : Result :=        PCE_KEY_PERIOD ;
  SCAN_CODE_SLASH : Result :=         PCE_KEY_SLASH ;
  SCAN_CODE_RIGHT_SHIFT : Result :=        PCE_KEY_RSHIFT ;

  SCAN_CODE_LEFT_CTRL : Result :=         PCE_KEY_LCTRL ;
  SCAN_CODE_LEFT_GUI : Result :=          PCE_KEY_LSUPER ;
  SCAN_CODE_LEFT_ALT : Result :=          PCE_KEY_LALT ;
//  SCAN_CODE_MODE : Result :=          PCE_KEY_MODE ;
  SCAN_CODE_SPACE : Result :=         PCE_KEY_SPACE ;
  SCAN_CODE_RIGHT_ALT : Result :=          PCE_KEY_RALT ;
  SCAN_CODE_RIGHT_GUI : Result :=          PCE_KEY_RSUPER ;
  SCAN_CODE_MENU : Result :=          PCE_KEY_MENU ;
  SCAN_CODE_RIGHT_CTRL : Result :=         PCE_KEY_RCTRL ;

//  SCAN_CODE_NUMLOCKCLEAR : Result :=  PCE_KEY_NUMLOCK ;
  SCAN_CODE_KEYPAD_SLASH : Result :=     PCE_KEY_KP_SLASH ;
  SCAN_CODE_KEYPAD_ASTERISK : Result :=   PCE_KEY_KP_STAR ;
  SCAN_CODE_KEYPAD_MINUS : Result :=      PCE_KEY_KP_MINUS ;
  SCAN_CODE_KEYPAD_7 : Result :=          PCE_KEY_KP_7 ;
  SCAN_CODE_KEYPAD_8 : Result :=          PCE_KEY_KP_8 ;
  SCAN_CODE_KEYPAD_9 : Result :=          PCE_KEY_KP_9 ;
  SCAN_CODE_KEYPAD_PLUS : Result :=       PCE_KEY_KP_PLUS ;
  SCAN_CODE_KEYPAD_4 : Result :=          PCE_KEY_KP_4 ;
  SCAN_CODE_KEYPAD_5 : Result :=          PCE_KEY_KP_5 ;
  SCAN_CODE_KEYPAD_6 : Result :=          PCE_KEY_KP_6 ;
  SCAN_CODE_KEYPAD_1 : Result :=          PCE_KEY_KP_1 ;
  SCAN_CODE_KEYPAD_2 : Result :=          PCE_KEY_KP_2 ;
  SCAN_CODE_KEYPAD_3 : Result :=          PCE_KEY_KP_3 ;
  SCAN_CODE_KEYPAD_ENTER : Result :=      PCE_KEY_KP_ENTER ;
  SCAN_CODE_KEYPAD_0 : Result :=          PCE_KEY_KP_0 ;
  SCAN_CODE_KEYPAD_PERIOD : Result :=     PCE_KEY_KP_PERIOD ;
  SCAN_CODE_INSERT : Result :=        PCE_KEY_INS ;
  SCAN_CODE_HOME : Result :=          PCE_KEY_HOME ;
  SCAN_CODE_PAGEUP : Result :=        PCE_KEY_PAGEUP ;
  SCAN_CODE_DELETE : Result :=        PCE_KEY_DEL ;
  SCAN_CODE_END : Result :=           PCE_KEY_END ;
  SCAN_CODE_PAGEDN : Result :=      PCE_KEY_PAGEDN ;
  SCAN_CODE_UP_ARROW : Result :=            PCE_KEY_UP ;
  SCAN_CODE_LEFT_ARROW : Result :=          PCE_KEY_LEFT ;
  SCAN_CODE_DOWN_ARROW : Result :=          PCE_KEY_DOWN ;
  SCAN_CODE_RIGHT_ARROW : Result :=         PCE_KEY_RIGHT ;
  end;
end;

end.
