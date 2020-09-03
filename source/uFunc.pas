unit uFunc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.IniFiles,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, System.Json, System.NetEncoding, Data.DBXJsonCommon,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FMX.ListView.Types,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Objects, FMX.StdCtrls, FMX.ListBox,
  FMX.DialogService, System.DateUtils, System.IOUtils, FMX.Layouts, FMX.WebBrowser,
  System.Net.URLClient, System.Net.HttpClient, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, FMX.Memo, System.Actions, FMX.ActnList, FMX.Edit, FMX.Ani,
  System.Net.HttpClientComponent, FMX.Media, System.Threading, IdHashMessageDigest, idHash, IdGlobal
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
    ;
  {$ELSEIF Defined(MSWINDOWS)}
    ,IWSystem;
  {$ELSE}
  ;
  {$ENDIF}

function fnReplaceStr(strSource, strReplaceFrom, strReplaceWith: string;
         goTrim: Boolean = true): string;

procedure fnSQLAdd(Query: TFDQuery; SQL: string; ClearPrior: Boolean = False); overload;
procedure fnSQLOpen(Query: TFDQuery); overload;
procedure fnExecSQL(Query: TFDQuery); overload;
procedure fnSQLParamByName(Query: TFDQuery; ParamStr: string; Value: Variant); overload;
procedure prExplodeStr(SourceStr: string; Delimiter: char; var List: TStringList);

procedure fnLoadImage(img : TImage; nmFile : String); overload;
procedure fnLoadImage(img : TRectangle; nmFile : String); overload;
procedure fnLoadImage(img : TCircle; nmFile : String); overload;
procedure fnLoadImage(img : TListItemImage; nmFile : String); overload;
procedure fnLoadImage(from, toImg : TImage); overload;
procedure fnLoadImage(from, toImg : TRectangle); overload;
procedure fnLoadImage(from : TImage; toImg : TRectangle); overload;
procedure fnLoadImage(from : TImage; toImg : TCircle); overload;
procedure fnLoadImage(from : TRectangle; toImg : TImage); overload;
procedure fnLoadImage(from : TCircle; toImg : TImage); overload;

function fnLoadImages(img : TImage; nmFile : String; usingThread : Boolean = False): Boolean; overload;
function fnLoadImages(img : TRectangle; nmFile : String; usingThread : Boolean = False): Boolean; overload;
function fnLoadImages(img : TCircle; nmFile : String; usingThread : Boolean = False): Boolean; overload;
function fnLoadImage(nmFile : String; usingThread : Boolean = False): String; overload;


procedure fnSaveImg(img : TImage; nmFile : String); overload
procedure fnSaveImg(img : TImage; nmFile : String; min : Integer); overload
procedure fnSaveImg(img : TRectangle; nmFile : String; min : Integer); overload;
procedure fnSaveImg(img : TCircle; nmFile : String; min : Integer); overload;

procedure fnDeleteFile(nmFile : String);

procedure fnSetSizeImage(img : TImage; min : Integer);

procedure addHeaderLB(str : String; lb : TListBox); overload;
procedure addHeaderLB(str : String; lb : TListBox; stl : String); overload;

procedure addItemLB(str, detail : String; lb : TListBox; stl : String); overload;
procedure addItemLB(str, detail : String; lb : TListBox; stl : String; txtColor : Cardinal); overload;
procedure fnLoadImgFromUrl(url: String; bmps: TImage); overload;
procedure fnLoadImgFromUrl(HTTP : TNetHTTPClient; url: String; bmps: TImage); overload;
function fnGetDate():String; overload;
function fnGetDate(frmt : String):String; overload;

function fnEncodeImg(loc : String):String;
function fnEncode(loc : String):String;

procedure fnDecodeImg(img : TImage; str : String); overload;
procedure fnDecodeImg(img : TRectangle; str : String); overload;
procedure fnDecodeImg(img : TCircle; str : String); overload;

procedure fnDecode(str, nmFile : String);
procedure fnTDecode(str, nmFile : String);
procedure fnDecodeToDir(str, loc : String);
function fnCheckFile(nmFile : String): Boolean; overload;
function fnCheckFileExist(nmFile : String): String; overload;

procedure fnSetFont(cmb : TComboBox; sz : Single);

procedure SaveSettingString(Section, Name, Value: string);
function LoadSettingString(Section, Name, Value: string): string;

procedure fnGetCenter(fromParent, AParent : TControl); overload;
procedure fnGetTop(fromParent, AParent : TControl);
procedure fnGetBottom(fromParent, AParent : TControl);

procedure fnGetClient(fromParent, AParent : TControl); overload;
procedure fnGetClient(AForm : TForm; AParent : TControl); overload;
procedure fnGetClient(fromParent, AParent : TControl; bot, lef, rig, top : Single); overload;


procedure fnSetPosXY(AParent : TControl; posX, posY : Single); overload;
procedure fnSetPosXY(AParent : TControl; posX, posY, wi, he : Single); overload;

procedure fnCopyPosXY(AParent, ATarget : TControl);

function fnGetPosYDown(AParent : TControl; plus : Single): Single; overload;
function fnGetPosYDown(AParent : TControl): Single; overload;
function fnGetPosYUp(AParent, ATarget : TControl; plus : Single): Single;

function MD5(str : string): String;

function fnLoadFile(str : String): String;

procedure fnPlaySound(med : TMediaPlayer; musik : String; stat : Boolean = False);

procedure fnClearString(stg : TStringGrid);

function fnDateENTOID(str : TDateTime; stat : Boolean = False): String;
function fnDateMonthEnToId(str : String): String;
function fnDateDayEnToId(str : String): String;
function fnGetClock(str : String):TDateTime;
function fnGetDay: String;
function fnSetCMB(cmb: TComboBox; str: String): Integer;
function UpperCaseFirstLetter(const s : string) : string;
function fnGetColor(idx : Integer): Cardinal;

procedure setSizeFontCMB(cmb: TComboBox; sz: Single; stat : Boolean = False); overload;
procedure setSizeFontCMB(cmb: TComboBox; sz: Single; align : TTextAlign; stat : Boolean = False); overload;
procedure fnLog(mem : TMemo; str : String);
function fnCreateID(str : String) : String; overload;
function fnCreateID : String; overload;
procedure fnCreateSpace(AParent : TControl; posX, posY, heigh  : Single);
procedure fnExecActionList(AL : TActionList; idx : Integer);
procedure fnSetVisibleControl(AControl : TControl; stat : Boolean; usingThread : Boolean = False);
procedure fnDeleteRow(stg : TStringGrid; ARow : Integer);
procedure fnOrderVert(ACtrl : TLayout; kol : integer; stat : Boolean = False); overload;
procedure fnOrderVert(ACtrl : TVertScrollBox; kol : integer; stat : Boolean = False); overload;
procedure setEdit(E : TEdit);


