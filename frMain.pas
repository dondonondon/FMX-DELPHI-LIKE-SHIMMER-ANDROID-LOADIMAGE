unit frMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Ani, FMX.ScrollBox,
  FMX.Memo, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, System.Threading;

type
  TFMain = class(TForm)
    vsMain: TVertScrollBox;
    btnLoadData: TCornerButton;
    ciCopy: TCircle;
    grAni: TGradientAnimation;
    nHTTP: TNetHTTPClient;
    procedure btnLoadDataClick(Sender: TObject);
  private
    YY : Single;
    sProses : Boolean;
    procedure fnLoadData;
    procedure fnAddCi(tot : Integer);
    procedure fnReArange;
    procedure fnGetImage(ci : TCircle; id: String);
    procedure fnSetImageNull(ci : TCircle);
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.fmx}

uses uFunc, uRest;

{ TFMain }

const
  pad = 12;

procedure TFMain.btnLoadDataClick(Sender: TObject);
begin
  if sProses then begin
    ShowMessage('SEDANG BERLANGSUNG');
    Exit;
  end;

  TTask.Run(procedure begin
    fnLoadData;
  end).Start;
end;

procedure TFMain.fnAddCi(tot: Integer);
var
  ci : TCircle;
  gr : TGradientAnimation;
  i: Integer;
  ii: Integer;
begin
  vsMain.Content.DeleteChildren;

  YY := pad;

  for i := 0 to tot - 1 do begin
    ci := TCircle(ciCopy.Clone(vsMain));
    ci.Parent := vsMain;

    ci.Visible := True;

    ci.Tag := Random(100);

    ci.Width := (vsMain.Width - (pad * 4)) / 3;
    ci.Height := ci.Width;

    gr := TGradientAnimation(grAni.Clone(ci));
    gr.Parent := ci;

    for ii := 0 to ci.ChildrenCount - 1 do begin
      if ci.Children[ii] is TGradientAnimation then begin
        TGradientAnimation(ci.Children[ii]).AutoReverse := True;
        TGradientAnimation(ci.Children[ii]).Loop := True;
        TGradientAnimation(ci.Children[ii]).Inverse := True;
        TGradientAnimation(ci.Children[ii]).PropertyName := 'Fill.Gradient';
        TGradientAnimation(ci.Children[ii]).Enabled := True;
      end;
    end;
  end;

  fnReArange;
end;

procedure TFMain.fnLoadData;
var
  arr : TStringArray;
  tot : Integer;
  req : String;
  i, xx, yy: Integer;
begin
  sProses := True;
  try
    req := 'loadDataImg';
    arr := fnGetJSON(nHTTP, req);

    if arr[0, 0] = 'null' then begin
      ShowMessage('GAGAL BRO');
      Exit;
    end;

    tot := Length(arr[0]);

    TThread.Synchronize(nil, procedure begin
      fnAddCi(tot);
    end);

    TParallel.For(3, 0, vsMain.Content.ControlsCount - 1, procedure (i : Integer) begin
      fnGetImage(TCircle(vsMain.Content.Controls[i]), arr[0, i]);
    end);
  finally
    sProses := False;
  end;
end;

procedure TFMain.fnGetImage(ci : TCircle; id: String);
var
  arr : TStringArray;
  req, base : String;
  tHTTP : TNetHTTPClient;
begin
  req := 'loadImg&id='+id;

  tHTTP := TNetHTTPClient.Create(FMain);
  try
    try
      arr := fnGetJSON(tHTTP, req);

      if arr[0,0] = 'null' then begin
        fnSetImageNull(ci);
        Exit;
      end;

      base := fnReplaceStr(arr[1,0], '\n','');
      base := fnReplaceStr(base, '\r','');

      //fnDecode(base, id + '.jpg');   //simpan image dahulu
      //Sleep(100);

      TThread.Synchronize(nil, procedure begin
        ci.Fill.Kind := TBrushKind.Bitmap;
        ci.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
        fnDecodeImg(ci, base);
        //fnLoadImage(ci, id + '.jpg'); //panggil image yang sudah disimpan
      end);
    except
      fnSetImageNull(ci);
    end;
  finally
    tHTTP.DisposeOf;
  end;
end;

procedure TFMain.fnSetImageNull(ci: TCircle);
begin
  TThread.Synchronize(nil, procedure begin
    ci.Fill.Kind := TBrushKind.Bitmap;
    ci.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;

    fnLoadImage(ci, 'kosong.png');
  end);
end;

procedure TFMain.fnReArange;
var
  i, xx, yy : Integer;
  ci : TCircle;
  posY1, posY2 : Single;
begin
  xx := 0;
  yy := 0;
  posY1 := pad;

  for i := 0 to vsMain.Content.ControlsCount - 1 do begin
    ci := TCircle(vsMain.Content.Controls[i]);

    if yy = 0 then begin
      ci.Position.Y := posY1;
      ci.Position.X := (vsMain.Width - ci.Width) / 2;

      posY1 := posY1 + ci.Height + pad;

      posY2 := posY1;
      posY2 := posY2 - ((ci.Height - pad) / 2);

      yy := 1;
      xx := 0;
    end else begin
      ci.Position.Y := posY2;

      if xx = 0 then begin
        ci.Position.X := pad;
      end else if xx = 1 then begin
        ci.Position.X := vsMain.Width - (pad + ci.Width);
        yy := 0;
      end;

      Inc(xx);
    end;

  end;
end;

end.
