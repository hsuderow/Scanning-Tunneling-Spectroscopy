program LeeCurvas;

{%File 'Clear'}

uses
  Forms,
  MiLee in 'MiLee.pas' {ValProm},
  var_gbl in 'VienedeJG\var_gbl.pas',
  blqDataSet in 'blqDataSet.pas' {blqDataSetForm},
  blqLoader in 'blqLoader.pas' {blqLoaderForm},
  Info in 'Info.pas' {InfoForm},
  Tipos in 'Tipos.pas',
  Mat in 'Mat.pas' {MatForm},
  AuxGraph in 'AuxGraph.pas' {AuxGraph1},
  BCSFit in 'BCSFit.pas' {Form1},
  HeaderSPM in 'HeaderSPM.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'IV2IMG';
  Application.CreateForm(TValProm, ValProm);
  Application.CreateForm(TblqDataSetForm, blqDataSetForm);
  Application.CreateForm(TblqLoaderForm, blqLoaderForm);
  Application.CreateForm(TInfoForm, InfoForm);
  Application.CreateForm(TMatForm, MatForm);
  Application.CreateForm(TAuxGraph1, AuxGraph1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