var
  TaskMP : ITask;
  statMP : Boolean;

implementation


function fnReplaceStr(strSource, strReplaceFrom, strReplaceWith: string; goTrim: Boolean = true): string;
begin
  if goTrim then strSource := Trim(strSource);
  Result := StringReplace(strSource, StrReplaceFrom, StrReplaceWith, [rfReplaceAll, rfIgnoreCase])
end;

procedure prExplodeStr(SourceStr: string; Delimiter: char; var List: TStringList);
var
  i: integer;
begin
  List.Clear;
  while Length(SourceStr) > 0 do
  begin
    i := Pos(Delimiter, SourceStr);
    if (i > 0) then
    begin
      List.Add(Copy(SourceStr, 1, i - 1));
      SourceStr := Copy(SourceStr, i + 1, Length(SourceStr) - i);
    end // if (i > 0) then
    else if Length(SourceStr) > 0 then
    begin
      List.Add(SourceStr);
      SourceStr := '';
    end // if Length(SourceStr) > 0 then
  end; //while Length(SourceStr) > 0 do
end;

procedure fnSQLAdd(Query: TFDQuery; SQL: string; ClearPrior: Boolean = False); overload;
var s: string;
begin
  if ClearPrior then
    Query.SQL.Clear;

  s := fnReplaceStr(SQL, 'GETDATE', 'CURRENT_DATE');
  s := fnReplaceStr(s, 'ISNULL', 'IFNULL');

  Query.SQL.Add(S);
end;

procedure fnSQLOpen(Query: TFDQuery); overload;
var L: TStringList;
  s: string;
  s1: string;
  TempS: string;
  x1: integer;
  x2: integer;
begin
  L := TStringList.Create;

  s := Query.SQL.Text;
  x1 := Pos('SELECT TOP', UpperCase(s));
  if x1 > 0 then
  begin
    if s[x1 - 1] = '(' then // --> berarti ada Sub Query di dalam Query, perlu diparse lagi
    begin
      x2 := Pos(')', s); // ambil akhir dari sub query
      s1 := UpperCase(Copy(s, x1, x2 - x1));
      prExplodeStr(s1, ' ', L);

      TempS := L[1] + ' ' + L[2];

      Insert(' LIMIT ' + L[2], s, x2);
      s := fnReplaceStr(s, TempS, '');
      Query.SQL.Text := s;
    end
    else
    begin
      // ambil jumlahnya
      prExplodeStr(UpperCase(s), ' ', L);

      TempS := L[1] + ' ' + L[2];

      s := fnReplaceStr(s, TempS, '');
      s := s + ' LIMIT ' + L[2];
      Query.SQL.Text := s;
    end
  end;

  FreeAndNil(L);

  Query.Prepared;
//  fnWriteQueryLog(Format('DATE: %s | QUERY: %s', [fnFormatDateTimeDB(Now), Query.SQL.Text]));
  Query.Open;
end;

procedure fnExecSQL(Query: TFDQuery); overload;
var L: TStringList;
  s: string;
  s1: string;
  TempS: string;
  x1: integer;
  x2: integer;
begin
  L := TStringList.Create;

  s := Query.SQL.Text;
  x1 := Pos('SELECT TOP', UpperCase(s));
  if x1 > 0 then
  begin
    if s[x1 - 1] = '(' then // --> berarti ada Sub Query di dalam Query, perlu diparse lagi
    begin
      x2 := Pos(')', s); // ambil akhir dari sub query
      s1 := UpperCase(Copy(s, x1, x2 - x1));
      prExplodeStr(s1, ' ', L);

      TempS := L[1] + ' ' + L[2];

      Insert(' LIMIT ' + L[2], s, x2);
      s := fnReplaceStr(s, TempS, '');
      Query.SQL.Text := s;
    end
    else
    begin
      // ambil jumlahnya
      prExplodeStr(UpperCase(s), ' ', L);

      TempS := L[1] + ' ' + L[2];

      s := fnReplaceStr(s, TempS, '');
      s := s + ' LIMIT ' + L[2];
      Query.SQL.Text := s;
    end
  end;

  FreeAndNil(L);

  Query.Prepared;

  Query.ExecSQL;
end;

procedure fnSQLParamByName(Query: TFDQuery; ParamStr: string; Value: Variant); overload;
begin
  Query.Params.ParamByName(ParamStr).Value := Value
end;

procedure fnLoadImage(img : TImage; nmFile : String);
var
  xx, loc, locTemp : String;
begin
  {TThread.Synchronize(nil, procedure begin
    img.Visible := False;
  end);}

  img.BeginUpdate;

  try
    {$IF DEFINED(IOS) or DEFINED(ANDROID)}
      xx := TPath.GetDocumentsPath + PathDelim;
    {$ELSEIF Defined(MSWINDOWS)}
      xx := gsAppPath + 'assets' + PathDelim;
    {$ENDIF}

    loc := xx + nmFile;
    locTemp := xx + 'kosong.png';

    if FileExists(loc) then
      img.Bitmap.LoadFromFile(loc)
    else
      img.Bitmap.LoadFromFile(locTemp);
  finally
    img.EndUpdate;
    {TThread.Synchronize(nil, procedure begin
      img.Visible := True;
    end);}
  end;
end;

procedure fnLoadImage(img : TRectangle; nmFile : String);
var
  xx, loc, locTemp : String;
begin
  img.BeginUpdate;
  try
    {$IF DEFINED(IOS) or DEFINED(ANDROID)}
      xx := TPath.GetDocumentsPath + PathDelim;
    {$ELSEIF Defined(MSWINDOWS)}
      xx := gsAppPath + 'assets' + PathDelim;
    {$ENDIF}

    loc := xx + nmFile;
    locTemp := xx + 'kosong.png';

    if FileExists(loc) then
      img.Fill.Bitmap.Bitmap.LoadFromFile(loc)
    else
      img.Fill.Bitmap.Bitmap.LoadFromFile(locTemp);
  finally
    img.EndUpdate;
  end;
end;

procedure fnLoadImage(img : TCircle; nmFile : String);
var
  xx, loc, locTemp : String;
begin
  img.BeginUpdate;
  try
    {$IF DEFINED(IOS) or DEFINED(ANDROID)}
      xx := TPath.GetDocumentsPath + PathDelim;
    {$ELSEIF Defined(MSWINDOWS)}
      xx := gsAppPath + 'assets' + PathDelim;
    {$ENDIF}

    loc := xx + nmFile;
    locTemp := xx + 'kosong.png';

    if FileExists(loc) then
      img.Fill.Bitmap.Bitmap.LoadFromFile(loc)
    else
      img.Fill.Bitmap.Bitmap.LoadFromFile(locTemp);
  finally
    img.EndUpdate;
  end;
