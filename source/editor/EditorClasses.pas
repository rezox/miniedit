unit EditorClasses;
{$mode objfpc}{$H+}
{$INTERFACES CORBA} //Needed for interfaces without guid, see below
{**
 * Mini Edit
 *
 * @license    GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * @author    Zaher Dirkey <zaher at parmaja dot com>
 *}

interface

uses
  Classes, SysUtils, Contnrs, mnClasses;

  type
    IFileEditor = interface
    end;

    IControlEditor = interface(IFileEditor)
    end;

    IClipboardEditor = interface(IFileEditor)
      function CanPaste: Boolean;
      procedure Paste;
      procedure Cut;
      function CanCopy: Boolean;
      procedure Copy;
      procedure SelectAll;
    end;

    ITextEditor = interface(IClipboardEditor)
    end;

    IExecuteEditor = interface
    end;

    IWatchEditor = interface
    end;

    IFormEditor = interface
    end;

    { TEditorElement }

    TEditorElement = class(TPersistent)
    private
    protected
      FName: string;
      FTitle: string;
      FDescription: string;
      FImageIndex: integer;
      function GetDescription: string; virtual;
    public
      constructor Create; virtual;

      property Name: string read FName write FName;
      property Title: string read FTitle write FTitle;
      property Description: string read GetDescription write FDescription;
      property ImageIndex: integer read FImageIndex write FImageIndex;
    end;

    { TEditorElements }

    TEditorElements = class(specialize TmnNamedObjectList<TEditorElement>)
    private
    public
    end;

implementation

{ TEditorElement }

function TEditorElement.GetDescription: string;
begin
  Result := FDescription;
end;

constructor TEditorElement.Create;
begin
  inherited Create;
  FImageIndex := -1;
end;

end.

