unit dc_api2;

interface

uses windows,messages,graphics,controls,stdctrls,comctrls,extctrls;

{----- tpanel-Funktionen -------------------------------------------------}

function pnl_setbevel(pn:tpanel; id:integer):integer;

{----- tscrollbar-Proceduren ---------------------------------------------}

procedure sbar_updatectrlposition(sb:tscrollbar; wc:twincontrol; size:word = 0);

{----- tmemo-Prozeduren --------------------------------------------------}

function  memo_readfile(me:tcustommemo; fname:string):boolean;
function  memo_writefile(me:tcustommemo; fname:string):boolean;
procedure memo_print(me:tcustommemo; ft:tfont);
procedure memo_geteditrect(me:tcustommemo; var re:trect);
procedure memo_seteditrect(me:tcustommemo; re:trect);
procedure memo_scrollto(me:tcustommemo; x,y:integer);
procedure memo_inserttext(me:tcustommemo; s:string; id:integer = 0);
  { id = 1 --> Text an Cursorposition / am Zeilenanfang einfügen }

{----- tpagecontrol-Prozeduren -------------------------------------------}

function pagecontrol_getvisiblepageindex(pg:tpagecontrol; idx:integer):integer;

implementation

uses sysutils,classes,forms,printers;

{----- tpanel ------------------------------------------------------------}

function pnl_setbevel(pn:tpanel; id:integer):integer;
  begin
    result:=ord(pn.bevelinner) + (ord(pn.bevelouter) shl 8);
    if id >= 0 then begin
      pn.bevelinner:=tbevelcut(id and $FF);
      pn.bevelouter:=tbevelcut((id shr 8) and $FF); end; end;

{----- tscrollbar-Proceduren ---------------------------------------------}

procedure sbar_updatectrlposition(sb:tscrollbar; wc:twincontrol; size:word = 0);
  var   is_sb: boolean;
        d    : double;
  begin
    if sb.kind = sbhorizontal
      then begin if size = 0 then size:=wc.parent.width; is_sb:=(wc.width > size); end
      else begin if size = 0 then size:=wc.parent.height; is_sb:=(wc.height > size); end;
    if not is_sb then sb.position:=sb.min; d:=(sb.position-sb.min)/(sb.max-sb.min);
    if sb.kind = sbhorizontal then wc.left:=- round(d * (wc.width - size))
                              else wc.top:=- round(d * (wc.height - size));
    sb.visible:=is_sb; end;

{----- tmemo-Prozeduren --------------------------------------------------}

function memo_readfile(me:tcustommemo; fname:string):boolean;
  var   buffer: array[0..$1FFF] of char;
        k     : longint;
        s     : tfilestream;
  begin
    result:=FALSE; if not fileexists(fname) then exit; s:=nil;
    try    s:=tfilestream.create(fname,fmopenread or fmshareexclusive);
    except s.free; exit; end;
    me.clear;
    while s.position < s.size do begin
      k:=s.read(buffer,sizeof(buffer)-1); buffer[k]:=#0;
      me.clearselection; me.selstart:=length(me.text); me.seltext:=strpas(buffer); end;
    s.free; me.modified:=FALSE; result:=TRUE; end;
function memo_writefile(me:tcustommemo; fname:string):boolean;
  var   s: tfilestream;
{$IFNDEF WIN32}
        i: integer;
        st: string;
{$ENDIF}
  begin
    result:=FALSE; s:=nil;
    try    s:=tfilestream.create(fname,fmcreate);
    except s.free; exit; end;
{$IFDEF WIN32}
    s.write(me.text[1],length(me.text));
{$ELSE}
    for i:=0 to me.lines.count-1 do begin
      st:=me.lines[i]; if i < me.lines.count-1 then st:=st + #13#10;
      s.write(st,length(st)); end;
{$ENDIF}
    s.free; me.modified:=FALSE; result:=TRUE; end;
procedure memo_print(me:tcustommemo; ft:tfont);
  var   f      : textfile;
        i      : integer;
        ft1,ft2: tfont;
  begin
    ft1:=tfont.create; ft1.assign(printer.canvas.font);
    if assigned(ft)
      then ft2:=ft
      else begin
        ft2:=tfont.create; with ft2 do begin name:='Courier New'; size:=12; end; end;
    printer.canvas.font.assign(ft2); if not assigned(ft) then ft2.free;
    assignprn(f); rewrite(f);
    for i:=0 to me.lines.count-1 do writeln(f,me.lines[i]); closefile(f);
    printer.canvas.font.assign(ft1); ft1.free; end;
procedure memo_geteditrect(me:tcustommemo; var re:trect);
  begin sendmessage(me.handle,em_getrect,0,longint(@re)); end;
procedure memo_seteditrect(me:tcustommemo; re:trect);
  begin sendmessage(me.handle,em_setrectnp,0,longint(@re)); end;
procedure memo_scrollto(me:tcustommemo; x,y:integer);
  begin
    me.selstart:=me.perform(EM_LINEINDEX,y,0) + x;
    me.perform(EM_SCROLLCARET,0,0); end;
procedure memo_inserttext(me:tcustommemo; s:string; id:integer = 0);
  { id = 1 --> Text an Cursorposition / am Zeilenanfang einfügen }
  begin
    if id = 1 then me.selstart:=me.selstart - me.caretpos.x;
    me.sellength:=0; me.seltext:=s; end;

{----- tpagecontrol-Prozeduren -------------------------------------------}

function pagecontrol_getvisiblepageindex(pg:tpagecontrol; idx:integer):integer;
  var   b: boolean;
        i: integer;
  begin
    b:=(idx >= 0) and (idx <= pg.pagecount-1); if b then b:=pg.pages[idx].tabvisible;
    if not b then begin
      idx:=-1; for i:=0 to pg.pagecount-1 do
        if pg.pages[i].tabvisible then begin idx:=i; break; end; end;
    result:=idx; end;

end.