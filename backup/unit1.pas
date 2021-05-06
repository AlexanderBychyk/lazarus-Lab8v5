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
const charsID: array [0..68] of string =
      (
        'А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П',
        'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я',
        'а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п',
        'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я',
        ' ', '.', ','
      );
var S:AnsiString;
    zvonk, gluh:set of byte;
    i,j,l,n,k:integer;
    word,ruchar:string;
begin
  zvonk:=[1, 2, 3, 4, 7, 8, 10, 12, 13, 14, 17, 34, 35, 36, 37, 40, 41, 43, 45, 46, 47, 50];
  gluh:=[11, 16, 18, 19, 21, 22, 23, 24, 25, 26, 44, 49, 51, 52, 54, 55, 56, 57, 58, 59];

  S:=LabeledEdit1.Text;
  word:=S;
  n:=0;
  k:=0;

  Label2.caption := (S[1]) + (S[2]) + charsID[51];

  l:=1;
  i:=0;
  while l <=UTF8Length(word) do begin
    i:=i+1;
    label2.caption := label2.caption + S[l];
    l:=l+2;
    //for j:=Low(charID) to High(charsID) do begin
    //  if ()
    //end;
  end;

  {
  for i:=1 to Length(S) do begin
    if((S[i]=',') or (S[i]='.')) then begin

      k:=i;
      word:=Copy(S,n+1,k-n+1);
      n:=i+1;

      LabeledEdit1.Text := LabeledEdit1.Text + word;

      //for l:=1 to length(word) do begin
      //  for j:=Low(charsID) to High(charsId) do begin
      //    if (word[l]=charsID[j]) then Label2.Caption := Label2.Caption + charsID[j];
      //  end;
      //end;

    end;
  end;
  }
  //end;

  //showMessage(S); //debuger

end;

end.