end;

function fnLoadImages(img : TImage; nmFile : String; usingThread : Boolean = False): Boolean;
var
  xx, loc, locTemp : String;
begin
  {TThread.Synchronize(nil, procedure begin
    img.Visible := False;
  end);}
  img.BeginUpdate;
  try
    {$IF DEFINED(IOS) or DEFINED(ANDROID)}
      xx := TPath.GetDocumentsPath + PathDelim;
    {$ELSEIF Defined(MSWINDOWS)}
      xx := gsAppPath + 'assets' + PathDelim;
    {$ENDIF}

    loc := xx + nmFile;
    locTemp := xx + 'kosong.png';

    if FileExists(loc) then begin
      if usingThread = True then begin
        TThread.Synchronize(nil, procedure begin
          img.Bitmap.LoadFromFile(loc);
        end);
        Result := True;
      end else begin
        img.Bitmap.LoadFromFile(loc);

        Result := True;
      end;

    end else begin
      if usingThread = True then begin
        TThread.Synchronize(nil, procedure begin
          img.Bitmap.LoadFromFile(locTemp);
        end);
        Result := False;
      end else begin
          img.Bitmap.LoadFromFile(locTemp);

        Result := False;
      end;
    end;
  finally
    img.EndUpdate;
    {TThread.Synchronize(nil, procedure begin
      img.Visible := True;
    end);}
  end;
end;

function fnLoadImages(img : TRectangle; nmFile : String; usingThread : Boolean = False): Boolean;
var
  xx, loc, locTemp : String;
begin
    img.BeginUpdate;
  try
    {$IF DEFINED(IOS) or DEFINED(ANDROID)}
      xx := TPath.GetDocumentsPath + PathDelim;
    {$ELSEIF Defined(MSWINDOWS)}
      xx := gsAppPath + 'assets' + PathDelim;
    {$ENDIF}

    loc := xx + nmFile;
    locTemp := xx + 'kosong.png';

    if FileExists(loc) then begin
      if usingThread = True then begin
        TThread.Synchronize(nil, procedure begin
          img.Fill.Bitmap.Bitmap.LoadFromFile(loc);
        end);
        Result := True;
      end else begin
        img.Fill.Bitmap.Bitmap.LoadFromFile(loc);

        Result := True;
      end;

    end else begin
      if usingThread = True then begin
        TThread.Synchronize(nil, procedure begin
          img.Fill.Bitmap.Bitmap.LoadFromFile(locTemp);
        end);
        Result := False;
      end else begin
          img.Fill.Bitmap.Bitmap.LoadFromFile(locTemp);

        Result := False;
      end;
    end;
  finally
    img.EndUpdate;
  end;
end;

function fnLoadImages(img : TCircle; nmFile : String; usingThread : Boolean = False): Boolean;
var
  xx, loc, locTemp : String;
begin
  img.BeginUpdate;
  try
    {$IF DEFINED(IOS) or DEFINED(ANDROID)}
      xx := TPath.GetDocumentsPath + PathDelim;
    {$ELSEIF Defined(MSWINDOWS)}
      xx := gsAppPath + 'assets' + PathDelim;
    {$ENDIF}

    loc := xx + nmFile;
    locTemp := xx + 'kosong.png';

    if FileExists(loc) then begin
      if usingThread = True then begin
        TThread.Synchronize(nil, procedure begin
          img.Fill.Bitmap.Bitmap.LoadFromFile(loc);
        end);
        Result := True;
      end else begin
        img.Fill.Bitmap.Bitmap.LoadFromFile(loc);

        Result := True;
      end;

    end else begin
      if usingThread = True then begin
        TThread.Synchronize(nil, procedure begin
          img.Fill.Bitmap.Bitmap.LoadFromFile(locTemp);
        end);
        Result := False;
      end else begin
        img.Fill.Bitmap.Bitmap.LoadFromFile(locTemp);

        Result := False;
      end;
    end;
  finally
    img.EndUpdate;
  end;
end;

procedure fnLoadImage(img : TListItemImage; nmFile : String);
var
  xx, loc, locTemp : String;
  temp : TImage;
begin
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
    xx := TPath.GetDocumentsPath + PathDelim;
  {$ELSEIF Defined(MSWINDOWS)}
    xx := gsAppPath + 'assets' + PathDelim;
  {$ENDIF}

  loc := xx + nmFile;
  locTemp := xx + 'kosong.png';

  temp := TImage.Create(nil);
  try
    if FileExists(loc) then
      temp.Bitmap.LoadFromFile(loc)
    else
      temp.Bitmap.LoadFromFile(locTemp);

    img.Bitmap := temp.Bitmap;
  except
  end;
end;

function fnLoadImage(nmFile : String; usingThread : Boolean = False): String;
var
  xx, loc, locTemp : String;
begin
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
    xx := TPath.GetDocumentsPath + PathDelim;
  {$ELSEIF Defined(MSWINDOWS)}
    xx := gsAppPath + 'assets' + PathDelim;
  {$ENDIF}

  loc := xx + nmFile;
  locTemp := xx + 'kosong.png';

  if FileExists(loc) then
    Result := loc
  else
    Result := locTemp;
end;

procedure fnLoadImage(from, toImg : TImage);
begin
  toImg.Bitmap := from.Bitmap;
end;

procedure fnLoadImage(from, toImg : TRectangle);
begin
  toImg.Fill.Bitmap.Bitmap := from.Fill.Bitmap.Bitmap;
end;

procedure fnLoadImage(from : TImage; toImg : TRectangle);
begin
  toImg.Fill.Bitmap.Bitmap := from.Bitmap;
end;

procedure fnLoadImage(from : TRectangle; toImg : TImage);
begin
  toImg.Bitmap := from.Fill.Bitmap.Bitmap;
end;

procedure fnLoadImage(from : TCircle; toImg : TImage);
begin
  toImg.Bitmap := from.Fill.Bitmap.Bitmap;
end;

procedure fnLoadImage(from : TImage; toImg : TCircle);
begin
  toImg.Fill.Bitmap.Bitmap := from.Bitmap;
end;

function fnLoadFile(str : String): String;
var
  xx, loc, locTemp : String;
begin
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
    xx := TPath.GetDocumentsPath + PathDelim;
  {$ELSEIF Defined(MSWINDOWS)}
    xx := gsAppPath + 'assets' + PathDelim;
  {$ENDIF}

  Result := xx + str;
end;

procedure fnLoadImgFromUrl(url: String; bmps: TImage);
var
  Stream : TMemoryStream;
  HTTP : TNetHTTPClient;
