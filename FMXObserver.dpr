program FMXObserver;

uses
  System.StartUpCopy,
  FMX.Forms,
  uObserver in 'common\uObserver.pas',
  uTickTockTimer in 'common\uTickTockTimer.pas',
  uFMXMain in 'uFMXMain.pas' {FormFMXMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormFMXMain, FormFMXMain);
  Application.Run;
end.
