$coverpath = (Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "cover\cover_page.docx")

# ����images�t�H���_�ɏo�͂���Ɩ������ɂȂ��Ă��܂����̂ŁA��x����t�H���_�ɏo�͂��Ă���ړ�����悤�ɂ���
$workpath = [System.IO.Path]::ChangeExtension($coverpath, ".pdf") 
$outpath = (Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "images\cover_page.pdf")

if(Test-Path $workpath)
{
	echo $workpath ���폜
	Remove-Item $workpath -Force
}

if(Test-Path $outpath)
{
	echo $outpath ���폜
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

