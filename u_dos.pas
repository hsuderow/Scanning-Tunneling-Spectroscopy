unit u_dos;

{ 03/2007 - fs..-Konstanten und Prozeduren file_setpath, file_setpath2, file_setextention,
            file_extract, set_newdir und alle Textfile-Operationen aus Unit u_api übernommen }

interface

uses sysutils;

const appl_dtdatecheck: boolean = TRUE;
      appl_dttimecheck: boolean = TRUE;

{$IFDEF WIN32}
const fspathname  = 260;   fsdirectory = 260;
{$ELSE}
const fspathname  = 79;   fsdirectory = 67;   fsfilename  = 8;    fsextension = 4;
{$ENDIF}

{----- Dateinamenoperationen ---------------------------------------------}

procedure file_setpath(var filename:string; pathname:string; clearoldpath:boolean);
function  file_setpath2(const filename,pathname:string; clearoldpath:boolean = TRUE):string;
procedure file_setextention(var filename:string; extname:string; clearoldextent:boolean);
function  file_setextention2(const filename,extname:string; clearoldpath:boolean = TRUE):string;
procedure file_extract(const filename:string; var spath,sname,sext:string);
function  set_newdir(newdir:string; olddir:pstring):integer;
function  file_delete(const filename:string; attr:integer = faanyfile):integer;

{----- Kommandozeilen-Operationen ----------------------------------------}

function appl_paramstr(idstr:string; var s:string; id:integer = 0):integer;
function appl_exename(withpath:boolean = TRUE; newextent:string = ''):string;
function appl_exepath:string;

{----- Textfile-Operationen ----------------------------------------------}

function text_openfile(fname:string; var f:text; id:integer):boolean;
  { id = 0/1/2 --> reset/rewrite/append }
function text_closefile(var f:text):boolean;
function text_read(var f:text; var s:string):boolean;
function text_readln(var f:text; var s:string):boolean;
function text_readuntilspace(var f:text):string;
function text_write(var f:text; s:string):boolean;
function text_writeln(var f:text; s:string):boolean;

{----- Datum- und Uhrzeit-Operationen ------------------------------------}

function is_date(var s:string; id:integer; blankdate:boolean = FALSE; ignore_appl:boolean = FALSE):boolean;
  { id = 0 --> nur Test, s wird nicht verändert (alte Variante)
         1 --> nach erfolgreichem Test Konvertierung in Form tt:mm:yyyy
         2 --> nach erfolgreichem Test Konvertierung in Form tt:mm:yy   }
function is_time(s:string; blanktime:boolean = FALSE; ignore_appl:boolean = FALSE):boolean;

function datetime_check(s:string; var dt:tdatetime):integer;
function datetime_string(dt:tdatetime; id:integer):string;
function datetime_fit(dtdate,dttime:tdatetime):tdatetime;

procedure dtlong_extract(dt:longword; var h,min,sec,sec100:integer);
function dtlong_string(dt:longword; msk:string):string;

implementation

uses phstring;

{----- Dateinamenoperationen ---------------------------------------------}

