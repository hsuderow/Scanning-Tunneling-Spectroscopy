unit Mat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Tipos ;

type
  TMatForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function MatSmooth(n:integer;v:TPArrayOfDoubles;np:integer) : Boolean ;
  function MatFitLine(n:integer;x,y:TPArrayOfDoubles;var factor,offset:double) : Boolean;
  function MatDerivate(n,np:integer;datax,datay,dataout:TPArrayOfdoubles) : Boolean ;


var
  MatForm: TMatForm;

implementation

{$R *.DFM}



var
  i,j,n : integer ;

function MatSmooth(n:integer;v:TPArrayOfDoubles;np:integer) : Boolean ;
var
  vv : TPArrayOfDoubles ;
begin
  Result:=False ;
  if np<=0 then Exit ;
  if n<=0 then Exit ;
  if n>4096 then Exit ;
  if 2*np+1>n then Exit ;

  GetMem(vv,8*n) ;

  for i:=0 to n-1 do vv[i]:=v[i] ;
  for i:=np to n-np-1 do begin
    v[i]:=0.0 ;
    for j:=-np to np do v[i]:=v[i]+vv[i+j] ;
    v[i]:=v[i]/(2.0*np+1.0) ;
  end ;
  for i:=0 to np-1 do v[i]:=vv[i] ;
  for i:=n-np to n-1 do v[i]:=vv[i] ;

  //for i:=0 to n-1 do v[i]:=-v[i] ;
  FreeMem(vv) ;
  Result:=True ;
end ;

// Y:=factor*X+offset
function MatFitLine(n:integer;x,y:TPArrayOfDoubles;var factor,offset:double) : boolean ;
var
  a,b,sx,sy,st2,t,ss,sxoss : double ;
begin
  a:=0.0 ; b:=0.0 ;
  sx:=0.0 ; sy:=0.0 ;
  st2:=0.0 ;
  for i:=0 to n-1 do begin
    sx:=sx+x[i] ;
    sy:=sy+y[i] ;
  end ;
  ss:=n ;
  sxoss:=sx/ss ;
  for i:=0 to n-1 do begin
    t:=x[i]-sxoss ;
    st2:=st2+t*t ;
    b:=b+t*y[i] ;
  end ;
  b:=b/st2 ;
  a:=(sy-b*sx)/ss ;

  factor:=b ;
  offset:=a ;

  Result:=True ;

end ;

function MatDerivate(n,np:integer;datax,datay,dataout:TPArrayOfdoubles) : Boolean ;
var
  i,j,k : integer ;
  x,y : array [0..4096] of double ;
  factor,offset : double ;
begin //
  Result:=False ;
  if np<1 then Exit ;
  if n<0 then Exit ;
  if n>4096 then Exit ;
  if 2*np+1>n then Exit ;

  for i:=np to n-np-1 do begin
    for k:=-np to np do begin
      x[k+np]:=datax[i+k] ;
      y[k+np]:=datay[i+k] ;
    end ;
    matFitLine(2*np+1,@x,@y,factor,offset) ;
    dataout[i]:=factor ;
  end ;

  for i:=0 to np-1 do begin
    dataout[i]:=dataout[np] ;
  end ;
  for i:=n-np to n-1 do begin
    dataout[i]:=dataout[n-np-1] ;
  end ;

end ;


end.