begin
  TThread.Synchronize(nil, procedure begin
    bmps.Visible := False;
  end);

  HTTP := TNetHTTPClient.Create(nil);
  Stream := TMemoryStream.Create;
  bmps.BeginUpdate;
  try
    HTTP.Get(url, Stream);
    Stream.Position := 0;
    bmps.Bitmap.LoadFromStream(Stream);
  finally
    begin
      HTTP.DisposeOf;
      Stream.DisposeOf;
      bmps.EndUpdate;

      TThread.Synchronize(nil, procedure begin
        bmps.Visible := True;
      end);
    end;
  end;
end;

procedure fnLoadImgFromUrl(HTTP : TNetHTTPClient; url: String; bmps: TImage);
var
  Stream : TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  bmps.BeginUpdate;
  try
    try
      HTTP.Get(url, Stream);
      Stream.Position := 0;
      TThread.Synchronize(nil, procedure begin
        bmps.Bitmap.LoadFromStream(Stream);
      end);
    except
      fnLoadImage(bmps, 'kosong.png');
    end;
  finally
    Stream.DisposeOf;
    Stream := nil;
    bmps.EndUpdate;
  end;
end;

procedure addHeaderLB(str : String; lb : TListBox);
var
  head : TListBoxGroupHeader;
begin
  //lb.BeginUpdate;
  try
    head := TListBoxGroupHeader.Create(lb);
    head.Text := uppercase(str);
    head.TextSettings.Font.Style := [TFontStyle.fsBold];
    head.FontColor := $FFE38E05;
    head.StyledSettings := [];
    lb.AddObject(head);
  finally
    //lb.EndUpdate;
  end;
end;

procedure addHeaderLB(str : String; lb : TListBox; stl : String);
var
  head : TListBoxGroupHeader;
begin
  //lb.BeginUpdate;
  try
    head := TListBoxGroupHeader.Create(lb);
    head.StyleLookup := stl;
    head.Text := uppercase(str);
    head.TextSettings.Font.Style := [TFontStyle.fsBold];
    head.FontColor := $FFE38E05;
    head.StyledSettings := [];
    lb.AddObject(head);

    Application.ProcessMessages;
  finally
    //lb.EndUpdate;
  end;
end;

procedure addItemLB(str, detail : String; lb : TListBox; stl : String);
var
  txt : TListBoxItem;
begin
  //lb.BeginUpdate;
  try
    txt := TListBoxItem.Create(lb);
    txt.StyleLookup := stl;
    txt.Text := str;
    txt.ItemData.Detail := detail;
    txt.TextSettings.Font.Style := [TFontStyle.fsBold];
    txt.Selectable := False;
    txt.StyledSettings := [];
    lb.AddObject(txt);

    Application.ProcessMessages;
  finally
    //lb.EndUpdate;
  end;
end;

procedure addItemLB(str, detail : String; lb : TListBox; stl : String; txtColor : Cardinal);
var
  txt : TListBoxItem;
begin
  //lb.BeginUpdate;
  try
    txt := TListBoxItem.Create(lb);
    txt.StyleLookup := stl;
    txt.Text := str;
    txt.FontColor := txtColor;
    txt.ItemData.Detail := detail;
    txt.TextSettings.Font.Style := [TFontStyle.fsBold];
    txt.Selectable := False;
    txt.StyledSettings := [];
    lb.AddObject(txt);

    Application.ProcessMessages;
  finally
    //lb.EndUpdate;
  end;
end;

procedure fnSaveImg(img : TImage; nmFile : String);
var
  xx: String;