procedure file_setpath(var filename:string; pathname:string; clearoldpath:boolean);
  var   k: integer;
  begin
    k:=lastdelimiter('\:',filename); if (k > 0) and not clearoldpath then exit;
    delete(filename,1,k); pathname:=trim(pathname);
    if length(pathname) > 0 then begin
      if not (pathname[length(pathname)] in ['\',':']) then pathname:=pathname + '\';
      filename:=pathname + filename; end; end;
function file_setpath2(const filename,pathname:string; clearoldpath:boolean = TRUE):string;
  var   s: string;
  begin s:=filename; file_setpath(s,pathname,clearoldpath); result:=s; end;
procedure file_setextention(var filename:string; extname:string; clearoldextent:boolean);
  var   k1,k2: integer;
  begin
    k1:=lastdelimiter('.\:',filename); if k1 > 0 then if filename[k1] <> '.' then k1:=0;
    k2:=pos('.',extname); if ((k1 > 0) and not clearoldextent) or (k2 > 1) then exit;
    if k1 > 0 then filename:=leftcopy(filename,k1-1);
    if k2 = 0 then insert('.',extname,1);
    filename:=trim(concat(filename,leftcopy(extname,4))); end;
function file_setextention2(const filename,extname:string; clearoldpath:boolean = TRUE):string;
  var   s: string;
  begin s:=filename; file_setextention(s,extname,clearoldpath); result:=s; end;
procedure file_extract(const filename:string; var spath,sname,sext:string);
  begin
    spath:=extractfilepath(filename);
    sname:=extractfilename(filename); sext:=extractfileext(filename);
    if sext > '' then delete(sname,length(sname)-length(sext)+1,length(sext)); end;
function set_newdir(newdir:string; olddir:pstring):integer;
  var   s: string;
  begin
    result:=0; newdir:=trim(newdir);
    if olddir <> nil then begin
      getdir(0,s); if s = 'X:\' then begin result:=3; exit; end;
      olddir^:=s; end;
    if newdir = '' then exit; s:=rightcopy(newdir,2);
    if length(s) = 2 then
      if (s <> ':\') and (s[2] = '\') then delete(newdir,length(newdir),1);
    {$I-} chdir(newdir); {$I+} result:=ioresult; end;
function file_delete(const filename:string; attr:integer = faanyfile):integer;
  var   f  : tsearchrec;
        k,n: integer;
        s  : string;
  begin
    n:=0; s:=extractfilepath(filename); k:=findfirst(filename,attr,f);
    while k = 0 do begin
      if deletefile(file_setpath2(f.name,s)) then inc(n); k:=findnext(f); end;
    findclose(f); result:=n; end;

(*   bisher nicht benutzt

function file_expand(dest,lw,dir,name,ext:pchar):pchar;
  var   buf,buf1: array[0..fsPathName] of Char;
  begin
    strcopy(buf1,'');
    if lw <> nil then begin
      strcopy(@buf,lw); strtrim(@buf); strleft(@buf,2);
      if strlen(@buf) > 0 then begin buf[1]:=':'; strcopy(buf1,@buf); end; end;
    if dir <> nil then begin
      strcopy(@buf,dir); strtrim(@buf); strleft(@buf,fsdirectory);
      if strlen(@buf) > 0 then begin
        if (strlen(buf1) > 0) and not (buf[0] in ['.','\']) then strcopy(strend(buf1),'\');
        strcopy(strend(buf1),@buf);
        if buf1[strlen(buf1)-1] <> '\' then strcopy(strend(buf1),'\'); end; end;
    if name <> nil then begin
      strcopy(@buf,name); strtrim(@buf); strleft(@buf,12);
      if strlen(@buf) > 0 then strcopy(strend(buf1),@buf); end;
    if strscan(buf1,'.') = nil then strcopy(strend(buf1),'.');
    if ext <> nil then begin
      strcopy(@buf,ext); strtrim(@buf);
      if buf[0] <> '.' then strlpadch(@buf,'.',strlen(@buf)+1); strleft(@buf,4);
      strcopy(strscan(buf1,'.'),@buf); end;
    strcopy(dest,@buf1); strupper(dest); file_expand:=dest; end; *)

{----- Kommandozeilen-Operationen ----------------------------------------}

function appl_paramstr(idstr:string; var s:string; id:integer = 0):integer;
  var   i : integer;
        s1: string;
  begin
    result:=0; s1:='';
    for i:=1 to paramcount do begin
      if (id = 0) or (id = 1) then
        if idstr = paramstr(i) then result:=i;
      if (id = 0) or (id = 2) then
        if strdivide(paramstr(i),'=',s1,s) > 0 then if idstr = s1 then result:=i; 
      if result > 0 then break; end;
    if result = 0 then s:=''; end;
function appl_exename(withpath:boolean = TRUE; newextent:string = ''):string;
  var   s: string;
  begin
    if withpath then s:=paramstr(0) else s:=extractfilename(paramstr(0));
    if newextent > '' then file_setextention(s,newextent,TRUE); result:=s; end;
function appl_exepath:string;
  begin result:=extractfilepath(paramstr(0)); end;

{----- Textfile-Operationen ----------------------------------------------}

function text_openfile(fname:string; var f:text; id:integer):boolean;
  begin
    {$I-} assignfile(f,fname); case id of 0: reset(f);   1: rewrite(f);   2: append(f); end;
    result:=(ioresult = 0); {$I+} end;
function text_closefile(var f:text):boolean;
  begin {$I-} closefile(f); result:=(ioresult = 0); {$I+} end;
function text_read(var f:text; var s:string):boolean;
  begin {$I-} read(f,s); result:=(ioresult = 0); {$I+} end;
function text_readln(var f:text; var s:string):boolean;
  begin {$I-} readln(f,s); result:=(ioresult = 0); {$I+} end;
function text_readuntilspace(var f:text):string;
  var   s : string;
        s1: string[1];
  begin
    s:=''; s1:='X';
    {$I-} while not eof(f) and (length(s1)=1) and (s1<>' ') do begin read(f,s1); s:=s+s1; end; {$I+}
    result:=s; end;
function text_write(var f:text; s:string):boolean;
  begin {$I-} write(f,s); result:=(ioresult = 0); {$I+} end;
function text_writeln(var f:text; s:string):boolean;
  begin {$I-} writeln(f,s); result:=(ioresult = 0); {$I+} end;

{----- Datum- und Uhrzeit-Operationen ------------------------------------}

procedure dtlong_extract(dt:longword; var h,min,sec,sec100:integer);
  begin
    h:=dt div 3600000; min:=(dt mod 3600000) div 60000;
    sec:=(dt mod 60000) div 1000; sec100:=(dt mod 1000) div 10; end;
function dtlong_string(dt:longword; msk:string):string;
  { id = 0/1 -->  hh.mm:ss / mm:ss.hh min }
  procedure repl_str(s1,s2:string);
    var   k: integer;
    begin repeat
      k:=pos(s1,msk);
      if k > 0 then begin delete(msk,k,length(s1)); insert(s2,msk,k); end;
      until k = 0; end;
  var   h,m,sec,hsec: integer;
        s1,s2       : string;
  begin
    result:=''; dtlong_extract(dt,h,m,sec,hsec);
    s1:=inttostr(h); s2:=lpadch(s1,'0',2); repl_str('%hh',s2);  repl_str('%h',s1);
    s1:=inttostr(m); s2:=lpadch(s1,'0',2); repl_str('%nn',s2);  repl_str('%n',s1);
    s1:=inttostr(sec); s2:=lpadch(s1,'0',2); repl_str('%ss',s2);  repl_str('%s',s1);
    s1:=inttostr(hsec); s2:=lpadch(s1,'0',2); repl_str('%zz',s2);  repl_str('%z',s1);
    result:=msk; end;

function is_date(var s:string; id:integer; blankdate:boolean = FALSE; ignore_appl:boolean = FALSE):boolean;
  var   day,month,year: word;
        ok,b          : boolean;
  begin
    if not appl_dtdatecheck and not ignore_appl then begin result:=TRUE; exit; end;
    day:=0; month:=0; year:=0;
    ok:=((length(s) = 8) and (str_maske(s,'##.##.##',0) = 0)) or
        ((length(s) = 10) and (str_maske(s,'##.##.####',0) = 0));
    if ok then begin
      day :=str_to_long(copy(s,1,2),0,b); month:=str_to_long(copy(s,4,2),0,b);
      year:=str_to_long(copy(s,7,4),0,b); ok:=(day in [1..31]) and (month in [1..12]); end;
    if ok then case day of
      29: ok:=(month <> 2) or
        ((year mod 4 = 0) and ((year mod 100 <> 0) or (year mod 400 = 0)));
      30: ok:=month <> 2;
      31: ok:=month in [1,3,5,7,8,10,12]; end;
    if ok
      then case id of
        1: if length(s) = 8 then begin
             year:=strtoint(rightcopy(s,2)); if year < 80 then insert('20',s,7) else insert('19',s,7); end;
        2: if length(s) = 10 then delete(s,7,2); end
      else begin
        ok:=blankdate and ((s = '  .  .  ') or (s = '  .  .    '));
        if ok then case id of 1: if length(s) = 8 then insert('  ',s,7);
                              2: if length(s) = 10 then delete(s,7,2); end; end;
    is_date:=ok; end;
function is_time(s:string; blanktime:boolean = FALSE; ignore_appl:boolean = FALSE):boolean;
  var   hour,min,sec: word;
        ok,b        : boolean;
  begin
    if not appl_dttimecheck and not ignore_appl then begin result:=TRUE; exit; end;
    hour:=0; min:=0; sec:=0; ok:=FALSE;
    case length(s) of
       7: begin result:=is_time('0'+s,blanktime); exit; end;
       8: if str_maske(s,'##:##:##',0) = 0 then begin
            hour:=str_to_long(copy(s,1,2),0,b); min:=str_to_long(copy(s,4,2),0,b);
            sec :=str_to_long(copy(s,7,2),0,b); ok:=TRUE; end;
      10: begin result:=is_time('0'+s,blanktime); exit; end;
      11: if str_maske(s,'##:##:## ?M',0) = 0 then begin   { englische Darstellung }
            hour:=str_to_long(copy(s,1,2),0,b) - 1; min:=str_to_long(copy(s,4,2),0,b);
            sec :=str_to_long(copy(s,7,2),0,b);
            ok:=(s[10] in ['A','P']); if s[10] = 'P' then inc(hour,12); end; end;
    if ok then ok:=(hour < 24) and (min < 60) and (sec < 60);
    is_time:=ok or (blanktime and (s = '  :  :  ')); end;

function datetime_check(s:string; var dt:tdatetime):integer;
  var   d,m,y,h,sec: integer;
        ok         : boolean;
        sd,st      : string;
  begin
    s:=trim(s); result:=-1; dt:=0; sd:=''; st:='';
    case length(s) of
       8: if is_time(s) then begin st:=s; result:=1; end
                        else begin sd:=s; result:=0; end;
      10: begin sd:=s; result:=0; end;
      16: if copy(s,9,3) = ' - '
            then begin
              sd:=copy(s,1,8); st:=copy(s,12,5) + ':00'; result:=6; end
            else if s[11] = ' ' then begin
              sd:=copy(s,1,10); st:=copy(s,12,5) + ':00'; result:=5; end;
      17: if s[9] = ' ' then begin
            sd:=copy(s,1,8); st:=copy(s,10,8); result:=2; end;
      19: if copy(s,9,3) = ' - '
            then begin
              sd:=copy(s,1,8); st:=copy(s,12,8); result:=4; end
            else if s[11] = ' ' then begin
              sd:=copy(s,1,10); st:=copy(s,12,8); result:=3; end; end;
    if sd > '' then
      if is_date(sd,1)
        then begin
          d:=str_to_long(copy(sd,1,2),0,ok); m:=str_to_long(copy(sd,4,2),0,ok);
          y:=str_to_long(copy(sd,7,4),0,ok); dt:=encodedate(y,m,d); end
        else result:=-1;
    if st > '' then begin
      if is_time(st)
        then begin
          h:=str_to_long(copy(st,1,2),0,ok); m:=str_to_long(copy(st,4,2),0,ok);
          sec:=str_to_long(copy(st,7,2),0,ok);
          if dt >= 0 then dt:=dt + encodetime(h,m,sec,0) else dt:=dt - encodetime(h,m,sec,0); end
        else result:=-1; end; end;
function datetime_string(dt:tdatetime; id:integer):string;
  begin
    case id of
      0:   result:=formatdatetime('dd.mm.yy',dt);
      1:   result:=formatdatetime('hh:nn:ss',dt);
      2:   result:=formatdatetime('dd.mm.yy hh:nn:ss',dt);
      3:   result:=formatdatetime('dd.mm.yyyy hh:nn:ss',dt);
      4:   result:=formatdatetime('dd.mm.yy - hh:nn:ss',dt);
      5:   result:=formatdatetime('dd.mm.yyyy hh:nn',dt);
      6:   result:=formatdatetime('dd.mm.yy - hh:nn',dt);
      else result:=''; end; end;
function datetime_fit(dtdate,dttime:tdatetime):tdatetime;
  begin
    if dtdate > 0 then result:=int(dtdate) + frac(dttime)
                  else result:=int(dtdate) - frac(dttime); end;

end.
