CD "C:\Users\SATAN\Desktop\omaPDFproject"
$table = Get-ChildItem -Path *pag*.pdf -Name
foreach ($row in $table)
{
  $pageno = [decimal]($row -replace "[^0-9]" , '')

  IF ($pageno % 2 -eq 0)
  {
    $rotation = 270
  }
  ELSE
  {
    $rotation = 90
  }
  $outfile = "rot" + $row
  $runthis = '.\cpdf.exe -rotateby ' + $rotation + ' ' + $row + ' -o rotated\' + $outfile
  Write-Output $runthis
  Invoke-Expression $runthis
}