begin
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
    xx := TPath.GetDocumentsPath + PathDelim;
  {$ELSEIF Defined(MSWINDOWS)}
    xx := gsAppPath + 'assets' + PathDelim;
  {$ENDIF}
  xx := fnReplaceStr(xx, '\\','\');
  img.Bitmap.SaveToFile(xx + nmFile);
end;

procedure fnSetSizeImage(img : TImage; min : Integer);
var
  w, h : Integer;
begin
  w := img.Bitmap.Width;
  h := img.Bitmap.Height;

  if (w >= min) or (h >= min) then begin
    repeat
      w := Round(w/1.1);
      h := Round(h/1.1);
    until ((w <= min) and (h <= min));
    img.Bitmap.Resize(w , h);
  end;
end;

procedure fnSaveImg(img : TImage; nmFile : String; min : Integer);
var
  xx: String;
  w, h : Integer;
begin
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
    xx := TPath.GetDocumentsPath + PathDelim;
  {$ELSEIF Defined(MSWINDOWS)}
    xx := gsAppPath + 'assets' + PathDelim;
  {$ENDIF}
  w := img.Bitmap.Width;
  h := img.Bitmap.Height;

  if (w >= min) or (h >= min) then begin
    repeat
      w := Round(w/1.1);
      h := Round(h/1.1);
    until ((w <= min) and (h <= min));
    img.Bitmap.Resize(w , h);
  end;

  xx := fnReplaceStr(xx, '\\','\');
  img.Bitmap.SaveToFile(xx + nmFile);
end;

procedure fnSaveImg(img : TRectangle; nmFile : String; min : Integer);
var
  xx: String;
  w, h : Integer;
begin
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
    xx := TPath.GetDocumentsPath + PathDelim;
  {$ELSEIF Defined(MSWINDOWS)}
    xx := gsAppPath + 'assets' + PathDelim;
  {$ENDIF}
  w := img.Fill.Bitmap.Bitmap.Width;
  h := img.Fill.Bitmap.Bitmap.Height;

  if (w >= min) or (h >= min) then begin
    repeat
      w := Round(w/1.1);
      h := Round(h/1.1);
    until ((w <= min) and (h <= min));
    img.Fill.Bitmap.Bitmap.Resize(w , h);
  end;

  xx := fnReplaceStr(xx, '\\','\');
  img.Fill.Bitmap.Bitmap.SaveToFile(xx + nmFile);
end;

procedure fnSaveImg(img : TCircle; nmFile : String; min : Integer);
var
  xx: String;
  w, h : Integer;
begin
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
    xx := TPath.GetDocumentsPath + PathDelim;
  {$ELSEIF Defined(MSWINDOWS)}
    xx := gsAppPath + 'assets' + PathDelim;
  {$ENDIF}
  w := img.Fill.Bitmap.Bitmap.Width;
  h := img.Fill.Bitmap.Bitmap.Height;

  if (w >= min) or (h >= min) then begin
    repeat
      w := Round(w/1.1);
      h := Round(h/1.1);
    until ((w <= min) and (h <= min));
    img.Fill.Bitmap.Bitmap.Resize(w , h);
  end;

  xx := fnReplaceStr(xx, '\\','\');
  img.Fill.Bitmap.Bitmap.SaveToFile(xx + nmFile);
end;

procedure fnDeleteFile(nmFile : String);
var
  xx: String;
begin
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
    xx := TPath.GetDocumentsPath + PathDelim;
  {$ELSEIF Defined(MSWINDOWS)}
    xx := gsAppPath;
  {$ENDIF}

  if FileExists(xx + nmFile) then
    DeleteFile(xx + nmFile);
end;

function fnGetDate():String;    //menamai gambar image
begin
  Result := FormatDateTime('YYYYMMDDHHNNSS', Now) + '.jpg';
end;

function fnGetDate(frmt : String):String;
begin
  Result := FormatDateTime('YYYYMMDDHHNNSS', Now) + '.' + frmt;
end;

function fnEncodeImg(loc : String):String;
var
  HasilToJson : String;
  stream : TMemoryStream;
begin
  stream := TMemoryStream.Create;
  try
    stream.LoadFromFile(loc);
    HasilToJson := TDBXJSONTools.StreamToJSON(stream, 0, stream.Size).ToJSON;
    Result := TNetEncoding.Base64.Encode(HasilToJson);
  finally
    stream.Free;
  end;
end;

function fnEncode(loc : String):String;
var
  HasilToJson : String;
  stream : TMemoryStream;
begin
  stream := TMemoryStream.Create;
  try
    stream.LoadFromFile(loc);
    HasilToJson := TDBXJSONTools.StreamToJSON(stream, 0, stream.Size).ToJSON;
    Result := TNetEncoding.Base64.Encode(HasilToJson);
  finally
    stream.Free;
  end;
end;

procedure fnDecodeImg(img : TImage; str : String);
var
  memStream : TMemoryStream;
  jsonArray : TJSONArray;
  decode : String;
begin
  memStream := TMemoryStream.Create;
  decode := TNetEncoding.Base64.Decode(str);
  jsonArray := TJSONObject.ParseJSONValue(decode) as TJSONArray;
  try
    memStream.LoadFromStream(TDBXJSONTools.JSONToStream(jsonArray));
    img.Bitmap.LoadFromStream(memStream);
  finally
    memStream.DisposeOf;
    jsonArray.DisposeOf;
    memStream := nil;
    jsonArray := nil;
  end;
end;

procedure fnDecodeImg(img : TRectangle; str : String);
var
  memStream : TMemoryStream;
  jsonArray : TJSONArray;
  decode : String;
begin
  memStream := TMemoryStream.Create;
  decode := TNetEncoding.Base64.Decode(str);
  jsonArray := TJSONObject.ParseJSONValue(decode) as TJSONArray;
  try
    memStream.LoadFromStream(TDBXJSONTools.JSONToStream(jsonArray));
    img.Fill.Bitmap.Bitmap.LoadFromStream(memStream);
  finally
    memStream.DisposeOf;
    jsonArray.DisposeOf;
    memStream := nil;
    jsonArray := nil;
  end;
end;

procedure fnDecodeImg(img : TCircle; str : String);
var
  memStream : TMemoryStream;
  jsonArray : TJSONArray;
  decode : String;
begin
  memStream := TMemoryStream.Create;
  decode := TNetEncoding.Base64.Decode(str);
  jsonArray := TJSONObject.ParseJSONValue(decode) as TJSONArray;
  try
    memStream.LoadFromStream(TDBXJSONTools.JSONToStream(jsonArray));
    img.Fill.Bitmap.Bitmap.LoadFromStream(memStream);
  finally
    begin
      memStream.DisposeOf;
      jsonArray.DisposeOf;
      memStream := nil;
      jsonArray := nil;
    end;
  end;
end;

procedure fnDecode(str, nmFile : String);
var
  memStream : TMemoryStream;
  jsonArray : TJSONArray;
  decode, xx : String;
begin
  memStream := TMemoryStream.Create;
  decode := TNetEncoding.Base64.Decode(str);
  jsonArray := TJSONObject.ParseJSONValue(decode) as TJSONArray;
  try
    try
      memStream.LoadFromStream(TDBXJSONTools.JSONToStream(jsonArray));

      {$IF DEFINED(IOS) or DEFINED(ANDROID)}
        xx := TPath.GetDocumentsPath + PathDelim;
      {$ELSEIF Defined(MSWINDOWS)}
        xx := gsAppPath + 'assets' + PathDelim;
      {$ENDIF}
      xx := fnReplaceStr(xx, '\\','\');

      if FileExists(xx + nmFile) then
        DeleteFile(xx + nmFile);

      memStream.SaveToFile(xx + nmFile);
    except
      fnTDecode(fnEncode(fnLoadFile('kosong.png')), nmFile);
    end;
    //img.Fill.Bitmap.Bitmap.LoadFromStream(memStream);
  finally
    begin
      memStream.DisposeOf;
      jsonArray.DisposeOf;
      memStream := nil;
      jsonArray := nil;
    end;
  end;
end;

procedure fnTDecode(str, nmFile : String);
var
  memStream : TMemoryStream;
  jsonArray : TJSONArray;
  decode, xx : String;
begin
  memStream := TMemoryStream.Create;
  decode := TNetEncoding.Base64.Decode(str);
  jsonArray := TJSONObject.ParseJSONValue(decode) as TJSONArray;
  try
    memStream.LoadFromStream(TDBXJSONTools.JSONToStream(jsonArray));

    {$IF DEFINED(IOS) or DEFINED(ANDROID)}
      xx := TPath.GetDocumentsPath + PathDelim;
    {$ELSEIF Defined(MSWINDOWS)}
      xx := gsAppPath + 'assets' + PathDelim;
    {$ENDIF}
    xx := fnReplaceStr(xx, '\\','\');

    if FileExists(xx + nmFile) then
      DeleteFile(xx + nmFile);

    memStream.SaveToFile(xx + nmFile);
  finally
    begin
      memStream.DisposeOf;
      jsonArray.DisposeOf;
      memStream := nil;
      jsonArray := nil;
    end;
  end;
end;

procedure fnDecodeToDir(str, loc : String);
var
  memStream : TMemoryStream;
  jsonArray : TJSONArray;
  decode, xx : String;
begin
  memStream := TMemoryStream.Create;
  decode := TNetEncoding.Base64.Decode(str);
  jsonArray := TJSONObject.ParseJSONValue(decode) as TJSONArray;
  try
    memStream.LoadFromStream(TDBXJSONTools.JSONToStream(jsonArray));

    xx := loc;

    xx := fnReplaceStr(xx, '\\','\');

    if FileExists(xx) then
      DeleteFile(xx);

    memStream.SaveToFile(xx);
  finally
    begin
      memStream.DisposeOf;
      jsonArray.DisposeOf;
      memStream := nil;
      jsonArray := nil;
    end;
  end;
end;

function fnCheckFile(nmFile : String):Boolean;
var
  xx, loc, locTemp : String;
begin
  Result := False;

  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
    xx := TPath.GetDocumentsPath + PathDelim;
  {$ELSEIF Defined(MSWINDOWS)}
    xx := gsAppPath + 'assets' + PathDelim;
  {$ENDIF}

  loc := xx + nmFile;

  if FileExists(loc) then
    Result := True;
end;

function fnCheckFileExist(nmFile : String):String;
var
  xx, loc, locTemp : String;
begin
  Result := 'No Data';

  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
    xx := TPath.GetDocumentsPath + PathDelim;
  {$ELSEIF Defined(MSWINDOWS)}
    xx := gsAppPath + 'assets' + PathDelim;
  {$ENDIF}

  loc := xx + nmFile;

  if FileExists(loc) then
    Result := loc;
end;

function LoadSettingString(Section, Name, Value: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(TPath.GetDocumentsPath + PathDelim + 'config.ini');
  try
    Result := ini.ReadString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure SaveSettingString(Section, Name, Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(TPath.GetDocumentsPath + PathDelim + 'config.ini');
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure fnGetCenter(fromParent, AParent : TControl);
var
  wiF, wiP, heF, heP : Integer;
begin
  wiF := Round(fromParent.Width);
  heF := Round(fromParent.Height);
  wiP := Round(AParent.Width);
  heP := Round(AParent.Height);

  AParent.BeginUpdate;

  AParent.Position.X := Round((wiF / 2) - (wiP / 2));
  AParent.Position.Y := Round((heF / 2) - (heP / 2));
  AParent.EndUpdate;
end;

procedure fnGetTop(fromParent, AParent : TControl);
var
  wiF, wiP, heF, heP : Integer;
begin
  wiF := Round(fromParent.Width);
  heF := Round(fromParent.Height);
  wiP := Round(AParent.Width);
  heP := Round(AParent.Height);

  AParent.Position.X := Round((wiF / 2) - (wiP / 2));
  AParent.Position.Y := Round(0);
end;

procedure fnGetBottom(fromParent, AParent : TControl);
var
  wiF, wiP, heF, heP : Integer;
begin
  wiF := Round(fromParent.Width);
  heF := Round(fromParent.Height);
  wiP := Round(AParent.Width);
  heP := Round(AParent.Height);

  AParent.BeginUpdate;

  AParent.Position.X := Round((wiF / 2) - (wiP / 2));
  AParent.Position.Y := Round(heF - heP);

  AParent.EndUpdate;
end;

procedure fnGetClient(fromParent, AParent : TControl);
var
  wiF, wiP, heF, heP : Integer;
begin
  wiF := Round(fromParent.Width);
  heF := Round(fromParent.Height);
  wiP := Round(AParent.Width);
  heP := Round(AParent.Height);

  AParent.BeginUpdate;

  AParent.Position.X := 0;
  AParent.Position.Y := 0;

  AParent.Width := wiF;
  AParent.Height := heF;

  AParent.EndUpdate;
end;

procedure fnGetClient(AForm : TForm; AParent : TControl);
var
  wiF, wiP, heF, heP : Integer;
begin
  wiF := Round(AForm.ClientWidth);
  heF := Round(AForm.ClientHeight);
  wiP := Round(AParent.Width);
  heP := Round(AParent.Height);

  AParent.BeginUpdate;

  AParent.Position.X := 0;
  AParent.Position.Y := 0;

  AParent.Width := wiF;
  AParent.Height := heF;

  AParent.EndUpdate;
end;

procedure fnGetClient(fromParent, AParent : TControl; bot, lef, rig, top : Single);
var
  wiF, wiP, heF, heP : Integer;
begin
  wiF := Round(fromParent.Width);
  heF := Round(fromParent.Height);
  wiP := Round(wiF - (lef + rig));
  heP := Round(heF - (top + bot));

  AParent.BeginUpdate;

  AParent.Position.X := lef;
  AParent.Position.Y := top;

  AParent.Width := wiP;
  AParent.Height := heP;

  AParent.EndUpdate;
end;


procedure fnPlaySound(med : TMediaPlayer; musik : String; stat : Boolean = False);
var
  xx : String;
begin
  if stat = True then begin
    try
      if med.State = TMediaState.Playing then
        med.Stop;

      if FileExists(musik) then begin
        med.FileName := musik;
        med.Play;
        med.Volume := StrToFloatDef(LoadSettingString('config', 'volume', ''), 0);

        Application.ProcessMessages;
      end;
    finally
      statMP := False;
    end;
  end else begin
    {if statMP = True then
      TaskMp.Cancel;

    statMP := True;}

    TaskMP := TTask.Create(procedure() begin
      try
        if med.State = TMediaState.Playing then
          med.Stop;

        if FileExists(musik) then begin
          med.FileName := musik;
          med.Play;
          med.Volume := StrToFloatDef(LoadSettingString('config', 'volume', ''), 0);
        end;
      finally
        statMP := False;
      end;
    end); TaskMP.Start;
  end;
end;
procedure fnSetFont(cmb : TComboBox; sz : Single);
var
  i: Integer;
begin
  for i := 0 to cmb.Items.Count - 1 do
  begin
    cmb.ListItems[i].Font.Size := sz;
    cmb.ListItems[i].StyledSettings := [];
  end;
end;

function MD5(str : string): String;
var
  obj: TIdHashMessageDigest5;
begin
  obj := TIdHashMessageDigest5.Create;
  try
    Result := obj.HashStringAsHex(str, IndyTextEncoding_UTF8);
  finally
    obj.Free;
  end;
end;

procedure fnSetPosXY(AParent : TControl; posX, posY : Single);
begin
  AParent.BeginUpdate;

  AParent.Position.X := posX;
  AParent.Position.Y := posY;

  AParent.EndUpdate;
end;

procedure fnSetPosXY(AParent : TControl; posX, posY, wi, he : Single);
begin
  AParent.BeginUpdate;

  AParent.Width := wi;
  AParent.Height := he;

  AParent.Position.X := posX;
  AParent.Position.Y := posY;

  AParent.EndUpdate;

  Application.ProcessMessages;
end;

function fnGetPosYDown(AParent : TControl; plus : Single): Single;
begin
  Result := AParent.Position.Y + AParent.Height + plus;
end;

function fnGetPosYDown(AParent : TControl): Single;
begin
  Result := AParent.Position.Y + AParent.Height;
end;

function fnGetPosYUp(AParent, ATarget : TControl; plus : Single): Single;
begin
  Result := AParent.Position.Y - ATarget.Height - plus;
end;

procedure fnCopyPosXY(AParent, ATarget : TControl);
begin
  ATarget.BeginUpdate;

  ATarget.Width := AParent.Width;
  ATarget.Height := AParent.Height;
  ATarget.Position.X := AParent.Position.X;
  ATarget.Position.Y := AParent.Position.Y;

  ATarget.EndUpdate;
end;

procedure fnClearString(stg : TStringGrid);
var
  bar: Integer;
  kol: Integer;
begin
  stg.BeginUpdate;

  for bar := 0 to stg.RowCount - 1 do
    for kol := 0 to stg.ColumnCount - 1 do
      stg.Cells[kol, bar] := '';

  stg.RowCount := 0;

  stg.EndUpdate;
end;

function fnDateMonthEnToId(str : String): String;
var
  hari : String;
begin
  hari := str;

  if hari = 'Sunday' then
    hari := 'Minggu'
  else if hari = 'Monday' then
    hari := 'Senin'
  else if hari = 'Tuesday' then
    hari := 'Selasa'
  else if hari = 'Wednesday' then
    hari := 'Rabu'
  else if hari = 'Thursday' then
    hari := 'Kamis'
  else if hari = 'Friday' then
    hari := 'Jumat'
  else if hari = 'Saturday' then
    hari := 'Sabtu';

  Result := hari;
end;

function fnDateDayEnToId(str : String): String;
var
  bulan : String;
begin
  bulan := str;

  if bulan = 'January' then
    bulan := 'Januari'
  else if bulan = 'February' then
    bulan := 'Februari'
  else if bulan = 'March' then
    bulan := 'Maret'
  else if bulan = 'April' then
    bulan := 'April'
  else if bulan = 'May' then
    bulan := 'Mei'
  else if bulan = 'June' then
    bulan := 'Juni'
  else if bulan = 'July' then
    bulan := 'Juli'
  else if bulan = 'August' then
    bulan := 'Agustus'
  else if bulan = 'September' then
    bulan := 'September'
  else if bulan = 'October' then
    bulan := 'Oktober'
  else if bulan = 'November' then
    bulan := 'November'
  else if bulan = 'December' then
    bulan := 'Desember';

  Result := bulan;
end;

function fnDateENTOID(str : TDateTime; stat : Boolean = False): String;
var
  hari, bulan : String;
begin
  hari := FormatDateTime('dddd', str);
  bulan := FormatDateTime('mmmm', str);

  hari := fnDateDayEnToId(hari);

  bulan := fnDateMonthEnToId(bulan);

  if stat = False then
    Result := Hari + ', ' + FormatDateTime('dd', str) + ' ' + bulan + ' ' + FormatDateTime('yyyy', str)
  else
    Result := FormatDateTime('dd', str) + ' ' + bulan + ' ' + FormatDateTime('yyyy', str);
end;

function fnGetClock(str : String):TDateTime;
begin
  Result := StrToDateTime(FormatDateTime('yyyy-mm-dd ', Now) + str);
end;

function fnGetColor(idx : Integer): Cardinal;
var
  col : Cardinal;
begin
  col := $FF000000;
  if idx = 0 then
    col := $FFF6BEDF
  else if idx = 1 then
    col := $FF7FDFBC
  else if idx = 2 then
    col := $FF7FBCDF
  else if idx = 3 then
    col := $FF3F5E6F
  else if idx = 4 then
    col := $FF802043
  else if idx = 5 then
    col := $FF401021
  else if idx = 6 then
    col := $FFC0A190
  else if idx = 7 then
    col := $FF191919
  else if idx = 8 then
    col := $FF082010
  else if idx = 9 then
    col := $FF3B75B1
  else if idx = 10 then
    col := $FFF6BEDF;

  Result := col;
end;

function fnGetDay: String;
var
  txt : String;
begin
  if Now < fnGetClock('10:00') then
    txt := 'Pagi'
  else if Now < fnGetClock('15:00') then
    txt := 'Siang'
  else if Now < fnGetClock('18:00') then
    txt := 'Sore'
  else if Now < fnGetClock('23:59') then
    txt := 'Malam';

  Result := txt;
end;

procedure setSizeFontCMB(cmb: TComboBox; sz: Single; stat : Boolean = False);
var
  i : Integer;
begin
  if cmb.Items.Count > 0 then begin
    for i := 0 to cmb.Items.Count - 1 do begin
      cmb.ListItems[i].Font.Size := sz;
      cmb.ListItems[i].FontColor := $FF3F424A;
      if stat = True then
        cmb.ListItems[i].Font.Style := [TFontStyle.fsBold];
      cmb.ListItems[i].StyledSettings := [];
    end;
  end;
  cmb.ItemIndex := 0;
end;

procedure setSizeFontCMB(cmb: TComboBox; sz: Single; align : TTextAlign; stat : Boolean = False);
var
  i : Integer;
begin
  if cmb.Items.Count > 0 then begin
    for i := 0 to cmb.Items.Count - 1 do begin
      cmb.ListItems[i].Font.Size := sz;
      cmb.ListItems[i].FontColor := $FF3F424A;
      cmb.ListItems[i].TextAlign := align;
      if stat = True then
        cmb.ListItems[i].Font.Style := [TFontStyle.fsBold];
      cmb.ListItems[i].StyledSettings := [];
    end;
  end;
  cmb.ItemIndex := 0;
end;

procedure fnLog(mem : TMemo; str : String);
begin
  TThread.Synchronize(nil, procedure begin
    mem.Lines.Add(str);
  end);
end;

function fnSetCMB(cmb: TComboBox; str: String): Integer;
var
  i: Integer;
  idx : Integer;
begin
  idx := 0;

  for i := 0 to cmb.Items.Count - 1 do begin
    //fnGetE('', cmb.Items[cmb.ItemIndex]);
    if UpperCase(cmb.Items[i]) = UpperCase(str) then begin
      idx := i;
      Break;
    end;
  end;

  Result := idx;
end;

function UpperCaseFirstLetter(const s : string) : string;
var
   i, tI : integer;
   str, txt : String;
begin
  if s = '' then
    txt := ''
  else begin
    str := s;

    {$IF DEFINED (ANDROID)}
      tI := 0;
    {$ELSEIF DEFINED (MSWINDOWS)}
      tI := 1;
    {$ENDIF}

    txt := '';
    for i := tI to Length(str) do begin
      if i = tI then
        txt := txt + UpperCase(str[i])
      else
        txt := txt + LowerCase(str[i]);
    end;
  end;

   Result := txt;
end;

function fnCreateID(str : String) : String;
var
  id : String;
begin
  id := str + '-' + FormatDateTime('DDMMYYYYHHNNSSZZ', Now);
  Result := id;
end;

function fnCreateID : String;
var
  id : String;
begin
  id := FormatDateTime('DDMMYYYYHHNNSSZZ', Now);
  Result := id;
end;

procedure fnCreateSpace(AParent : TControl; posX, posY, heigh : Single);
var
  lo : TLayout;
begin
  TThread.Synchronize(nil, procedure begin
    lo := TLayout.Create(AParent);
    lo.Parent := AParent;

    lo.Position.X := posX;
    lo.Position.Y := posY;

    lo.Width := AParent.Width;
    lo.Height := heigh;
  end);
end;

procedure fnExecActionList(AL : TActionList; idx : Integer);
begin
  AL.Actions[idx].Execute;
end;

procedure fnSetVisibleControl(AControl : TControl; stat : Boolean; usingThread : Boolean = False);
begin
  if usingThread = False then begin
    AControl.Visible := stat;
  end else begin
    TThread.Synchronize(nil, procedure begin
      AControl.Visible := stat;
    end);
  end;
end;

procedure fnDeleteRow(stg : TStringGrid; ARow : Integer);
var
  bar, kol: Integer;
begin
  for bar := ARow to stg.RowCount - 2 do
    for kol := 0 to stg.ColumnCount - 1 do
      stg.Cells[kol, bar] := stg.Cells[kol, bar + 1];

  stg.RowCount := stg.RowCount - 1;
end;

procedure fnOrderVert(ACtrl : TLayout; kol : integer; stat : Boolean = False);
var
  i, ii: Integer;
  xx, ww, hh, posX, posY, spc, totHH, posCenter : Single;
  bar : Integer;
  arrPosY : TStringList;
begin
  ii := 0;
  spc := 8;

  if ACtrl.ControlsCount = 0 then
    Exit;

  ww := ACtrl.Controls[0].Width;
  hh := ACtrl.Controls[0].Height;

  ww := (ww * kol) + spc;

  xx := (ACtrl.Width / 2) - (ww / 2);

  posX := xx;
  posY := spc;

  bar := 1;

  arrPosY := TStringList.Create;
  try
    arrPosY.Add(posY.ToString);
    for i := 0 to ACtrl.ControlsCount - 1 do begin
      fnSetPosXY(
        ACtrl.Controls[i],
        posX,
        posY);

      ACtrl.Controls[i].TagString := bar.ToString;

      Inc(ii);
      if ii = kol then begin
        if i <> ACtrl.ControlsCount - 1 then
          Inc(bar);

        posY := posY + spc + hh;
        posX := xx;

        arrPosY.Add(posY.ToString);

        ii := 0;
      end else begin
        posX := posX + spc + ACtrl.Controls[i].Width;
      end;
    end;

    if stat then begin
      if bar = 1 then
        totHH := hh * bar
      else
        totHH := hh * bar + (spc * (bar - 1));

      if totHH < ACtrl.Height then begin
        posCenter := (ACtrl.Height / 2) - (totHH / 2);

        for i := 0 to arrPosY.Count - 1 do begin
          xx := posCenter;
          arrPosY[i] := xx.ToString;

          posCenter := xx + spc + hh;
        end;

        posY := -1;
        xx := -1;
        bar := 0;
        for i := 0 to ACtrl.ControlsCount - 1 do begin
          ACtrl.Controls[i].Position.Y := StrToFloatDef(arrPosY[StrToIntDef(ACtrl.Controls[i].TagString, 0) - 1], 0);
        end;

      end;
    end;
  finally
    arrPosY.DisposeOf;
  end;
end;

procedure fnOrderVert(ACtrl : TVertScrollBox; kol : integer; stat : Boolean = False); overload;
var
  i, ii: Integer;
  xx, ww, hh, posX, posY, spc, totHH, posCenter : Single;
  bar : Integer;
  arrPosY : TStringList;
begin
  ii := 0;
  spc := 8;

  if ACtrl.Content.ControlsCount = 0 then
    Exit;

  ww := ACtrl.Content.Controls[0].Width;
  hh := ACtrl.Content.Controls[0].Height;

  ww := (ww * kol) + spc;

  xx := (ACtrl.Width / 2) - (ww / 2);

  posX := xx;
  posY := spc;

  bar := 1;

  arrPosY := TStringList.Create;
  try
    arrPosY.Add(posY.ToString);
    for i := 0 to ACtrl.Content.ControlsCount - 1 do begin
      fnSetPosXY(
        ACtrl.Content.Controls[i],
        posX,
        posY);

      ACtrl.Content.Controls[i].TagString := bar.ToString;

      Inc(ii);
      if ii = kol then begin
        if i <> ACtrl.Content.ControlsCount - 1 then
          Inc(bar);

        posY := posY + spc + hh;
        posX := xx;

        arrPosY.Add(posY.ToString);

        ii := 0;
      end else begin
        posX := posX + spc + ACtrl.Content.Controls[i].Width;
      end;
    end;

    if stat then begin
      if bar = 1 then
        totHH := hh * bar
      else
        totHH := hh * bar + (spc * (bar - 1));

      if totHH < ACtrl.Height then begin
        posCenter := (ACtrl.Height / 2) - (totHH / 2);

        for i := 0 to arrPosY.Count - 1 do begin
          xx := posCenter;
          arrPosY[i] := xx.ToString;

          posCenter := xx + spc + hh;
        end;

        posY := -1;
        xx := -1;
        bar := 0;
        for i := 0 to ACtrl.Content.ControlsCount - 1 do begin
          ACtrl.Content.Controls[i].Position.Y := StrToFloatDef(arrPosY[StrToIntDef(ACtrl.Content.Controls[i].TagString, 0) - 1], 0);
        end;

      end;
    end;
  finally
    arrPosY.DisposeOf;
  end;
end;

procedure setEdit(E : TEdit);
var
  L : TLabel;
  T : TFloatAnimation;
  i: Integer;
begin
  L := nil;

  for i := 0 to E.ControlsCount - 1 do begin
    if E.Controls[i] is TLabel then
      L := TLabel(E.Controls[i]);
  end;

  if not Assigned(L) then begin
    L := TLabel.Create(E);
    L.Parent := E;
    L.Width := E.Width;
    L.Text := E.TextPrompt;
    fnGetCenter(E, L);
    L.Position.X := 0;
    L.Font.Size := 13;
    //L.FontColor := FColor;
    L.Font.Style := [TFontStyle.fsBold];
    L.TextSettings.WordWrap := True;
    L.StyledSettings := [];

    L.Visible := False;

    T := TFloatAnimation.Create(L);
    T.Parent := L;
    T.Interpolation := TInterpolationType.Quadratic;
    T.PropertyName := 'Position.Y';
    T.Duration := 0.15;
    T.StartValue := L.Position.Y;
    T.StopValue := -17;

    T.Trigger := 'IsVisible=true';
    T.TriggerInverse := 'IsVisible=false';
  end;

  if E.Text <> '' then begin
    L.Visible := True;
  end else begin
    L.Visible := False;
  end;
end;

end.
