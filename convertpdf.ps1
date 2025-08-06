$coverpath = (Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "cover\cover_page.docx")

# 直接imagesフォルダに出力すると無応答になってしまったので、一度同一フォルダに出力してから移動するようにした
$workpath = [System.IO.Path]::ChangeExtension($coverpath, ".pdf") 
$outpath = (Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "images\cover_page.pdf")

if(Test-Path $workpath)
{
	echo $workpath を削除
	Remove-Item $workpath -Force
}

if(Test-Path $outpath)
{
	echo $outpath を削除
	Remove-Item $outpath -Force
}


$word = New-Object -comObject word.application
$word.Visible = $False
$doc = $Word.Documents.Open($coverpath)
$view = $word.ActiveDocument.ActiveWindow.View
$view.RevisionsView = 0  # RevisionsViewFinal
$view.ShowRevisionsAndComments = $False

echo ("word2pdfout: " + $outpath)
#$doc.SaveAs($outpath, [ref]17)
$doc.ExportAsFixedFormat($workpath, [Microsoft.Office.Interop.Word.WdExportFormat]::wdExportFormatPDF)

$doc.Close([ref]0)   # not save close

$word.Quit()

Move-Item -Force $workpath $outpath

