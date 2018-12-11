unit MyMaskEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask;

type
  TMask = (pCpf, pCnpj, pData, pTel);
  TMyMaskEdit = class(TMaskEdit)
  private
    FMascara: TMask;
    function RetiraCaracteres(const pValor: String): String;
    procedure SetMascara(const Value: TMask);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    function getValorLimpo: String;
  published
    { Published declarations }
    property Mascara : TMask read FMascara write SetMascara;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('MyComponents', [TMyMaskEdit]);
end;

{ TMyMaskEdit }

function TMyMaskEdit.getValorLimpo: String;
begin
  result:= RetiraCaracteres(Text);
end;

function TMyMaskEdit.RetiraCaracteres(const pValor: String): String;
var
  vCont: integer;
begin
  for vCont:= 1 to length(pValor) do
  begin
    if((pValor[vCont]<> '-') and
       (pValor[vCont]<> '.') and
       (pValor[vCont]<> '/') and
       (pValor[vCont]<> ',') and
       (pValor[vCont]<> '(') and
       (pValor[vCont]<> ')'))then
    result:= result + pValor[vCont];
  end;
end;

procedure TMyMaskEdit.SetMascara(const Value: TMask);
begin
  FMascara := Value;
  case Value of
    pCpf:  EditMask:= '999.999.999-99;1;_';
    pCnpj: EditMask:= '99.999.999/9999-99;1;_';
    pData: EditMask:= '99/99/9999;1;_';
    pTel:  EditMask:= '(99)9999-9999;1;_';
  end;
end;

end.
