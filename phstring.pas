unit phstring;

{ 10/2004 (ELV V2.0) - charset_alphanumeric (alt) in charset_alpha umbenannt
                       charset_alphanumeric neu definiert
  10/2006            - str_decimalseparator eingef¸gt, um ungewollte decimalseparator-ƒnderungen
                       (z.B. Windows-Ruhezustand) abzufangen
  07/2007            - s. Funktion strdivide }

interface

uses sysutils;

const decimals_floatreal    : integer = 8;
      decimals_floatdouble  : integer = 11;
      charset_hyphen        : set of char = [#9,' '];
      charset_upperletters  : set of char = ['A'..'Z'];
      charset_lowerletters  : set of char = ['a'..'z'];
      charset_alpha         : set of char = ['A'..'Z','a'..'z','_'];
      charset_numeric       : set of char = ['0'..'9'];
      charset_alphanumeric  : set of char = ['0'..'9','A'..'Z','a'..'z','_'];
      charset_squarebrackets: set of char = ['[',']'];
      charset_dosfilename   : set of char = ['0'..'9','A'..'Z','a'..'z','_'];
      charset_winfilename1  : set of char = ['0'..'9','A'..'Z','a'..'z','_','-'];
      charset_winfileinvalid: set of char = ['/','\',':','*','?','"','<','>','|'];
      str_decimalseparator  : char = #0;

type  p_set_of_char  = ^t_set_of_char;
      t_set_of_char  = set of char;
      char_array_255 = array[0..255] of char;
{$IFNDEF WIN32}
      tsyscharset    = set of char;
      shortstring    = string;
      pshortstring   = pstring;
{$ENDIF}

{----- String-Operationen ------------------------------------------------}

{$IFNDEF WIN32}
procedure setlength(var s:string; l:integer);
function lastdelimiter(const delimiters,s:string):integer;
{$ENDIF}
function rightcopy(s:string; l:integer):string;
function leftcopy(s:string; l:integer):string;
function rest(s:string; l:integer):string;
function rtrim(s:string):string;
function rtrimch(s:string; cs:tsyscharset):string;
function ltrim(s:string):string;
function ltrimch(s:string; cs:tsyscharset):string;
function trim(s:string):string;
function trimch(s:string; cs:tsyscharset):string;
function rpad(st:string; l:integer):string;
function rpadch(st:string; ch:char; l:integer):string;
function lpad(st:string; l:integer):string;
function lpadch(st:string; ch:char; l:integer):string;
function left_to_char(s:string; ch:char):string;
function zentr(st:string; l:integer):string;
function chrstr(ch:char; l:integer):string;
function spacestr(l:integer):string;
function upcased(ch:char):char;
function upper(st:string):string;
function upperd(st:string):string;
function lowcase(ch:char):char;
function lowcased(ch:char):char;
function lower(st:string):string;
function lowerd(st:string):string;
function repl_string(var s1:string; s2:string):boolean;
function repl_pchar(pc:pchar; s2:string):boolean;
function repl_tabulator(s:string; tabsize:integer):string;
function long_to_str(i:longint; l:integer = 0):string;
function real_to_fullstr(r:real; var dez:integer):string;
function real_to_str(r:real; l,d:integer):string;
function double_to_fullstr(d:double; var dez:integer):string;
function double_to_str(d:double; dez:integer = -1):string;
function double_to_padstr(d:double; l,dez:integer):string;
function double_to_sepstr(d:double; dez:integer; dezsep:pchar):string;
function bool_to_str(b:boolean):string;
function str_to_bool(s:string; def:boolean; var ok:boolean):boolean;
function str_to_ordinal(s:string; def,min,max:longint; var ok:boolean):longint;
function str_to_long(s:string; def:longint; var ok:boolean):longint;
function str_to_int(s:string; def:integer; var ok:boolean):integer;
function str_to_word(s:string; def:word; var ok:boolean):word;
function str_to_byte(s:string; def:byte; var ok:boolean):byte;
function str_to_real(s:string; var err:integer):real;
function adjust_decimalseparator(var s:string):boolean;
function adjust_floatstring(s:string; var ok:boolean):string;
function str_to_float(s:string; def:double; var ok:boolean):double;
function str_to_float2(s:string; def:double; var ok:boolean):double;
function str_maske(var s:string; v:string; maxlen:integer):integer;
function str_chrcheck(s:string; mask:t_set_of_char):integer;
function str_extchrcheck(var s:string; mask:t_set_of_char; id:integer):integer;
function pos_index(substr,s:string; n:integer):integer;
function pos_count(substr,s:string):integer;
function str_to_pas(source:pchar):string;

{----- PChar-Operationen -------------------------------------------------}

function strdlen(str:pchar):integer;
function strdnew(var dest:pchar; source:pchar):pchar;
function strassign(var dest:pchar; source:pchar):pchar;
function strpnew(s:string):pchar;
function strpnew2(var pc:pchar; s:string):pchar;
function strdcopy(dest,source:pchar):pchar;
function strdlcopy(dest,source:pchar; len:integer):pchar;
function strdefaultcopy(dest,source,def:pchar):pchar;
function strdcomp(str1,str2:pchar):integer;

     {----- Manipulationen am Original-String -----}

function strptoc(ps:pshortstring):pchar;
function strctop(pc:pchar):pshortstring;
function strright(pc:pchar; l:word):pchar;
function strleft(pc:pchar; l:word):pchar;
function strrest(pc:pchar; l:word):pchar;
function strltrim(pc:pchar):pchar;
function strrtrim(pc:pchar):pchar;
function strtrim(pc:pchar):pchar;
function strltrimch(pc:pchar; pcs:p_set_of_char):pchar;
function strrtrimch(pc:pchar; pcs:p_set_of_char):pchar;
function strtrimch(pc:pchar; pcs:p_set_of_char):pchar;
function strrpad(pc:pchar; l:word):pchar;
function strrpadch(pc:pchar; ch:char; l:word):pchar;
function strlpad(pc:pchar; l:word):pchar;
function strlpadch(pc:pchar; ch:char; l:word):pchar;
function strlefttochar(pc,pc1:pchar; ch:char):pchar;
function strinsert(pc,pc1:pchar; l:word):pchar;
  { f¸gt pc1 in pc an der Stelle l ein }
function strpinsert(pc:pchar; s:shortstring; l:word):pchar;
  { f¸gt s in pc an der Stelle l ein }
function strdelete(pc:pchar; p,l:word):pchar;
  { lˆscht in pc ab der Stelle p l Zeichen }
function strpdelete(pc,pc1:pchar; l:word):pchar;
  { lˆscht in pc ab der Stelle pc1 l Zeichen }
function strreplstring(pc,pcjok,pcrepl:pchar):pchar;
function strrepllong(pc,pcjok:pchar; l:longint):pchar;
function strconverttoinistring(pc:pchar):pchar;
function strconvertfroministring(pc:pchar):pchar;
function strcheckchr(pc:pchar; pcs:p_set_of_char; case_id:integer):integer;
function strcheckmask(pc:pchar; mask:string; maxlen:integer):integer;

     {----- Weitere Operationen -----}

function getsubstr(pc:pchar; i,l:word):string;
function getleftsubstr(pc:pchar; l:word):string;
function getrightsubstr(pc:pchar; l:word):string;
function repl_substr(s,subold,subnew:string; var ok:boolean):string;
function repl_allsubstr(s,subold,subnew:string):string;
function repl_substr2(pbuf:pchar; subold,subnew:string):boolean;
function getcharstr(ch:char; l:word):pchar;
function getclippedstr(pc:pchar):pchar;
function getunclippedstr(pc:pchar):pchar;
function getclippedstring(s:string):string;
function getunclippedstring(s:string):string;
function clip_string(s:string):string;
function unclip_string(s:string; var p:integer):string;
function getpartialstr(const s:string; n:integer):string;
function getpartialstrch(const s:string; hyphen:char; n:integer):string;
function strdivide(s:string; ch:char; var s1,s2:string):integer;
function strposint(pc1,pc2:pchar):integer;
function strplong(pc:pchar; l:longint; len:integer):pchar;
function streplong(pc:pchar; l:longint; len:integer):pchar;
function strpreal(pc:pchar; r:real; len,dez:integer):pchar;
function strepreal(pc:pchar; r:real; len,dez:integer):pchar;
function strpdouble(pc:pchar; d:double; len,dez:integer):pchar;
function strepdouble(pc:pchar; d:double; len,dez:integer):pchar;
function strpbool(pc:pchar; b:boolean):pchar;
function pchar_to_long(pc:pchar; default:longint; var l:longint):boolean;
function pchar_to_int(pc:pchar; default:integer; var i:integer):boolean;
function pchar_to_word(pc:pchar; default:word; var w:word):boolean;
function pchar_to_byte(pc:pchar; default:byte; var w:byte):boolean;
function pchar_to_real(pc:pchar; default:real; var r:real):boolean;
function pchar_to_double(pc:pchar; default:double; var d:double):boolean;
function pchar_to_bool(pc:pchar; default:boolean; var b:boolean):boolean;
function getbyteval(pc:pchar; default:byte; var b:byte):boolean;
function getstringdecimals(s:string):integer;
function getdecimals(pc:pchar):integer;

implementation

const clipchar: char = '''';

{----- String-Operationen-------------------------------------------------}

{$IFNDEF WIN32}
procedure setlength(var s:string; l:integer);
  begin s[0]:=chr(l); end;
function lastdelimiter(const delimiters,s:string):integer;
  var   i : integer;
        s1: string;
  begin
    i:=length(s);
    while i > 0 do begin
      s1:=copy(s,i,1); if pos(s1,delimiters) > 0 then break; dec(i); end;
    result:=i; end;
{$ENDIF}
function rightcopy(s:string; l:integer):string;
  begin
    if l>=length(s) then result:=s else result:=copy(s,succ(length(s)-l),l); end;
function leftcopy(s:string; l:integer):string;
  begin result:=copy(s,1,l); end;
function rest(s:string; l:integer):string;
  begin
    if l>length(s) then rest:='' else rest:=copy(s,l,length(s)-l+1); end;
function rtrim(s:string):string;
  var   i: integer;
  begin
    i:=length(s); while i > 0 do if s[i] in charset_hyphen then dec(i) else break;
    rtrim:=copy(s,1,i); end;
function rtrimch(s:string; cs:tsyscharset):string;
  var   i: integer;
  begin
    i:=length(s); while i > 0 do if s[i] in cs then dec(i) else break;
    rtrimch:=copy(s,1,i); end;
function ltrim(s:string):string;
  var   i: integer;
  begin
    i:=0; while i < length(s) do if s[succ(i)] in charset_hyphen then inc(i) else break;
    delete(s,1,i); ltrim:=s; end;
function ltrimch(s:string; cs:tsyscharset):string;
  var   i: integer;
  begin
    i:=0; while i < length(s) do if s[succ(i)] in cs then inc(i) else break;
    delete(s,1,i); ltrimch:=s; end;
function trim(s:string):string;
  begin trim:=ltrim(rtrim(s)); end;
function trimch(s:string; cs:tsyscharset):string;
  begin trimch:=ltrimch(rtrimch(s,cs),cs); end;
function rpad(st:string; l:integer):string;
  begin rpad:=rpadch(st,' ',l); end;
function rpadch(st:string; ch:char; l:integer):string;
  var   s: string;
  begin if l > length(st)
    then begin
      setlength(s,l); move(st[1],s[1],length(st));
      fillchar(s[succ(length(st))],l - length(st),ch); rpadch:=s; end
    else rpadch:=st; end;
function lpad(st:string; l:integer):string;
  begin lpad:=lpadch(st,' ',l); end;
function lpadch(st:string; ch:char; l:integer):string;
  var   s: string;
  begin
    if l > length(st)
      then begin
        setlength(s,l); move(st[1],s[succ(l) - length(st)],length(st));
        fillchar(s[1],l - length(st),ch); lpadch:=s; end
      else lpadch:=st; end;
function left_to_char(s:string; ch:char):string;
  var   i: integer;
  begin i:=pos(ch,s); if i = 0 then result:=s else result:=leftcopy(s,i-1); end;
function zentr(st:string; l:integer):string;
  var   i: integer;
  begin
    i:=length(st); if l > i
      then begin i:=((l-i) shr 1) + i; zentr:=rpad(lpad(st,i),l); end
      else zentr:=st; end;
function chrstr(ch:char; l:integer):string;
  var   s: string;
  begin s:=''; setlength(s,l); fillchar(s[1],l,ch); result:=s; end;
function spacestr(l:integer):string;
  begin spacestr:=chrstr(' ',l); end;
function upcased(ch:char):char;
  begin
    case ch of 'Ñ': upcased:='é';    'î': upcased:='ô';
               'Å': upcased:='ö';    else upcased:=upcase(ch); end; end;
function upper(st:string):string;
  var   i: integer;
  begin for i:=1 to length(st) do st[i]:=upcase(st[i]); upper:=st; end;
function upperd(st:string):string;
  var   i: integer;
  begin for i:=1 to length(st) do st[i]:=upcased(st[i]); upperd:=st; end;
function lowcase(ch:char):char;
  begin
    if ch in ['A'..'Z'] then lowcase:=chr(ord(ch) or $20)
                        else lowcase:=ch; end;
function lowcased(ch:char):char;
  begin
    case ch of 'é': lowcased:='Ñ';   'ô': lowcased:='î';
               'ö': lowcased:='Å';   else lowcased:=lowcase(ch); end; end;
function lower(st:string):string;
  var   i: integer;
  begin for i:=1 to length(st) do st[i]:=lowcase(st[i]); lower:=st; end;
function lowerd(st:string):string;
  var   i: integer;
  begin for i:=1 to length(st) do st[i]:=lowcased(st[i]); lowerd:=st; end;
function repl_string(var s1:string; s2:string):boolean;
  begin result:=(comparestr(s1,s2) <> 0); if result then s1:=s2; end;
function repl_pchar(pc:pchar; s2:string):boolean;
  begin result:=(comparestr(strpas(pc),s2) <> 0); if result then strpcopy(pc,s2); end;
function repl_tabulator(s:string; tabsize:integer):string;
  var   i,k,k2: integer;
  begin
    if tabsize >= 0 then repeat
      k:=pos(#9,s);
      if k > 0 then begin
        delete(s,k,1);
        if tabsize > 0 then begin
          k2:=tabsize - (k mod tabsize) + 1;
          for i:=1 to k2 do insert(' ',s,k); end; end;
      until k = 0;
    result:=s; end;
function long_to_str(i:longint; l:integer = 0):string;
  begin if l > 0 then str(i:l,result) else str(i,result); end;
function real_to_fullstr(r:real; var dez:integer):string;
  var   s : string[60];
        i : integer;
        ch: char;
  begin
    if str_decimalseparator <> #0 then decimalseparator:=str_decimalseparator;
    s:=floattostrf(r,fffixed,11,decimals_floatreal); ch:=decimalseparator;
    s:=ltrim(s); i:=length(s); while s[i] = '0' do dec(i);
    if s[i] = ch then begin dec(i); dez:=0; end else dez:=i - pos(ch,s);
    result:=copy(s,1,i); end;
function real_to_str(r:real; l,d:integer):string;
  var   s: string[60];
        k: integer;
  begin
    if str_decimalseparator <> #0 then decimalseparator:=str_decimalseparator;
    if d < 0
      then begin s:=real_to_fullstr(r,d); if l > length(s) then s:=lpad(s,l); end
      else begin
        if l > 0 then str(r:l:d,s) else begin str(r:60:d,s); s:=ltrim(s); end;
        k:=pos('.',s); if k > 0 then s[k]:=decimalseparator; end;
    real_to_str:=s; end;
function double_to_fullstr(d:double; var dez:integer):string;
  var   s : string[40];
        i : integer;
        ch: char;
  begin
    if str_decimalseparator <> #0 then decimalseparator:=str_decimalseparator;
    s:=ltrim(floattostrf(d,fffixed,14,decimals_floatdouble)); ch:=decimalseparator;
    i:=length(s); while s[i] = '0' do dec(i);
    if s[i] = ch then begin dec(i); dez:=0; end else dez:=i - pos(ch,s);
    result:=copy(s,1,i); end;
function double_to_str(d:double; dez:integer = -1):string;
  begin
    if str_decimalseparator <> #0 then decimalseparator:=str_decimalseparator;
    if dez < 0 then result:=double_to_fullstr(d,dez)
               else result:=ltrim(floattostrf(d,fffixed,14,dez)); end;
function double_to_padstr(d:double; l,dez:integer):string;
  var   s: string[60];
  begin
    if str_decimalseparator <> #0 then decimalseparator:=str_decimalseparator;
    if dez < 0 then s:=double_to_fullstr(d,dez)
               else s:=ltrim(floattostrf(d,fffixed,14,dez));
    if l > length(s) then s:=lpad(s,l); result:=s; end;
function double_to_sepstr(d:double; dez:integer; dezsep:pchar):string;
  var   ch: char;
  begin
    if str_decimalseparator <> #0 then decimalseparator:=str_decimalseparator;
    ch:=decimalseparator; if dezsep <> nil then decimalseparator:=dezsep^;
    result:=double_to_str(d,dez); decimalseparator:=ch; end;
function bool_to_str(b:boolean):string;
  begin if b then result:='1' else result:='0'; end;
function str_to_bool(s:string; def:boolean; var ok:boolean):boolean;
  begin result:=def; ok:=(s = '0') or (s = '1'); if ok then result:=(s = '1'); end;
function str_to_ordinal(s:string; def,min,max:longint; var ok:boolean):longint;
  var   is_neg: boolean;
  begin
    result:=def; s:=trim(s); is_neg:=FALSE;
    if length(s) > 0 then begin is_neg:=(s[1] = '-'); if is_neg then delete(s,1,1); end;
    ok:=(length(s) in [1..10]) and (str_chrcheck(s,charset_numeric) = 0);
    if ok and (length(s) = 10) then ok:=(s <= '2147483647');
    if ok and is_neg then insert('-',s,1);
    if ok then try result:=strtoint(s); ok:=TRUE; except ok:=FALSE; end;
    if ok and (max > min) then ok:=((result >= min) and (result <= max));
    if not ok then result:=def; end;
function str_to_long(s:string; def:longint; var ok:boolean):longint;
  begin result:=str_to_ordinal(s,def,0,0,ok); end;
function str_to_int(s:string; def:integer; var ok:boolean):integer;
  begin result:=str_to_ordinal(s,def,-32768,32767,ok); end;
function str_to_word(s:string; def:word; var ok:boolean):word;
  begin result:=str_to_ordinal(s,def,0,$FFFF,ok); end;
function str_to_byte(s:string; def:byte; var ok:boolean):byte;
  begin result:=str_to_ordinal(s,def,0,255,ok); end;
function str_to_real(s:string; var err:integer):real;
  var   r : real;
        ch: char;
        s1: string[2];
  begin
    if str_decimalseparator <> #0 then decimalseparator:=str_decimalseparator;
    ch:=decimalseparator; s:=trim(s); s1:='-' + ch; err:=0; if s = ''
      then str_to_real:=0
      else begin
        if s[length(s)] = ch then insert('0',s,length(s)+1);
        if leftcopy(s,2) = s1 then insert('0',s,2);
        if s[1] = ch then insert('0',s,1);
        val(s,r,err); if err <> 0 then r:=0; str_to_real:=r; end; end;
function adjust_decimalseparator(var s:string):boolean;
  var   k: integer;
  begin
    if str_decimalseparator <> #0 then decimalseparator:=str_decimalseparator;
    k:=pos_count('.',s) + pos_count(',',s); result:=(k < 2);
    if k = 1 then begin
      k:=lastdelimiter('.,',s); s[k]:=decimalseparator; end; end;
function adjust_floatstring(s:string; var ok:boolean):string;
  var   k,k2,d: integer;
        b     : boolean;
        ch1   : char;
  begin
    result:=s; s:=trim(s); ok:=FALSE; if s = '' then exit;
    if s[1] = '+' then begin delete(s,1,1); if s = '' then exit; end;
    if length(s) = 1 then begin
      ok:=(s[1] in charset_numeric); if not ok then exit; end;
    if str_decimalseparator <> #0 then decimalseparator:=str_decimalseparator;
    ch1:=decimalseparator; b:=(s[1] = '-'); if b then delete(s,1,1);
    k:=pos('E',s);
    if k > 0 then begin
      k2:=pos(ch1,s); d:=str_to_int(copy(s,k+1,length(s)),0,ok);
      ok:=ok and (k > k2) and (k > 1) and (d >= -18) and (d <= 18); if not ok then exit;
      s:=copy(s,1,k-1);
      if d <> 0 then begin
        if k2 = 0 then k2:=length(s) + 1 else delete(s,k2,1); k2:=k2 + d;
        while k2 < 2 do begin insert('0',s,1); inc(k2); end;
        while k2 > length(s) + 1 do s:=s + '0';
        insert(ch1,s,k2); end; end;
    ok:=(str_chrcheck(s,charset_numeric + [ch1]) = 0);
    if ok then begin k:=pos_count(ch1,s); ok:=(k<=1); end;
    if ok then begin
      if s[length(s)] = ch1 then delete(s,length(s),1);
      if s[1] = ch1 then insert('0',s,1); end;
    if ok then begin if b then insert('-',s,1); result:=s; end; end;
function str_to_float(s:string; def:double; var ok:boolean):double;
  var   i,k  : integer;
        i1,i2: {$IFDEF WIN32}int64{$ELSE}longint{$ENDIF};
  begin
    s:=adjust_floatstring(s,ok);
    if ok
      then begin
        k:=pos(decimalseparator,s); i1:=1;
        if k > 0 then begin
          delete(s,k,1); k:=length(s)+1-k;
          {$IFNDEF WIN32}
          while (k > 0) and (length(s) > 10) do begin delete(s,length(s),1); dec(k); end;
          if (k > 0) and (length(s) = 10) and (s > '2147483647')
            then begin delete(s,length(s),1); dec(k); end;
          {$ENDIF}
          for i:=1 to k do i1:=i1 * 10; end;
        {$IFDEF WIN32}i2:=strtoint64(s);{$ELSE}i2:=str_to_ordinal(s,0,0,0,ok);{$ENDIF}
        if ok then result:=i2/i1 else result:=def; end
      else result:=def; end;
function str_to_float2(s:string; def:double; var ok:boolean):double;
  begin
    ok:=adjust_decimalseparator(s);
    if ok then result:=str_to_float(s,def,ok) else result:=def; end;
function str_maske(var s:string; v:string; maxlen:integer):integer;
  { maxlen = 0 --> ‹bereinstimmung auf Maskenl‰nge }
  { maxlen < 0 --> ‹bereinstimmung auf Stringl‰nge }
  const maske1: set of char = ['0'..'9',' ','.','-','E'];
  var   i,k,l : integer;
        s1    : string;
  begin
    if maxlen = 0 then maxlen:=length(v); if maxlen < 0 then maxlen:=length(s);
    k:=0; l:=maxlen; if l > length(s) then l:=length(s); s1:=s;
    for i:=1 to l do if k = 0 then case v[i] of
      '@','!': if v[i] = '!' then s1[i]:=upcase(s1[i]);
      '?','&': if (s[i] in charset_alpha + [' '])
                 then begin if v[i] = '&' then s1[i]:=upcase(s1[i]); end
                 else k:=i;
      '#'    : if not (s[i] in charset_numeric) then k:=i;
      '$'    : if not (s[i] in charset_numeric + [' ']) then k:=i;
      '%'    : if not (s[i] in maske1) then k:=i;
      else     if s[i] <> v[i] then k:=i; end;
    if (k = 0) and (maxlen > l) then k:=l + 1;
    if k = 0 then s:=s1; str_maske:=k; end;
function str_chrcheck(s:string; mask:t_set_of_char):integer;
  var   i,k: integer;
  begin
    k:=0; for i:=1 to length(s) do if not (s[i] in mask) then begin k:=i; break; end;
    result:=k; end;
function str_extchrcheck(var s:string; mask:t_set_of_char; id:integer):integer;
  var   k: integer;
  begin
    k:=str_chrcheck(s,mask); if k = 0 then case id of 1: s:=upper(s);   2: s:=lower(s); end;
    result:=k; end;
function pos_index(substr,s:string; n:integer):integer;
  var   k,m,p: integer;
  begin
    k:=0; m:=length(s); repeat
      p:=pos(substr,s); if p > 0 then begin delete(s,1,p+length(substr)-1); inc(k); end;
      until (p = 0) or ((n > 0) and (k = n));
    if n = 0 then result:=k
             else if k = n then result:=m-length(s)-length(substr)+1 else result:=0; end;
function pos_count(substr,s:string):integer;
  begin result:=pos_index(substr,s,0); end;
function str_to_pas(source:pchar):string;
  begin if source = nil then result:='' else result:=strpas(source); end;

{----- PChar-Operationen -------------------------------------------------}

function strdlen(str:pchar):integer;
  begin if str = nil then strdlen:=0 else strdlen:=strlen(str); end;
function strdnew(var dest:pchar; source:pchar):pchar;
  begin strdispose(dest); dest:=strnew(source); strdnew:=dest; end;
function strassign(var dest:pchar; source:pchar):pchar;
  begin
    if source <> nil
      then if strlen(source) = 0 then begin strdispose(dest); dest:=nil; end
                                 else strdnew(dest,source);
    strassign:=dest; end;
function strpnew(s:string):pchar;
  { Nachbildung von sysutils.strnew f¸r Pascalstrings }
  var   l: cardinal;
        pc: pchar;
  begin
    result:=nil; l:=length(s) + 1;
    if l > 1 then begin
      getmem(pc,l); result:=strnew(strpcopy(pc,s)); freemem(pc,l); end; end;
function strpnew2(var pc:pchar; s:string):pchar;
  begin strdispose(pc); pc:=strpnew(s); result:=pc; end;
function strdcopy(dest,source:pchar):pchar;
  begin if source = nil then result:=strcopy(dest,'') else result:=strcopy(dest,source); end;
function strdlcopy(dest,source:pchar; len:integer):pchar;
  begin if source = nil then result:=strcopy(dest,'') else result:=strlcopy(dest,source,len); end;
function strdefaultcopy(dest,source,def:pchar):pchar;
  begin result:=strdcopy(dest,source); if strlen(dest) = 0 then strcopy(dest,def); end;
function strdcomp(str1,str2:pchar):integer;
  begin
    if str1 = nil
      then if str2 = nil then result:=0
                         else if strlen(str2) = 0 then result:=0 else result:=-1
      else if str2 = nil then if strlen(str1) = 0 then result:=0 else result:=1
                         else result:=strcomp(str1,str2); end;

     {----- Manipulationen am Original-String -----}

function strptoc(ps:pshortstring):pchar;
  var   l: integer;
  begin l:=length(ps^); move(ps^[1],ps^[0],l); ps^[l]:=#0; strptoc:=pchar(ps); end;
function strctop(pc:pchar):pshortstring;
  var   l: integer;
  begin
    l:=0; while (pc[l] <> #0) and (l < 255) do inc(l);
    move(pc[0],pc[1],l); pc[0]:=chr(l); strctop:=pshortstring(pc); end;

function strright(pc:pchar; l:word):pchar;
  var   i: word;
  begin i:=strlen(pc); if i > l then move(pc[i-l],pc[0],i-l); strright:=pc; end;
function strleft(pc:pchar; l:word):pchar;
  var   i: word;
  begin i:=strlen(pc); if i > l then pc[l]:=#0; strleft:=pc; end;
function strrest(pc:pchar; l:word):pchar;
  var   i: word;
  begin
    i:=strlen(pc); if i < l then pc[0]:=#0 else move(pc[l-1],pc[0],i-l+2); strrest:=pc; end;

function strltrim(pc:pchar):pchar;
  var   i: word;
  begin
    if pc <> nil then begin
      i:=0; while pc[i] in charset_hyphen do inc(i); move(pc[i],pc[0],strlen(pc)-i+1); end;
    result:=pc; end;
function strrtrim(pc:pchar):pchar;
  var   i : word;
        ok: boolean;
  begin
    if pc <> nil then begin
      i:=strlen(pc); ok:=(i > 0);
      while ok and (i > 0) do begin ok:=(pc[i-1] in charset_hyphen); if ok then dec(i); end;
      pc[i]:=#0; end;
    result:=pc; end;
function strtrim(pc:pchar):pchar;
  begin result:=(strltrim(strrtrim(pc))); end;

function strltrimch(pc:pchar; pcs:p_set_of_char):pchar;
  var   i: word;
  begin
    i:=0; while pc[i] in pcs^ do inc(i);
    move(pc[i],pc[0],strlen(pc)-i+1); strltrimch:=pc; end;
function strrtrimch(pc:pchar; pcs:p_set_of_char):pchar;
  var   i : word;
        ok: boolean;
  begin
    i:=strlen(pc); ok:=(i > 0);
    while ok and (i > 0) do begin ok:=(pc[i-1] in pcs^); if ok then dec(i); end;
    pc[i]:=#0; strrtrimch:=pc; end;
function strtrimch(pc:pchar; pcs:p_set_of_char):pchar;
  begin strtrimch:=(strltrimch(strrtrimch(pc,pcs),pcs)); end;

function strrpad(pc:pchar; l:word):pchar;
  begin strrpad:=strrpadch(pc,' ',l); end;
function strrpadch(pc:pchar; ch:char; l:word):pchar;
  var   i: word;
  begin
    i:=strlen(pc); if l > i then begin fillchar(pc[i],l-i,ch); pc[l]:=#0; end;
    strrpadch:=pc; end;
function strlpad(pc:pchar; l:word):pchar;
  begin strlpad:=strlpadch(pc,' ',l); end;
function strlpadch(pc:pchar; ch:char; l:word):pchar;
  var   i: word;
  begin
    i:=strlen(pc); if l > i then begin move(pc[0],pc[l-i],i+1); fillchar(pc[0],l-i,ch); end;
    strlpadch:=pc; end;
function strlefttochar(pc,pc1:pchar; ch:char):pchar;
  var   pc2: pchar;
  begin
    pc2:=strscan(pc1,ch); if pc2 = nil then strcopy(pc,pc1) else strlcopy(pc,pc1,pc2-pc1);
    strlefttochar:=pc; end;

function strinsert(pc,pc1:pchar; l:word):pchar;
  var   i: word;
  begin
    i:=strlen(pc); if l > 0 then dec(l); if l > i then l:=i;
    move(pc[l],pc[l+strlen(pc1)],i-l+1); move(pc1[0],pc[l],strlen(pc1)); strinsert:=pc; end;
function strpinsert(pc:pchar; s:shortstring; l:word):pchar;
  begin strpinsert:=strinsert(pc,strptoc(@s),l); end;
function strdelete(pc:pchar; p,l:word):pchar;
  var   i: word;
  begin
    i:=strlen(pc); if i < p then l:=0; if l > i-p+1 then l:=i-p+1;
    if l > 0 then move(pc[p+l-1],pc[p-1],i-p-l+2); strdelete:=pc; end;
function strpdelete(pc,pc1:pchar; l:word):pchar;
  begin
    strpdelete:=pc; if pc1 = nil then exit;
    if (pc1 < pc) or (pc1 >= strend(pc)) then exit; if l > strlen(pc1) then l:=strlen(pc1);
    if l > 0 then move(pc1[l],pc1[0],strlen(pc1)-l+1); end;
function strreplstring(pc,pcjok,pcrepl:pchar):pchar;
  var   pc1: pchar;
        k  : integer;
  begin
    pc1:=strpos(pc,pcjok);
    if pc1 <> nil then begin
      k:=pc1 - pc + 1; strdelete(pc,k,strlen(pcjok));
      if pcrepl <> nil then strinsert(pc,pcrepl,k); end;
    strreplstring:=pc; end;
function strrepllong(pc,pcjok:pchar; l:longint):pchar;
  var   buf: array[0..12] of char;
  begin strplong(@buf,l,0); strrepllong:=strreplstring(pc,pcjok,@buf); end;

function strconverttoinistring(pc:pchar):pchar;
  var   pc1: pchar;
  begin
    if pc <> nil then begin
      strinsert(pc,@clipchar,1); pc1:=strscan(pc+1,clipchar);
      while pc1 <> nil do begin
        strinsert(pc1,@clipchar,1); inc(pc1,2); pc1:=strscan(pc1,clipchar); end;
      strcat(pc,@clipchar); end;
    strconverttoinistring:=pc; end;
function strconvertfroministring(pc:pchar):pchar;
  { - lˆscht anf¸hrendes Apostroph
    - setzt abschlieﬂendes Apostroph auf #0
    - gibt bei Erfolg Zeiger auf Zeichen nach abschlieﬂenden Apostroph zur¸ck,
      ansonsten Zeiger auf pc }
  var   pc1: pchar;
  begin
    strconvertfroministring:=pc; if pc = nil then exit; if strlen(pc) < 2 then exit;
    pc1:=strscan(pc+1,clipchar); if (pc[0] <> clipchar) or (pc1 = nil) then exit;
    strdelete(pc,1,1); pc1:=pc;
    repeat
      pc1:=strscan(pc1,clipchar); if pc1[1] = clipchar then begin strdelete(pc1,1,1); inc(pc1); end
                                                       else pc1[0]:=#0;
      until pc1[0] = #0;
    strconvertfroministring:=pc1+1; end;
function strcheckchr(pc:pchar; pcs:p_set_of_char; case_id:integer):integer;
  var   s: string;
        k: integer;
  begin
    s:=strpas(pc); k:=str_extchrcheck(s,pcs^,case_id); if k = 0 then strpcopy(pc,s);
    result:=k; end;
function strcheckmask(pc:pchar; mask:string; maxlen:integer):integer;
  var   s: string;
        k: integer;
  begin
    s:=strpas(pc); k:=str_maske(s,mask,maxlen); if k = 0 then strpcopy(pc,s);
    result:=k; end;

     {----- Weitere Operationen -----}

function getsubstr(pc:pchar; i,l:word):string;    begin result:=copy(strpas(pc),i,l); end;
function getleftsubstr(pc:pchar; l:word):string;  begin result:=leftcopy(strpas(pc),l); end;
function getrightsubstr(pc:pchar; l:word):string; begin result:=rightcopy(strpas(pc),l); end;
function repl_substr(s,subold,subnew:string; var ok:boolean):string;
  var   k: integer;
  begin
    k:=pos(subold,s); ok:=(k > 0) and (subnew <> subold);
    if ok then begin
      delete(s,k,length(subold));
      if subnew > '' then insert(subnew,s,k); end;
    result:=s; end;
function repl_allsubstr(s,subold,subnew:string):string;
  var   ok: boolean;
  begin
    ok:=FALSE; repeat s:=repl_substr(s,subold,subnew,ok); until not ok;
    result:=s; end;
function repl_substr2(pbuf:pchar; subold,subnew:string):boolean;
  var   s1,s2: string;
  begin
    s1:=strpas(pbuf); s2:=repl_substr(s1,subold,subnew,result);
    if result then strpcopy(pbuf,s2); end;
function getcharstr(ch:char; l:word):pchar;
  var   pc: pchar;
  begin
    if l = 0
      then getcharstr:=nil
      else begin
        getmem(pc,l+1); fillchar(pc^,l,ch); pc[l]:=#0;
        getcharstr:=strnew(pc); freemem(pc,l+1); end; end;
function getclippedstr(pc:pchar):pchar;
  var   pc1: pchar;
        n  : integer;
  begin
    n:=strdlen(pc) + 2; if pc <> nil then pc1:=strscan(pc,clipchar) else pc1:=nil;
    while pc1 <> nil do begin pc1:=strscan(pc1,clipchar); inc(n); end;
    pc1:=getcharstr(' ',n); strdcopy(pc1,pc); strconverttoinistring(pc1);
    result:=pc1; end;
function getunclippedstr(pc:pchar):pchar;
  var   pc1,pc2: pchar;
  begin
    result:=nil; if pc = nil then exit;
    pc1:=strnew(pc); pc2:=strconvertfroministring(pc1);
    if pc2 <> pc1 then result:=strnew(pc1); strdispose(pc1); end;
function getclippedstring(s:string):string;
  var   i: integer;
  begin
    i:=1; while i <= length(s) do begin
      if s[i] = clipchar then begin insert(clipchar,s,i); inc(i) end; inc(i); end;
    result:=concat(clipchar,s,clipchar); end;
function getunclippedstring(s:string):string;
  var   i: integer;
  begin
    result:=s; if length(s) < 2 then exit;
    if (s[1] <> clipchar) or (s[length(s)] <> clipchar) then exit;
    delete(s,1,1); delete(s,length(s),1);
    i:=1; while i < length(s) do begin
      if (s[i] = clipchar) and (s[i+1] = clipchar) then delete(s,i,1); inc(i); end;
    result:=s; end;
function clip_string(s:string):string;
  begin result:=getclippedstring(s); end;
function unclip_string(s:string; var p:integer):string;
  var   i : integer;
        s1: string;
  begin
    i:=1; p:=0; result:=''; while i <= length(s) do if s[i] = ' ' then inc(i) else break;
    if i > length(s) then exit;
    if s[i] <> clipchar then exit;
    inc(i); s1:='';
    while i < length(s) do if s[i] = clipchar
      then if s[i+1] = clipchar then begin s1:=s1 + clipchar; inc(i,2); end
                                else begin result:=s1; p:=i+1; exit; end
      else begin s1:=s1 + s[i]; inc(i); end;
    if i = length(s) then if s[i] <> clipchar then s1:=s1 + s[i];
    result:=s1;
    p:=length(s) + 1;
    end;
function getpartialstr(const s:string; n:integer):string;
  begin result:=getpartialstrch(s,';',n); end;
function getpartialstrch(const s:string; hyphen:char; n:integer):string;
  var   k1,k2: integer;
  begin
    result:=''; if n < 1 then exit;
    if n = 1 then k1:=0
             else begin k1:=pos_index(hyphen,s,n-1); if k1 = 0 then exit; end;
    k2:=pos_index(hyphen,s,n); if k2 = 0 then k2:=length(s) + 1;
    result:=copy(s,k1+1,k2-k1-1); end;
function strdivide({const} s:string; ch:char; var s1,s2:string):integer;
  { const nicht erlaubt, wenn s als var s1 oder s2 zur¸ckgegeben werden soll! }
  var   k: integer;
  begin
    k:=pos(ch,s);
    if k = 0 then begin s1:=s; s2:=''; end
             else begin s1:=copy(s,1,k-1); s2:=copy(s,k+1,length(s)); end;
    result:=k; end;
function strposint(pc1,pc2:pchar):integer;
  var   s1,s2: string;
  begin s1:=strpas(pc1); s2:=strpas(pc2); strposint:=pos(s2,s1); end;

function strplong(pc:pchar; l:longint; len:integer):pchar;
  var   r: double;
  begin r:=l; strpdouble(pc,r,len,0); strplong:=pc; end;
function streplong(pc:pchar; l:longint; len:integer):pchar;
  var   r: double;
  begin r:=l; strpdouble(pc,r,len,0); streplong:=strend(pc); end;
function strpreal(pc:pchar; r:real; len,dez:integer):pchar;
  var   s: string[80];
  begin s:=real_to_str(r,len,dez); strpcopy(pc,s); strpreal:=pc; end;
function strepreal(pc:pchar; r:real; len,dez:integer):pchar;
  var   s: string[80];
  begin s:=real_to_str(r,len,dez); strpcopy(pc,s); strepreal:=strend(pc); end;
function strpdouble(pc:pchar; d:double; len,dez:integer):pchar;
  var   s: string[80];
  begin s:=double_to_padstr(d,len,dez); strpcopy(pc,s); strpdouble:=pc; end;
function strepdouble(pc:pchar; d:double; len,dez:integer):pchar;
  var   s: string[80];
  begin s:=double_to_padstr(d,len,dez); strpcopy(pc,s); strepdouble:=strend(pc); end;
function strpbool(pc:pchar; b:boolean):pchar;
  begin if b then strpcopy(pc,'1') else strpcopy(pc,'0'); strpbool:=pc; end;

function pchar_to_long(pc:pchar; default:longint; var l:longint):boolean;
  begin
    pchar_to_long:=FALSE;
    if pc = nil then l:=default else l:=str_to_long(strpas(pc),default,result); end;
function pchar_to_int(pc:pchar; default:integer; var i:integer):boolean;
  var   l: longint;
        b: boolean;
  begin
    b:=pchar_to_long(pc,default,l); if b then b:=(l >= -32768) and (l <= 32767);
    if b then i:=l else i:=default; pchar_to_int:=b; end;
function pchar_to_word(pc:pchar; default:word; var w:word):boolean;
  var   l: longint;
        b: boolean;
  begin
    b:=pchar_to_long(pc,default,l); if b then b:=(l >= 0) and (l <= $FFFF);
    if b then w:=l else w:=default; pchar_to_word:=b; end;
function pchar_to_byte(pc:pchar; default:byte; var w:byte):boolean;
  var   l: longint;
        b: boolean;
  begin
    b:=pchar_to_long(pc,default,l); if b then b:=(l >= 0) and (l <= $FF);
    if b then w:=l else w:=default; pchar_to_byte:=b; end;
function pchar_to_real(pc:pchar; default:real; var r:real):boolean;
  var   ps: pshortstring;
        i : integer;
  begin
    pchar_to_real:=FALSE; if pc = nil
      then r:=default
      else begin
        ps:=strctop(pc); r:=str_to_real(ps^,i); strptoc(ps);
        if i = 0 then pchar_to_real:=TRUE else r:=default; end; end;
function pchar_to_double(pc:pchar; default:double; var d:double):boolean;
  begin
    result:=FALSE; if pc = nil then d:=default else d:=str_to_float(strpas(pc),default,result); end;
function pchar_to_bool(pc:pchar; default:boolean; var b:boolean):boolean;
  var   i: integer;
  begin
    b:=pchar_to_int(pc,0,i); pchar_to_bool:=b; if b then b:=(i<>0) else b:=default; end;
function getbyteval(pc:pchar; default:byte; var b:byte):boolean;
  var   l: longint;
  begin getbyteval:=pchar_to_long(pc,default,l); b:=l; end;
function getstringdecimals(s:string):integer;
  var   b: boolean;
        e: integer;
  begin
    if str_decimalseparator <> #0 then decimalseparator:=str_decimalseparator;
    result:=-1; str_to_float(s,0,b);
    if b then begin e:=pos(decimalseparator,s); if e > 0 then e:=length(s) - e; result:=e; end; end;
function getdecimals(pc:pchar):integer;
  begin if pc = nil then result:=-1 else result:=getstringdecimals(strpas(pc)); end;

end.
