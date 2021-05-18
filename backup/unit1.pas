unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, lazutf8, LCLType, LConvEncoding;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    LabeledEdit1: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
const charsID: array of string =
      (
        'А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П',
        'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я',
        'а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п',
        'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я',
        ' ', '.', ','
      );
var S:AnsiString;
    zvonk, gluh, zvonkInWord, gluhInWord, gluhOutput:set of byte;
    i,j,n,l,k,b:integer;
    word,labelCap,debu:string;
begin
  zvonk:=[1, 2, 3, 4, 7, 8, 10, 12, 13, 14, 17, 34, 35, 36, 37, 40, 41, 43, 45, 46, 47, 50];
  gluh:=[11, 16, 18, 19, 21, 22, 23, 24, 25, 26, 44, 49, 51, 52, 54, 55, 56, 57, 58, 59];
  zvonkInWord:=[];
  gluhInWord:=[];
  gluhOutput:=[];

  labelCap:='';

  S:=LabeledEdit1.Text+' ';
  n:=0;
  k:=0;
  i:=1;

  while i<=Length(S) do begin
    if (S[i]<>' ') then begin
      n:=i;
      while (S[i]<>' ') do begin
        k:=i;
        i:=i+1;
      end;
      word:=Copy(S, n, k-n+1);
      j:=1;
      while j<=Length(word) do begin
        for l:=low(charsID) to high(charsID) do begin
          if(word[j]+word[j+1] = charsID[l]) then zvonkInWord:=zvonkInWord+[l];
          if(word[j]+word[j+1] = charsID[l]) then gluhInWord:=gluhInWord+[l];
        end;
        j:=j+1;
      end;
      gluhOutput:=gluhOutput+(gluh-gluhInWord);
    end;
    i:=i+1;
  end;

  Label2.Caption:=labelCap;
  labelCap:='Звонкие: ';

  zvonkInWord:=zvonkInWord*zvonk;
  for i:=low(charsID) to high(charsID) do begin
    if (i in zvonkInWord) then labelCap:=labelCap + charsID[i]+', ';
  end;

  Delete(labelCap,Length(labelCap)-1,2);
  labelCap:=labelCap+'.'+#10+'Глухие: ';

  for i:=low(charsID) to high(charsID) do begin
    if (i in gluhOutput) then labelCap:=labelCap + charsID[i]+', ';
  end;

  Delete(labelCap,Length(labelCap)-1,2);
  Label2.Caption:=labelCap+'.';

end;

end.

