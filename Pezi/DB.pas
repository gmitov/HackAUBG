unit DB;

interface

uses
  Arm32;

const
  SettingsLocation = 'Pezi_Settings.db';
  LogsLocation = 'Pezi_Logs.db';
  MaxXex = 2000000;

var
  Settings, Logs : TArm;

procedure OpenSettings;
procedure OpenLogs;
procedure SettingsLogs;
procedure CloseLogs;
procedure OpenAll;
procedure CloseAll;

implementation

procedure OpenSettings;
begin
  Settings := TArm.Create(SettingsLocation, true, '');
  Settings.notPutFromQueue := true;
end;

procedure OpenLogs;
begin
  Logs := TArm.Create(LogsLocation, true, '');
  Logs.notPutFromQueue := true;
end;

procedure SettingsLogs;
begin
  Settings.Free;
end;

procedure CloseLogs;
begin
  Logs.Free;
end;

procedure OpenAll;
begin
  OpenSettings;
  OpenLogs;
end;

procedure CloseAll;
begin
  SettingsLogs;
  CloseLogs;
end;

end.
