unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls
  , uObserver
  , uTickTocktimer;

type
  TFormMain = class(TForm, IVMObserver)
    pnlClock: TPanel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  strict private
    FClockTimer: IClockTimer;
  public
    procedure UpdateObserver(const Sender: TObject);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

{ TForm1 }

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FClockTimer.Detach(self);
  FClockTimer := nil;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FClockTimer := ClockTimer;
  FClockTimer.Attach(self);
end;

procedure TFormMain.UpdateObserver(const Sender: TObject);
begin
  if Sender is TClockTimer then
    pnlClock.Caption := (FClockTimer as TClockTimer).Time;
end;

initialization
  System.ReportMemoryLeaksOnShutdown := True;

end.
