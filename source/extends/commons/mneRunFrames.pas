unit mneRunFrames;
{$mode objfpc}{$H+}
{**
 * Mini Edit
 *
 * @license    GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * @author    Zaher Dirkey <zaher at parmaja dot com>
 *}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, EditorEngine, SelectFiles, EditorDebugger;

type

  { TRunFrameOptions }

  TRunFrameOptions = class(TFrame, IEditorOptions)
    Button3: TButton;
    CompilerEdit: TEdit;
    CompilerLabel: TLabel;
    Label7: TLabel;
    OpenDialog: TOpenDialog;
    PauseChk: TCheckBox;
    RunModeCbo: TComboBox;
    procedure Button3Click(Sender: TObject);
  private
  protected
  public
    Options : TEditorProjectOptions;
    procedure Apply;
    procedure Retrieve;
  end;

implementation

{$R *.lfm}

{ TRunFrameOptions }

procedure TRunFrameOptions.Button3Click(Sender: TObject);
begin
  OpenDialog.Filter := 'EXE files|*.exe|All files|*.*';
  OpenDialog.FileName := CompilerEdit.Text;
  OpenDialog.InitialDir := ExtractFilePath(OpenDialog.FileName);
  if OpenDialog.Execute then
  begin
    CompilerEdit.Text := OpenDialog.FileName;
  end;
end;

procedure TRunFrameOptions.Apply;
begin
  Options.Mode := TmneRunMode(RunModeCbo.ItemIndex);
  Options.Pause := PauseChk.Checked;
end;

procedure TRunFrameOptions.Retrieve;
begin
  EnumRunMode(RunModeCbo.Items);
  RunModeCbo.ItemIndex := ord(Options.Mode);
  PauseChk.Checked := Options.Pause;
end;

end.
