program Pezi;

uses
  Vcl.Forms,
  Pezi_Main in 'Pezi_Main.pas' {Form_Main},
  Vcl.Themes,
  Vcl.Styles,
  Pezi_U_Common in 'Pezi_U_Common.pas',
  DB in 'DB.pas',
  Pezi_Workout in 'Pezi_Workout.pas' {Frame_Workout: TFrame},
  Pezi_Eyes in 'Pezi_Eyes.pas' {Frame_Eyes: TFrame},
  Pezi_Food in 'Pezi_Food.pas' {Frame_Food: TFrame},
  Pezi_U_Doc in 'Pezi_U_Doc.pas',
  Pezi_Info in 'Pezi_Info.pas' {Form_Info},
  Pezi_Presets in 'Pezi_Presets.pas' {Frame_Presets: TFrame},
  Pezi_Charts in 'Pezi_Charts.pas' {Frame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TFrame_Presets, Frame_Presets);
  Application.Run;
end.
