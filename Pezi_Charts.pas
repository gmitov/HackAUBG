unit Pezi_Charts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series,
  Vcl.StdCtrls;

type
  TFrame1 = class(TFrame)
    Chart1: TChart;
    Chart2: TChart;
    Chart3: TChart;
    Chart4: TChart;
    Series2: TPieSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Label1: TLabel;
    Label2: TLabel;
    Series1: TPieSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
