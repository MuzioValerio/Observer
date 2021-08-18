program VCLObserver;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FormMain},
  uObserver in 'common\uObserver.pas',
  uTickTockTimer in 'common\uTickTockTimer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
