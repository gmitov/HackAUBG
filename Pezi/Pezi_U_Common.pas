unit Pezi_U_Common;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.CheckLst, Winapi.ShellApi,
  Vcl.Buttons;

type
  TSettingsInfo = class
    Ind : Integer;
  end;

const
  IsActiveCountDown = 300000;

var
  MenuItemIndex : integer;  // Stores the index of the current menu item
  CurrentDay : Byte;
  IsUserActive : Boolean;
  WorkoutTime, EyesTime, FoodTime, WaterTime : Integer;
  WorkInd, EyesInd, FoodInd, WaterInd : Integer;
  WorkMod, EyesMod, FoodMod, WaterMod : Integer;

  text_water, text_excercise, text_eyes, text_food : String;
  ind_water, ind_excercise, ind_eyes, ind_food : Integer;

  function IsKeyPressed: Boolean;


implementation


function IsKeyPressed: Boolean;
var
  keyloop, KeyResult : Integer;
begin
  keyloop := 0;

  repeat
    KeyResult := GetAsyncKeyState(keyloop);

    if KeyResult = -32767 then
    begin
        Result := True;
        Exit;
    end;

    inc(keyloop);
  until keyloop = 255;

  Result := False;
end;


end.
